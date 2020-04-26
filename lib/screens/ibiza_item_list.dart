import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/ibiza.dart';

class IbizaItemList extends StatelessWidget {
  final Ibiza ibiza;

  IbizaItemList(this.ibiza);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 250,
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          elevation: 3,
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
      onTap: () => _launchURL(ibiza?.link ?? ""),
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
                ibiza.imgUrl.isNotEmpty ? ibiza.imgUrl : '',
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
                ibiza?.title ?? "",
                style: Theme.of(context)
                    .textTheme
                    .subhead
                    .copyWith(fontSize: 18, color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }

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
              FontAwesomeIcons.ticketAlt,
              size: 18,
              color: Colors.redAccent,
            ),
            label: Text(
              " Buy Ticket Here",
              style: Theme.of(context)
                  .textTheme
                  .button
                  .copyWith(fontSize: 16, color: Colors.redAccent),
            ),
            onPressed: () {
//                  Share.share(this.newsletter.title + ' \n' + this.newsletter.link);
              _launchURL(ibiza?.link ?? "");
            },
          )
        ],
      ),
    ));
  }

  // Widget _buildDesc(BuildContext context) {
  //   return Container(
  //     margin: EdgeInsets.symmetric(horizontal: 15),
  //     // color: Colors.red,
  //     child: Text(
  //       ibiza?.desc ?? "",
  //       maxLines: 3,
  //       overflow: TextOverflow.ellipsis,
  //       style: Theme.of(context)
  //           .textTheme
  //           .body2
  //           .copyWith(color: Colors.black87, fontSize: 13, height: 1.2),
  //     ),
  //   );
  // }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}