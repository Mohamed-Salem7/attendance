class StudentCourseModel {
  String? avatar;
  String? name;
  String? uId;

  StudentCourseModel({this.avatar, this.name, this.uId});

  StudentCourseModel.fromJson(Map<String, dynamic> json) {
    avatar = json['avatar'];
    name = json['name'];
    uId = json['uId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['avatar'] = this.avatar;
    data['name'] = this.name;
    data['uId'] = this.uId;
    return data;
  }
}
