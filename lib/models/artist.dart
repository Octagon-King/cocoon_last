class Artist {
  String id,
      name,
      imgUrl,
      fb,
      insta,
      residentAdvisor,
      scoundCloud,
      dates,
      vimeo,
      website,
      address,
      aboutMe,
      pressKit;

  Artist({
    this.id,
    this.name,
    this.fb,
    this.imgUrl,
    this.insta,
    this.residentAdvisor,
    this.scoundCloud,
    this.dates,
    this.vimeo,
    this.website,
    this.address,
    this.pressKit,
    this.aboutMe,
  });

  factory Artist.fromJson(String id, Map<String, dynamic> json) {
    return Artist(
      id: id,
      name: json['name'],
      fb: json['fb'],
      imgUrl: json['imgUrl'],
      insta: json['insta'],
      residentAdvisor: json['residentAdvisor'],
      scoundCloud: json['scoundCloud'],
      vimeo: json['vimeo'],
      website: json['website'],
      dates: json['dates'],
      address: json['address'],
      pressKit: json['pressKit'],
      aboutMe: json['aboutMe'],
    );
  }
}
