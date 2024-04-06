import 'dart:convert';

import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ChatBot extends StatefulWidget {
  const ChatBot({super.key});

  @override
  State<ChatBot> createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  ChatUser user = ChatUser(id: '1', firstName: 'USER');
  ChatUser bot = ChatUser(id: '2', firstName: 'CHAT BOT');

  List<ChatMessage> allMessage = [];
  List<ChatUser> allUsers = [];

  getData(ChatMessage m) async {
    allUsers.add(bot);
    allMessage.insert(0, m);

    setState(() {});
    print(m.text);
    try {
      const apiUrl =
          "https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent?key=AIzaSyDcbzPQ3CIR3hIptwugv1yhE7UYd0iyo5g";
      final header = {'Content-Type': 'application/json'};
      var request = {
        "contents": [
          {
            "parts": [
              {"text": m.text}
            ]
          }
        ]
      };
      var Response = await http.post(Uri.parse(apiUrl),
          headers: header, body: jsonEncode(request));
      if (Response.statusCode == 200) {
        var jsonResponse = json.decode(Response.body);
        // print(jsonResponse);
        // print(jsonResponse['candidates'][0]['content']['parts'][0]['text']);
        String reply =
            jsonResponse['candidates'][0]['content']['parts'][0]['text'];
        ChatMessage m1 =
            ChatMessage(text: jsonResponse['candidates'][0]['content']['parts'][0]['text'], user: bot, createdAt: DateTime.now());
        allMessage.insert(0, m1);
      }
    } catch (e) {
      return Future.error(e.toString());
    }
    allUsers.remove(bot);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DashChat(
          currentUser: user,
          onSend: (ChatMessage m) {
            getData(m);
          },
          messages: allMessage),
    );
  }
}

// AIzaSyDcbzPQ3CIR3hIptwugv1yhE7UYd0iyo5g
