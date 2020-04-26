import 'package:scoped_model/scoped_model.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/ibiza.dart';
import '../utils/constant.dart';

mixin IbizaService on Model {
  List<Ibiza> _ibizaList = [];
  List<Ibiza> get ibizaList => _ibizaList;

  bool _isLoadingIbiza = false;
  bool get isLoadingIbiza => _isLoadingIbiza;

  int getIbizaCount() {
    return _ibizaList.length;
  }

  Future<Ibiza> fetchIbizas() async {
    var _ibiza;

    _isLoadingIbiza = true;
    notifyListeners();

    var response =
        await http.get(Constant.baseUrl + Constant.ibiza + Constant.jsonExt);

    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);
//      print(responseData);

      final List<Ibiza> fetchedIbizas = [];
      responseData.forEach((String ibizaId, dynamic json) {
        if (responseData != null) {
          _ibiza = Ibiza.fromJson(ibizaId, json);

          fetchedIbizas.add(_ibiza);
        }
      });

      _ibizaList = fetchedIbizas;

      print("LENGTH IBIZA: ${_ibizaList.length}");
      _isLoadingIbiza = false;
      notifyListeners();
    } else {
      _isLoadingIbiza = false;
      notifyListeners();
      // throw Exception('failed to load data');
      print("failed to load Ibiza Events");
    }
    return _ibiza;
  }

  void clearIbiza() {
    _ibizaList.clear();
    notifyListeners();
  }
}
