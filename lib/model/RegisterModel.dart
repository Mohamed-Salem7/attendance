class RegisterModel {
  Register? data;

  RegisterModel({this.data});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Register.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Register {
  String? name;
  String? email;
  String? mobile;
  int? type;
  String? dob;
  String? updatedAt;
  String? createdAt;
  int? id;

  Register(
      {this.name,
        this.email,
        this.mobile,
        this.type,
        this.dob,
        this.updatedAt,
        this.createdAt,
        this.id});

  Register.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    type = json['type'];
    dob = json['dob'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['type'] = this.type;
    data['dob'] = this.dob;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
