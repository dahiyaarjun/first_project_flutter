class LoginDetails {
  List<UserDetails>? userDetails;
  String? message;
  String? status;

  LoginDetails({this.userDetails, this.message, this.status});

  LoginDetails.fromJson(Map<String, dynamic> json) {
    if (json['User Details'] != null) {
      userDetails = <UserDetails>[];
      json['User Details'].forEach((v) {
        userDetails!.add(new UserDetails.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }
  // List<UserDetails> getList(){
  //   return this.userDetails;
  // }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.userDetails != null) {
      data['User Details'] = this.userDetails!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}

class UserDetails {
  int? id;
  String? name;
  String? email;
  Null? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;

  UserDetails(
      {this.id,
      this.name,
      this.email,
      this.emailVerifiedAt,
      this.createdAt,
      this.updatedAt});

  UserDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}