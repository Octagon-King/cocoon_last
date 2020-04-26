import 'package:scoped_model/scoped_model.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/newsletter.dart';
import '../utils/constant.dart';

mixin NewsletterService on Model {
  List<Newsletter> _newsletterList = [];
  List<Newsletter> get newsletterList => _newsletterList;

  bool _isLoadingNews = false;
  bool get isLoadingNews => _isLoadingNews;

  int getNewsletterCount() {
    return _newsletterList.length;
  }

  Future<Newsletter> fetchNewsletters() async {
    var _news;

    _isLoadingNews = true;
    notifyListeners();

    var response = await http
        .get(Constant.baseUrl + Constant.newsletters + Constant.jsonExt);

    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);
//      print(responseData);

      final List<Newsletter> fetchedNewsletters = [];
      responseData.forEach((String newsletterId, dynamic json) {
        if (responseData != null) {
          _news = Newsletter.fromJson(newsletterId, json);

          fetchedNewsletters.add(_news);
        }
      });

      _newsletterList = fetchedNewsletters;

      print("LENGTH NEWSLETTERS: ${_newsletterList.length}");
      _isLoadingNews = false;
      notifyListeners();
    } else {
      _isLoadingNews = false;
      notifyListeners();
      // throw Exception('failed to load data');
      print("failed to load newsletters");
    }
    return _news;
  }

  void clearNewsletters() {
    _newsletterList.clear();
    notifyListeners();
  }
}
