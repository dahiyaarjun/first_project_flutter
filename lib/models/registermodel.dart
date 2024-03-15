class RegisterModel {

  // int? userId;
  // int? id;
  String? status;
  String? message;

  RegisterModel({
      // this.userId,
      // this.id,
      this.status,
      this.message,});

  RegisterModel.fromJson(dynamic json) {
    // userId = json['userId'];
    // id = json['id'];
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    // // map['userId'] = userId;
    // map['id'] = id;
    map['status'] = status;
    map['message'] = message;
    return map;
  }
}
