import 'package:cocoon/models/carausel_image.dart';
import 'package:scoped_model/scoped_model.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../utils/constant.dart';

mixin CarauselImageService on Model {
  List<CarauselImage> _carauselImageList = [];
  List<CarauselImage> get carauselImageList => _carauselImageList;

  bool _isLoadingCarauselImage = false;
  bool get isLoadingCarauselImage => _isLoadingCarauselImage;

  int getCarauselImageCount() {
    return _carauselImageList.length;
  }

  Future<CarauselImage> fetchCarauselImages() async {
    var _carauselImage;

    _isLoadingCarauselImage = true;
    notifyListeners();

    var response = await http
        .get(Constant.baseUrl + Constant.carauselImages + Constant.jsonExt);

    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);
//      print(responseData);

      final List<CarauselImage> fetchedCarauselImages = [];
      responseData.forEach((String id, dynamic json) {
        if (responseData != null) {
          _carauselImage = CarauselImage.fromJson(id, json);

          fetchedCarauselImages.add(_carauselImage);
        }
      });

      _carauselImageList = fetchedCarauselImages;

      print("LENGTH CarauselImages: ${_carauselImageList.length}");
      _isLoadingCarauselImage = false;
      notifyListeners();
    } else {
      _isLoadingCarauselImage = false;
      notifyListeners();
      // throw Exception('failed to load data');
      print("failed to load Ibiza Carausel Images");
    }
    return _carauselImage;
  }

  void clearCarauselImages() {
    _carauselImageList.clear();
    notifyListeners();
  }
}
