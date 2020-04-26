import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'dart:async';

import '../services/main_model.dart';
import '../utils/strings.dart';
import '../screens/newsletter_item_list.dart';

class NewsletterPage extends StatefulWidget {
  final MainModel model;

  NewsletterPage(this.model);

  @override
  _NewsletterPageState createState() => _NewsletterPageState();
}

class _NewsletterPageState extends State<NewsletterPage> {
  @override
  void initState() {
    super.initState();

    if (widget.model.newsletterList.length == 0) loadData();
  }

  Future loadData() async {
    await widget.model.fetchNewsletters();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
      builder: (context, child, model) {
        return Scaffold(
          backgroundColor: Colors.white10,
          appBar: AppBar(
            iconTheme: IconThemeData(
              color: Colors.white70, //change your color here
            ),
            title: Text(Strings.newsletter,
              style: TextStyle(
                color: Colors.white70,
              ),
            ),
            backgroundColor: Colors.black87,
            elevation: 0,
          ),
          body: Container(
            child: model.isLoadingNews
                ? Center(child: CircularProgressIndicator())
                : model.newsletterList.length == 0
                    ? Center(child: Text("There are no newsletter."))
                    : RefreshIndicator(
                        // backgroundColor: Colors.white,
                        // color: Colors.green,
                        onRefresh: () => model.fetchNewsletters(),
                        child: ListView.builder(
                          itemCount: model.getNewsletterCount(),
                          itemBuilder: (context, i) {
                            var news = model.newsletterList[i];
                            return NewsletterItemList(news);
                          },
                        ),
                      ),
          ),
        );
      },
    );
  }
}
