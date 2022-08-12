class ExamModel {
  bool? success = false;
  String? message;
  Data? data;

  ExamModel({this.success, this.message, this.data});

  ExamModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  Enroll? enroll;
  Revision? revision;
  UserExam? userExam;

  Data({this.enroll, this.revision, this.userExam});

  Data.fromJson(Map<String, dynamic> json) {
    enroll =
    json['enroll'] != null ? new Enroll.fromJson(json['enroll']) : null;
    revision = json['revision'] != null
        ? new Revision.fromJson(json['revision'])
        : null;
    userExam = json['userExam'] != null
        ? new UserExam.fromJson(json['userExam'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.enroll != null) {
      data['enroll'] = this.enroll!.toJson();
    }
    if (this.revision != null) {
      data['revision'] = this.revision!.toJson();
    }
    if (this.userExam != null) {
      data['userExam'] = this.userExam!.toJson();
    }
    return data;
  }
}

class Enroll {
  String? status;
  int? id;
  int? studentId;
  String? courseId;
  String? createdAt;

  Enroll({this.status, this.id, this.studentId, this.courseId, this.createdAt});

  Enroll.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    id = json['id'];
    studentId = json['student_id'];
    courseId = json['course_id'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['id'] = this.id;
    data['student_id'] = this.studentId;
    data['course_id'] = this.courseId;
    data['createdAt'] = this.createdAt;
    return data;
  }
}

class Revision {
  bool? reviewed;
  int? id;
  int? studentId;
  int? examId;
  Null? studentDegree;
  int? enrollId;
  String? createdAt;

  Revision(
      {this.reviewed,
        this.id,
        this.studentId,
        this.examId,
        this.studentDegree,
        this.enrollId,
        this.createdAt});

  Revision.fromJson(Map<String, dynamic> json) {
    reviewed = json['reviewed'];
    id = json['id'];
    studentId = json['student_id'];
    examId = json['exam_id'];
    studentDegree = json['student_degree'];
    enrollId = json['enroll_id'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['reviewed'] = this.reviewed;
    data['id'] = this.id;
    data['student_id'] = this.studentId;
    data['exam_id'] = this.examId;
    data['student_degree'] = this.studentDegree;
    data['enroll_id'] = this.enrollId;
    data['createdAt'] = this.createdAt;
    return data;
  }
}

class UserExam {
  bool? examTaken;
  bool? expired;
  int? id;
  int? revisionId;
  int? examCode;
  String? examQuestions;
  String? examAnswers;
  String? eat;
  String? createdAt;

  UserExam(
      {this.examTaken,
        this.expired,
        this.id,
        this.revisionId,
        this.examCode,
        this.examQuestions,
        this.examAnswers,
        this.eat,
        this.createdAt});

  UserExam.fromJson(Map<String, dynamic> json) {
    examTaken = json['exam_taken'];
    expired = json['expired'];
    id = json['id'];
    revisionId = json['revision_id'];
    examCode = json['exam_code'];
    examQuestions = json['exam_questions'];
    examAnswers = json['exam_answers'];
    eat = json['eat'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['exam_taken'] = this.examTaken;
    data['expired'] = this.expired;
    data['id'] = this.id;
    data['revision_id'] = this.revisionId;
    data['exam_code'] = this.examCode;
    data['exam_questions'] = this.examQuestions;
    data['exam_answers'] = this.examAnswers;
    data['eat'] = this.eat;
    data['createdAt'] = this.createdAt;
    return data;
  }
}
