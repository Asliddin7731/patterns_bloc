//
// class Post2{
//   int? id;
//   String? title;
//   String? body;
//   String? userId;
//
//   Post2({this.id, this.title, this.body, this.userId});
//
//   Post2.fromJson(Map<String, dynamic> json)
//     : userId = json["userId"],
//     id= json["id"],
//     title= json["title"],
//     body= json["body"];
//
//   Map<String, dynamic> toJson() => {
//     "userId": userId,
//     "id": id,
//     "title": title,
//     "body": body,
//   };
// }