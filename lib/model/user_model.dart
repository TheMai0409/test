class UserModel {
  int? id;
  int? userId;
  String? body;
  String? title;

  UserModel({this.id, this.userId, this.body, this.title});

  UserModel.fromJson(Map<String, dynamic> json) {
    userId = json["userId"];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }
}
