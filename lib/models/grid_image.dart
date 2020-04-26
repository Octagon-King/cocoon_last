class GridImage {
  String id, imgUrl, link, title;

  GridImage({this.id, this.imgUrl, this.link, this.title});

  factory GridImage.fromJson(String id, Map<String, dynamic> json) {
    return GridImage(
        id: id,
        imgUrl: json['imgUrl'],
        link: json['link'],
        title: json['title']);
  }
}
