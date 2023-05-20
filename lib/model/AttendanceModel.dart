class AttendanceModel {
  String? courseID;
  String? data;
  String? time;

  AttendanceModel({this.courseID, this.data, this.time});

  AttendanceModel.fromJson(Map<String, dynamic> json) {
    courseID = json['courseID'];
    data = json['data'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['courseID'] = this.courseID;
    data['data'] = this.data;
    data['time'] = this.time;
    return data;
  }
}
