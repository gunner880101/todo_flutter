class TodoInfo {
  int? id;
  String? title;
  String? content;
  bool? isCompleted;

  TodoInfo({this.id, this.title, this.content, this.isCompleted});

  TodoInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
    isCompleted = json['isCompleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['content'] = this.content;
    data['isCompleted'] = this.isCompleted;
    return data;
  }
}
