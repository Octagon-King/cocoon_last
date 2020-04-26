class Event {
  String id, title, desc, imgUrl, link;

  Event({this.id, this.title, this.desc, this.imgUrl, this.link});

  factory Event.fromJson(String id, Map<String, dynamic> json) {
    return Event(
        id: id,
        title: json['title'],
        desc: json['desc'],
        imgUrl: json['imgUrl'],
        link: json['link']);
  }
}
