class SearchModel {
  String? content;

  SearchModel({this.content});

  SearchModel.fromJson(Map<String, dynamic> json) {
    content = json['content'];
  }

  get length => null;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['content'] = this.content;
    return data;
  }
}