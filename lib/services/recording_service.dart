import 'package:cocoon/models/recording.dart';
import 'package:scoped_model/scoped_model.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../utils/constant.dart';

mixin RecordingService on Model {
  List<Recording> _recordingList = [];
  List<Recording> get recordingList => _recordingList;

  bool _isLoadingRecordings = false;
  bool get isLoadingRecording => _isLoadingRecordings;

  int getRecordingsCount() {
    return _recordingList.length;
  }

  Future<Recording> fetchRecordings() async {
    var _recording;

    _isLoadingRecordings = true;
    notifyListeners();

    var response = await http
        .get(Constant.baseUrl + Constant.recordings + Constant.jsonExt);

    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);
//      print(responseData);

      final List<Recording> fetchedRecordings = [];
      responseData.forEach((String id, dynamic json) {
        if (responseData != null) {
          _recording = Recording.fromJson(id, json);

          fetchedRecordings.add(_recording);
        }
      });

      _recordingList = fetchedRecordings;

      print("LENGTH recordings: ${_recordingList.length}");
      _isLoadingRecordings = false;
      notifyListeners();
    } else {
      _isLoadingRecordings = false;
      notifyListeners();
      // throw Exception('failed to load data');
      print("failed to load Recordings");
    }
    return _recording;
  }

  void clearRecordings() {
    _recordingList.clear();
    notifyListeners();
  }
}
