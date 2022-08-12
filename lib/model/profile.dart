class Profile {
  bool? success;
  String? message;
  Data? data;

  Profile({this.success, this.message, this.data});

  Profile.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  Student? student;

  Data({this.student});

  Data.fromJson(Map<String, dynamic> json) {
    student =
    json['student'] != null ? new Student.fromJson(json['student']) : null;

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.student != null) {
      data['student'] = this.student!.toJson();
    }

    return data;
  }
}

class Student {
  int? id;
  String? studentName;
  String? email;
  String? studentPhone;
  String? studentAddress;
  String? createdAt;
  String? updatedAt;
  List<Enrolls>? enrolls;

  Student(
      {this.id,
        this.studentName,
        this.email,
        this.studentPhone,
        this.studentAddress,
        this.createdAt,
        this.updatedAt,
        this.enrolls});

  Student.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    studentName = json['student_name'];
    email = json['email'];
    studentPhone = json['student_phone'];
    studentAddress = json['student_address'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    if (json['Enrolls'] != null) {
      enrolls = <Enrolls>[];
      json['Enrolls'].forEach((v) {
        enrolls!.add(new Enrolls.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['student_name'] = this.studentName;
    data['email'] = this.email;
    data['student_phone'] = this.studentPhone;
    data['student_address'] = this.studentAddress;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.enrolls != null) {
      data['Enrolls'] = this.enrolls!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Enrolls {
  int? id;
  int? studentId;
  int? courseId;
  String? status;
  String? createdAt;

  Enrolls(
      {this.id, this.studentId, this.courseId, this.status, this.createdAt});

  Enrolls.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    studentId = json['student_id'];
    courseId = json['course_id'];
    status = json['status'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['student_id'] = this.studentId;
    data['course_id'] = this.courseId;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    return data;
  }
}
