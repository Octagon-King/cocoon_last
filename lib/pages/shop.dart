import 'package:url_launcher/url_launcher.dart';

import 'package:flutter/material.dart';
import '../utils/strings.dart';

class ShopRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "assets/shop.jpg",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            iconTheme: IconThemeData(
              color: Colors.white70, //change your color here
            ),
            title: Text(Strings.shop,
              style: TextStyle(
                color: Colors.white70,
              ),
            ),
            backgroundColor: Colors.black87,
            elevation: 0,
          ),
          body: new Container(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new Text(
                  'MUSIC & MERCHANDISE',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 45, color: Colors.white),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    new OutlineButton(
                      color: Colors.transparent,
                      borderSide: BorderSide(color: Colors.white),
                      child: new Text(
                        'Bandcamp',
                        style: TextStyle(fontSize: 40.0, color: Colors.white),
                      ),
                      splashColor: Colors.cyan,
                      onPressed: _launchURL,
                      padding:
                          EdgeInsets.symmetric(vertical: 0.0, horizontal: 50.0),
                      shape: Border.all(width: 0.0, color: Colors.white),
                    ),
                    SizedBox(height: 10),
                    new OutlineButton(
                      color: Colors.transparent,
                      borderSide: BorderSide(color: Colors.white),
                      child: Text(
                        'Amazon',
                        style: TextStyle(fontSize: 40.0, color: Colors.white),
                      ),
                      splashColor: Colors.orange,
                      onPressed: _launchURLa,
                      padding: EdgeInsets.symmetric(
                        vertical: 0.0,
                        horizontal: 74.0,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

_launchURL() async {
  const url = 'https://cocoonrecordings.bandcamp.com/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchURLa() async {
  const url = 'https://www.amazon.de/s?me=A2VU6S59CR1OSK&fallThrough=1';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
