class LoginModel {
  String? token;
  String? tokenType;
  User? user;

  LoginModel({this.token, this.tokenType, this.user});

  LoginModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    tokenType = json['token_type'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['token_type'] = this.tokenType;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  String? mobile;
  String? type;
  String? avatar;
  String? dob;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
        this.name,
        this.email,
        this.mobile,
        this.type,
        this.avatar,
        this.dob,
        this.createdAt,
        this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    type = json['type'];
    avatar = json['avatar'];
    dob = json['dob'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['type'] = this.type;
    data['avatar'] = this.avatar;
    data['dob'] = this.dob;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
