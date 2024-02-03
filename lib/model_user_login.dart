class ModelUserLogin {
  String? message;
  String? token;
  String? status;

  ModelUserLogin({this.message, this.token, this.status});

  ModelUserLogin.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    token = json['token'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['token'] = this.token;
    data['status'] = this.status;
    return data;
  }
}