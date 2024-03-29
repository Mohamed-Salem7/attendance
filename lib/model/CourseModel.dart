class CourseModel {
  String? courseId;
  String? drName;
  String? lectureDate;
  List<String>? member;
  String? name;
  String? timingFromLecture;
  String? timingToLecture;

  CourseModel(
      {this.courseId,
        this.drName,
        this.lectureDate,
        this.member,
        this.name,
        this.timingFromLecture,
        this.timingToLecture});

  CourseModel.fromJson(Map<String, dynamic> json) {
    courseId = json['courseId'];
    drName = json['drName'];
    lectureDate = json['lectureDate'];
    member = json['member'].cast<String>();
    name = json['name'];
    timingFromLecture = json['timingFromLecture'];
    timingToLecture = json['timingToLecture'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['courseId'] = this.courseId;
    data['drName'] = this.drName;
    data['lectureDate'] = this.lectureDate;
    data['member'] = this.member;
    data['name'] = this.name;
    data['timingFromLecture'] = this.timingFromLecture;
    data['timingToLecture'] = this.timingToLecture;
    return data;
  }
}
