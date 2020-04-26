class CarauselImage {
  String id, imgUrl, link;

  CarauselImage({this.id, this.imgUrl, this.link});

  factory CarauselImage.fromJson(String id, Map<String, dynamic> json) {
    return CarauselImage(id: id, imgUrl: json['imgUrl'], link: json['link']);
  }
}
