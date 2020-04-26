import 'package:cocoon/models/artist.dart';
import 'package:cocoon/pages/artist_details.dart';
import 'package:cocoon/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:url_launcher/url_launcher.dart';
import '../utils/strings.dart';

class ArtistRoute extends StatefulWidget {
  @override
  _ArtistRouteState createState() => _ArtistRouteState();
}

class _ArtistRouteState extends State<ArtistRoute> {
  final List<Artist> _artistList = Constant.artistList;
  // final GlobalKey scaffoldKey =

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white70, //change your color here
        ),
        title: Text(
          Strings.artist,
          style: TextStyle(
            color: Colors.white70,
          ),
        ),
        backgroundColor: Colors.black87,
      ),
      body: GridView.count(
        // physics: NeverScrollableScrollPhysics(),
        crossAxisCount: (MediaQuery.of(context).size.width ~/ 180).toInt(),
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        padding: EdgeInsets.all(5.0),
        // shrinkWrap: true,
        children: _artistList.map((item) => _grideItem(item, context)).toList(),
      ),
    );
  }

  Widget _grideItem(Artist item, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ArtistDetails(item)),
        );
      },
      child: Card(
        elevation: 0,
        color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(2.0),
              child: Container(
                height: 130,
                child: Hero(
                  tag: item.id.toString(),
                  child: Image.asset(
                    item.imgUrl,
                    fit: BoxFit.cover,
                    height: double.infinity,
                    width: double.infinity,
                  ),
                ),
              ),
            ),
            Text(
              item.name.toString(),
              style: TextStyle(
                // fontSize: 18,
                color: Colors.white70,
              ),
            ),
            Text(
              item.address.toString(),
              style: TextStyle(
                color: Colors.white70,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _toast(String message, BuildContext context) {
    Toast.show(
      message,
      context,
      duration: Toast.LENGTH_SHORT,
      gravity: Toast.BOTTOM,
    );
  }

  void fetchSite(link, BuildContext context) async {
    if (await canLaunch(link)) {
      await launch(link);
    } else {
      _toast('Cannot open link', context);
    }
  }
}
