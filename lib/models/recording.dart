class Recording {
  String id, imgUrl, link, title;

  Recording({this.id, this.imgUrl, this.link, this.title});

  factory Recording.fromJson(String id, Map<String, dynamic> json) {
    return Recording(
      id: id,
      imgUrl: json['imgUrl'],
      link: json['link'],
      title: json['title'],
    );
  }
}
