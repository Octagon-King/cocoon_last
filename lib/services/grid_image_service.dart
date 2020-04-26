import 'package:cocoon/models/grid_image.dart';
import 'package:scoped_model/scoped_model.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../utils/constant.dart';

mixin GridImageService on Model {
  List<GridImage> _gridImageList = [];
  List<GridImage> get gridImageList => _gridImageList;

  bool _isLoadingGridImage = false;
  bool get isLoadingGridImage => _isLoadingGridImage;

  int getGridImageCount() {
    return _gridImageList.length;
  }

  Future<GridImage> fetchGridImages() async {
    var _gridImage;

    _isLoadingGridImage = true;
    notifyListeners();

    var response = await http
        .get(Constant.baseUrl + Constant.gridImages + Constant.jsonExt);

    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);
//      print(responseData);

      final List<GridImage> fetchedGridImages = [];
      responseData.forEach((String id, dynamic json) {
        if (responseData != null) {
          _gridImage = GridImage.fromJson(id, json);

          fetchedGridImages.add(_gridImage);
        }
      });

      _gridImageList = fetchedGridImages;

      print("LENGTH GridImages: ${_gridImageList.length}");
      _isLoadingGridImage = false;
      notifyListeners();
    } else {
      _isLoadingGridImage = false;
      notifyListeners();
      // throw Exception('failed to load data');
      print("failed to load Ibiza Grid Images");
    }
    return _gridImage;
  }

  void clearGridImages() {
    _gridImageList.clear();
    notifyListeners();
  }
}
