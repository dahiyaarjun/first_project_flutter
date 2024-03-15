class ResponseModel {

  // int? userId;
  int? id;
  String? name;
  String? email;

  ResponseModel({
      // this.userId,
      this.id,
      this.name,
      this.email,});

  ResponseModel.fromJson(dynamic json) {
    // // userId = json['userId'];
    id = json['id'];
    name = json['name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    // // map['userId'] = userId;
    map['id'] = id;
    map['name'] = name;
    map['email'] = email;
    return map;
  }
}
