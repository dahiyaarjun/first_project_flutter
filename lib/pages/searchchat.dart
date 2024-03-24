import 'package:first_project_flutter/backend/laravel.dart';
import 'package:first_project_flutter/models/search_model.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:lottie/lottie.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Search> {
  final TextEditingController _message = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ChatGpt'),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
        // elevation: 100,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,

        // height: 500,
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FutureBuilder(
                future: apiResponse.apiSearch(
                    context: context, message: _message.text),
                builder: (BuildContext context,
                    AsyncSnapshot<SearchModel> snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return Lottie.asset('assets/images/2.json',
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width * 0.4,
                          reverse: false,
                          repeat: true,
                          fit: BoxFit.cover);

                    case ConnectionState.done:
                      if (snapshot.hasError) {
                        return Text('${snapshot.error}');
                      } else if (snapshot.hasData) {
                        return Expanded(
                          child: Center(
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              // color: Colors.white,
                              padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.01,
                                right: MediaQuery.of(context).size.width * 0.01,
                                top: MediaQuery.of(context).size.height * 0.1,
                                // bottom:
                                //     MediaQuery.of(context).size.height *
                                //         0.1
                              ),
                              child: SingleChildScrollView(
                                  child: Text(
                                '${snapshot.data?.content}',
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 18),
                              )),
                            ),
                          ),
                        );
                      } else {
                        return const Text('NO DATA FOUND');
                      }
                    default:
                      return const Text('NO DATA FOUND');
                  }
                },
              ),
              Container(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.01,
                  bottom: MediaQuery.of(context).size.height * 0.01,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: TextField(
                          controller: _message,
                          decoration: InputDecoration(
                              hintText: 'How can I help you?',
                              filled: true,
                              fillColor: Colors.white,
                              focusedBorder: const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xff1a80e5))),
                              hintStyle:
                                  const TextStyle(color: Color(0xff788998)),
                              enabledBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  borderSide:
                                      BorderSide(color: Color(0xffe8ecf1))),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width * 0.025,
                                  vertical: MediaQuery.of(context).size.height *
                                      0.018),
                              border: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)))),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 2.0),
                      child: CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.amber[400],
                        child: IconButton(
                            onPressed: () {
                              setState(() {});
                            },
                            icon: const Icon(Icons.send_sharp)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
