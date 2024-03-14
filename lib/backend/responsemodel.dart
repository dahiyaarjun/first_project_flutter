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
// class ResponseModel {
//     ResponseModel({
//         required this.id,
//         required this.name,
//         required this.email,
//         required this.emailVerifiedAt,
//         required this.createdAt,
//         required this.updatedAt,
//     });

//     final int? id;
//     final String? name;
//     final String? email;
//     final dynamic emailVerifiedAt;
//     final DateTime? createdAt;
//     final DateTime? updatedAt;

//     factory ResponseModel.fromJson(Map<String, dynamic> json){ 
//         return ResponseModel(
//             id: json["id"],
//             name: json["name"],
//             email: json["email"],
//             emailVerifiedAt: json["email_verified_at"],
//             createdAt: DateTime.tryParse(json["created_at"] ?? ""),
//             updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
//         );
//     }

// }
