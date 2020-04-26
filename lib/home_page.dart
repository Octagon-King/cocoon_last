import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cocoon/models/grid_image.dart';
import 'package:cocoon/models/recording.dart';
import 'package:cocoon/pages/newsletter_page.dart';
import 'package:cocoon/pages/policy_page.dart';
import 'package:cocoon/utils/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:toast/toast.dart';

import './services/main_model.dart';
import './pages/newsletter_page.dart';
import './pages/ibiza_page.dart';
import './pages/event_page.dart';
import 'pages/artist_page.dart';
import 'pages/shop.dart';
import 'utils/strings.dart';

class HomePage extends StatefulWidget {
  final MainModel model;

  HomePage(this.model);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    if (widget.model.carauselImageList.length == 0 &&
        !widget.model.isLoadingCarauselImage) loadData();
    if (widget.model.gridImageList.length == 0 &&
        !widget.model.isLoadingGridImage) loadGridImages();
    if (widget.model.recordingList.length == 0 &&
        !widget.model.isLoadingRecording) loadRecording();
  }

  Future loadData() async {
    widget.model.fetchCarauselImages();
  }

  Future loadGridImages() async {
    widget.model.fetchGridImages();
  }

  Future loadRecording() async {
    widget.model.fetchRecordings();
  }

  @override
  Widget build(BuildContext context) {
    Drawer _drawer = Drawer(
      child: Container(
        color: Colors.black87,
        child: ListView(
          padding: EdgeInsets.all(0),
          children: <Widget>[
//          drawer header
            DrawerHeader(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(80.0),
                ),
                image: DecorationImage(
                  image: AssetImage("assets/drawer.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(),
            ),

//          drawer body

            ListTile(
              title: Text(
                Strings.newsletter,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NewsletterPage(widget.model)));
              },
              leading: Icon(
                Icons.format_indent_decrease,
                color: Colors.white,
              ),
            ),

            ListTile(
              title: Text(
                Strings.ibiza,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => IbizaPage(widget.model)));
              },
              leading: Icon(
                const IconData(0xe900, fontFamily: 'tree'),
                color: Colors.white,
              ),
            ),

            ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EventPage(widget.model)));
              },
              title: Text(
                Strings.event,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              leading: Icon(
                const IconData(0xe900, fontFamily: 'events'),
                color: Colors.white,
              ),
            ),

            ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ArtistRoute()));
              },
              title: Text(
                Strings.artist,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              leading: Icon(
                const IconData(0xe900, fontFamily: 'dj'),
                color: Colors.white,
              ),
            ),

            ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ShopRoute()));
              },
              title: Text(
                Strings.shop,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              leading: Icon(
                const IconData(0xe900, fontFamily: 'cart'),
                color: Colors.white,
              ),
            ),

            Divider(),

            ListTile(
              title: Text(
                Strings.socialm,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),

            ListTile(
              onTap: () {
                lunchApp('fb://page/132954121040', 'fb://profile/132954121040',
                    'https://www.facebook.com/COCOON.OFFICIAL');
              },
              title: Text(
                Strings.facebook,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              leading:
                  Icon(FontAwesomeIcons.facebook, color: Colors.blueAccent),
            ),

            ListTile(
              onTap: () {
                lunchApp(
                    'intent://instagram.com/_u/cocoon_official/#Intent;package=com.instagram.android;scheme=https;end',
                    'instagram://user?username=cocoon_official',
                    'https://www.instagram.com/cocoon_official/');
              },
              title: Text(
                Strings.instagram,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              leading: Icon(FontAwesomeIcons.instagram, color: Colors.orange),
            ),

            ListTile(
                onTap: () {
                  lunchApp(
                      'twitter://user?screen_name=cocoon_official',
                      'twitter://user?screen_name=cocoon_official',
                      'https://twitter.com/cocoon_official');
                },
                title: Text(
                  Strings.twitter,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                leading: Icon(FontAwesomeIcons.twitter,
                    color: Colors.lightBlueAccent)),

            ListTile(
              onTap: () {
                lunchApp(
                    'intent://www.youtube.com/user/cocoonrecordings#Intent;package=com.google.android.youtube;scheme=https;end',
                    'vnd.youtube://user/cocoonrecordings',
                    'https://www.youtube.com/user/cocoonrecordings');
              },
              title: Text(
                Strings.youtube,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              leading: Icon(FontAwesomeIcons.youtube, color: Colors.red),
            ),
            Divider(),
            ListTile(
              title: Text(
                Strings.policies,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PolicyPage(isPolicy: true),
                  ),
                );
              },
              title: Text(
                Strings.policy,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              leading: Icon(FontAwesomeIcons.userShield, color: Colors.grey),
            ),
            ListTile(
              onTap: () {
                fetchSite(Constant.legalNotice);
              },
              title: Text(
                Strings.legal,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              leading:
                  Icon(FontAwesomeIcons.balanceScaleLeft, color: Colors.grey),
            ),
          ],
          //header
        ),
      ),
    );

    return ScopedModelDescendant<MainModel>(builder: (context, child, model) {
      return Scaffold(
        backgroundColor: Colors.white10,
        appBar: AppBar(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
          )),
          iconTheme: IconThemeData(
            color: Colors.white70, //change your color here
          ),
          backgroundColor: Colors.black26,
          title: Text(
            Strings.cocoon,
            style: TextStyle(
              color: Colors.white70,
            ),
          ),
        ),
        drawer: _drawer,
        body: RefreshIndicator(
          onRefresh: () async {
            model.fetchCarauselImages();
            model.fetchGridImages();
            model.fetchRecordings();
          },
          child: ListView(
            children: <Widget>[
              _sliderSection(context, model),
              Container(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  Strings.merch,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
              _gridViewSection(context, model),
              SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  'Recordings',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
              _recordingSection(context, model),
            ],
          ),
        ),
      );
    });
  }

  Container _sliderSection(BuildContext context, MainModel model) {
    return Container(
      child: ConstrainedBox(
        constraints: BoxConstraints.loose(
          Size(
            MediaQuery.of(context).size.width,
            250,
          ),
        ),
        child: model.isLoadingCarauselImage
            ? Center(child: CircularProgressIndicator())
            : model.carauselImageList.length == 0
                ? Center(child: Text("There are no carausel images."))
                : Swiper(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return CachedNetworkImage(
                        imageUrl: model.carauselImageList[index].imgUrl,
                        placeholder: (context, url) =>
                            Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                        fadeOutDuration: Duration(seconds: 0),
                        fadeInDuration: Duration(seconds: 0),
                        fit: BoxFit.cover,
                      );
                    },
                    itemCount: model.carauselImageList.length,
                    pagination: SwiperPagination(margin: EdgeInsets.all(5.0)),
                    autoplay: true,
                    onTap: (int index) {
                      fetchSite(model.carauselImageList[index].link);
                    },
                  ),
      ),
    );
  }

  _gridViewSection(BuildContext context, MainModel model) {
    return model.isLoadingGridImage
        ? Center(child: CircularProgressIndicator())
        : model.gridImageList.length == 0
            ? Center(child: Text("There are no grid items"))
            : Container(
                height: 150,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: model.gridImageList.length,
                  itemBuilder: (context, i) {
                    var item = model.gridImageList[i];
                    return _grideItem(item);
                  },
                ),
              );
  }

  _recordingSection(BuildContext context, MainModel model) {
    return model.isLoadingRecording
        ? Center(child: CircularProgressIndicator())
        : model.recordingList.length == 0
            ? Center(child: Text("There are no recordings"))
            : Container(
                height: 170,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: model.recordingList.length,
                  itemBuilder: (context, i) {
                    var item = model.recordingList[i];
                    return _recordingItem(item);
                  },
                ),
              );
  }

  void lunchApp(String android, String ios, String link) async {
    if (Platform.isAndroid && await canLaunch(android)) {
      await launch(android);
    } else if (Platform.isIOS && await canLaunch(ios)) {
      await launch(ios);
    } else if (await canLaunch(link)) {
      await launch(link);
    } else {
      _toast('Cannot open app', context);
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

  void fetchSite(link) async {
    if (await canLaunch(link)) {
      await launch(link);
    } else {
      _toast('Cannot open link', context);
    }
  }

  Widget _grideItem(GridImage item) {
    return Card(
      color: Colors.transparent,
      margin: EdgeInsets.only(left: 5, right: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      elevation: 0,
      child: Container(
        width: 100,
        height: 140,
        color: Colors.transparent,
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: Container(
                child: CachedNetworkImage(
                  imageUrl: item.imgUrl,
                  placeholder: (context, url) =>
                      Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                  fadeOutDuration: Duration(seconds: 0),
                  fadeInDuration: Duration(seconds: 0),
                  fit: BoxFit.cover,
                  height: 140,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                margin: EdgeInsets.only(left: 20, right: 20, bottom: 2),
                height: 20,
                decoration: BoxDecoration(
                  color: Colors.grey.shade900,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade900,
                      blurRadius: 0.0,
                      spreadRadius: 0.0,
                    )
                  ],
                ),
                child: FlatButton(
                  textColor: Colors.white70,
                  onPressed: () {
                    fetchSite(item.link);
                  },
                  child: Text('Buy'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _recordingItem(Recording item) {
    return Card(
      color: Colors.transparent,
      margin: EdgeInsets.only(left: 5, right: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      // elevation: 5,
      child: Container(
        width: 150,
        height: 170,
        color: Colors.transparent,
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: CachedNetworkImage(
                imageUrl: item.imgUrl,
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Icon(Icons.error),
                fadeOutDuration: Duration(seconds: 0),
                fadeInDuration: Duration(seconds: 0),
                fit: BoxFit.cover,
                height: 150,
                width: double.infinity,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                margin: EdgeInsets.only(left: 35, right: 35, bottom: 2),
                height: 20,
                decoration: BoxDecoration(
                  color: Colors.grey.shade900,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade900,
                      blurRadius: 5.0,
                      spreadRadius: 1.0,
                    )
                  ],
                ),
                child: FlatButton(
                  textColor: Colors.white70,
                  onPressed: () {
                    fetchSite(item.link);
                  },
                  child: Text('Buy'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
