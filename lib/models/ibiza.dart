class Ibiza {
  String id, title, desc, imgUrl, link;

  Ibiza({this.id, this.title, this.desc, this.imgUrl, this.link});

  factory Ibiza.fromJson(String ibizaId, Map<String, dynamic> json) {
    return Ibiza(
        id: ibizaId,
        title: json['title'],
        desc: json['desc'],
        imgUrl: json['imgUrl'],
        link: json['link']);
  }
}