class GetCategoryId {
  bool? success;
  String? message;
  Data? data;

  GetCategoryId({success, message, data});

  GetCategoryId.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = success;
    data['message'] = message;
    if (data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? categoryName;
  String? imageUrl;
  List<Courses>? courses;

  Data({id, categoryName, imageUrl, courses});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryName = json['category_name'];
    imageUrl = json['image_url'];
    if (json['Courses'] != null) {
      courses = <Courses>[];
      json['Courses'].forEach((v) {
        courses!.add(new Courses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['category_name'] = categoryName;
    data['image_url'] = imageUrl;
    if (courses != null) {
      data['Courses'] = courses!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Courses {
  int? id;
  int? categoryId;
  String? courseName;
  String? courseLevel;
  int? adminId;
  int? enrollable;
  int? entryExamId;
  int? exam1;
  int? exam2;
  int? exam3;
  int? finalProject;
  String? imageUrl;
  Admin? admin;

  Courses(
      {id,
        categoryId,
        courseName,
        courseLevel,
        adminId,
        enrollable,
        entryExamId,
        exam1,
        exam2,
        exam3,
        finalProject,
        imageUrl,
        admin});

  Courses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    courseName = json['course_name'];
    courseLevel = json['course_level'];
    adminId = json['admin_id'];
    enrollable = json['enrollable'];
    entryExamId = json['entryExamId'];
    exam1 = json['exam1'];
    exam2 = json['exam2'];
    exam3 = json['exam3'];
    finalProject = json['finalProject'];
    imageUrl = json['image_url'];
    admin = json['Admin'] != null ? new Admin.fromJson(json['Admin']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['category_id'] = categoryId;
    data['course_name'] = courseName;
    data['course_level'] = courseLevel;
    data['admin_id'] = adminId;
    data['enrollable'] = enrollable;
    data['entryExamId'] = entryExamId;
    data['exam1'] = exam1;
    data['exam2'] = exam2;
    data['exam3'] = exam3;
    data['finalProject'] = finalProject;
    data['image_url'] = imageUrl;
    if (admin != null) {
      data['Admin'] = admin!.toJson();
    }
    return data;
  }
}

class Admin {
  String? adminName;
  String? email;

  Admin({adminName, email});

  Admin.fromJson(Map<String, dynamic> json) {
    adminName = json['admin_name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['admin_name'] = adminName;
    data['email'] = email;
    return data;
  }
}
