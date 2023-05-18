class GetCourseToStudentModel {
  String? courseId;
  String? drName;
  String? name;
  String? timeJoined;

  GetCourseToStudentModel(
      {this.courseId, this.drName, this.name, this.timeJoined});

  GetCourseToStudentModel.fromJson(Map<String, dynamic> json) {
    courseId = json['courseId'];
    drName = json['drName'];
    name = json['name'];
    timeJoined = json['time joined'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['courseId'] = this.courseId;
    data['drName'] = this.drName;
    data['name'] = this.name;
    data['time joined'] = this.timeJoined;
    return data;
  }
}
