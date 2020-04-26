import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share/share.dart';
import '../models/newsletter.dart';

class NewsletterItemList extends StatelessWidget {
  final Newsletter newsletter;

  NewsletterItemList(this.newsletter);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 250,
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          elevation: 5,
          child: Column(
            children: <Widget>[
              _buildImageTitle(context),
              // SizedBox(height: 7),
              // _buildDesc(context),
              // SizedBox(height: 7),
              _buildLikeShareBtn(
                context,
              ),
            ],
          ),
        ),
      ),
      onTap: () => _launchURL(newsletter?.link ?? ""),
    );
  }

  Widget _buildImageTitle(BuildContext context) {
    return Container(
      height: 210,
      child: Stack(
        children: <Widget>[
          CachedNetworkImage(
            imageUrl:
                // 'https://cdn-img-v2.ibnc.vn/uploadv2/web/64/6468/news/2018/01/25/03/21/1516850029_announcement.jpg',
                newsletter.imgUrl.isNotEmpty ? newsletter.imgUrl : '',
            placeholder: (context, url) =>
                Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => new Icon(Icons.error),
            fadeOutDuration: new Duration(seconds: 0),
            fadeInDuration: new Duration(seconds: 0),
            fit: BoxFit.cover,
            height: 210,
            width: double.infinity,
          ),
          Positioned(
            bottom: 0.0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Colors.black45),
              child: Text(
                newsletter?.title ?? "",
                style: Theme.of(context)
                    .textTheme
                    .subhead
                    .copyWith(fontSize: 22, color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }

  // Widget _buildDesc(BuildContext context) {
  //   return Container(
  //     margin: EdgeInsets.symmetric(horizontal: 15),
  //     // color: Colors.red,
  //     child: Text(
  //       newsletter?.desc ?? "",
  //       maxLines: 3,
  //       overflow: TextOverflow.ellipsis,
  //       style: Theme.of(context)
  //           .textTheme
  //           .body2
  //           .copyWith(color: Colors.black87, fontSize: 13, height: 1.2),
  //     ),
  //   );
  // }

  Widget _buildLikeShareBtn(BuildContext context) {
    return Expanded(
        child: Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: <Widget>[
//          IconButton(
//            icon: Icon(Icons.favorite_border, color: Colors.black),
//            onPressed: () {},
//          ),
          FlatButton.icon(
            icon: Icon(
              Icons.share,
              size: 18,
              color: Colors.redAccent,
            ),
            label: Text(
              "Share",
              style: Theme.of(context)
                  .textTheme
                  .button
                  .copyWith(fontSize: 16, color: Colors.redAccent),
            ),
            onPressed: () {
              Share.share(this.newsletter.title + ' \n' + this.newsletter.link);
            },
          )
        ],
      ),
    ));
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
