import 'package:cocoon/models/artist.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cocoon/pages/artist_page.dart';
import 'package:cocoon/utils/constant.dart';



class ArtistDetails extends StatelessWidget {
  final Artist artist;
  ArtistDetails(this.artist);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      body: ListView(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          imageSection(context),
          aboutMe(context),
          socialMedia(context),
        ],
      ),
    );
  }

  void fetchSite(link, BuildContext context) async {
    if (await canLaunch(link)) {
      await launch(link);
    } else {
      _toast('Cannot open link', context);
    }
  }

  _toast(String message, BuildContext context) {
    Toast.show(
      message,
      context,
      duration: Toast.LENGTH_SHORT,
      gravity: Toast.BOTTOM,
    );
  }

  aboutMe( BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 0.5),
      decoration: BoxDecoration(
        color: Colors.grey.shade800,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(60.0),
        ),
      ),
      child: Opacity(
        opacity: 0.7,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.black87,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(60.0),
            ),
          ),
          child: ExpansionTile(
            backgroundColor: Colors.transparent,
            initiallyExpanded: true,
            trailing: Icon(
              Icons.keyboard_arrow_down,
              color: Colors.white,
            ),
            title: Text(
              'About Me',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 10),
                child: Text(artist.aboutMe.toString(),
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 30),
              OutlineButton(
                onPressed: () {
                  fetchSite(artist.pressKit, context);
                },
                borderSide: BorderSide(color: Colors.white),
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'press kit'.toUpperCase(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              OutlineButton(
                onPressed: () {
                  fetchSite(
                      'https://one.systemonesoftware.com/webform.aspx?key=f985e5b358a849528ac828f4a6c1ce59',
                      context);
                },
                borderSide: BorderSide(color: Colors.white),
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'book artist'.toUpperCase(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  imageSection(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(60.0),
      ),
      child: Container(
        height: 300,
        child: Stack(
          children: <Widget>[
            Container(
              child: Hero(
                tag: artist.id.toString(),
                child: Image.asset(
                  artist.imgUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
            ),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.grey.shade900,
                    ],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      artist.name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  socialMedia(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              fetchSite(artist.fb, context);
            },
            child: Container(
              height: 50,
              width: 50,
              margin: EdgeInsets.only(right: 20),
              child: Image.asset('assets/facebook.png'),
            ),
          ),
          (artist.insta != null && artist.insta.isNotEmpty)
              ? GestureDetector(
                  onTap: () {
                    fetchSite(artist.insta, context);
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    margin: EdgeInsets.only(right: 20),
                    child: Image.asset('assets/instagram.png'),
                  ),
                )
              : Container(),
          (artist.scoundCloud != null && artist.scoundCloud.isNotEmpty)
              ? GestureDetector(
                  onTap: () {
                    fetchSite(artist.scoundCloud, context);
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    margin: EdgeInsets.only(right: 20),
                    child: Image.asset('assets/soundcloud_copy.png'),
                  ),
                )
              : Container(),
          (artist.residentAdvisor != null && artist.residentAdvisor.isNotEmpty)
              ? GestureDetector(
                  onTap: () {
                    fetchSite(artist.residentAdvisor, context);
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    margin: EdgeInsets.only(right: 20),
                    child: Image.asset('assets/resident.png'),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
