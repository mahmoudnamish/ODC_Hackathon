class AllCourses {
  bool? success;
  String? message;
  List<Data>? data;

  AllCourses({success, message, data});

  AllCourses.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add( Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();

    }
    return data;
  }
}

class Data {
  int? id;
  String? courseName;
  String? courseLevel;
  int? enrollable;
  int? entryExamId;
  int? exam1;
  int? exam2;
  int? exam3;
  int? finalProject;
  String? createdAt;
  Category? category;
  Admin? admin;
  String?image_url;

  Data(
      {id,
        courseName,
        courseLevel,
        enrollable,
        entryExamId,
        exam1,
        exam2,
        exam3,
        finalProject,
        createdAt,
        category,
        admin,
        image_url
      });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    courseName = json['course_name'];
    courseLevel = json['course_level'];
    enrollable = json['enrollable'];
    entryExamId = json['entryExamId'];
    exam1 = json['exam1'];
    exam2 = json['exam2'];
    exam3 = json['exam3'];
    finalProject = json['finalProject'];
    createdAt = json['createdAt'];
    image_url = json['image_url'];
    category = json['Category'] != null
        ?  Category.fromJson(json['Category'])
        : null;
    admin = json['Admin'] != null ? Admin.fromJson(json['Admin']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['course_name'] = courseName;
    data['course_level'] = courseLevel;
    data['enrollable'] = enrollable;
    data['entryExamId'] = entryExamId;
    data['exam1'] = exam1;
    data['exam2'] = exam2;
    data['exam3'] = exam3;
    data['image_url'] = image_url;
    data['finalProject'] = finalProject;
    data['createdAt'] = createdAt;
    if (category != null) {
      data['Category'] = category!.toJson();
    }
    if (admin != null) {
      data['Admin'] = admin!.toJson();
    }
    return data;
  }
}

class Category {
  int? id;
  String? categoryName;
  String? imageUrl;

  Category({id, categoryName, imageUrl});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryName = json['category_name'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['category_name'] = categoryName;
    data['image_url'] = imageUrl;
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
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['admin_name'] = adminName;
    data['email'] = email;
    return data;
  }
}
