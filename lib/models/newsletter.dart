class Newsletter {
  String id, title, desc, imgUrl, link;

  Newsletter({this.id, this.title, this.desc, this.imgUrl, this.link});

  factory Newsletter.fromJson(String newsletterId, Map<String, dynamic> json) {
    return Newsletter(
        id: newsletterId,
        title: json['title'],
        desc: json['desc'],
        imgUrl: json['imgUrl'],
        link: json['link']);
  }
}
