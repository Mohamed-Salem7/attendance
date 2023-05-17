class UserData {
  String? name;
  String? email;
  String? mobile;
  String? type;
  String? avatar;

  UserData({this.name, this.email, this.mobile, this.type, this.avatar});

  UserData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    type = json['type'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['type'] = this.type;
    data['avatar'] = this.avatar;
    return data;
  }
}
