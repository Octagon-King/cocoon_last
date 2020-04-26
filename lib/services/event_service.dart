import 'package:scoped_model/scoped_model.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/event.dart';
import '../utils/constant.dart';

mixin EventService on Model {
  List<Event> _eventList = [];
  List<Event> get eventList => _eventList;

  bool _isLoadingEvent = false;
  bool get isLoadingEvent => _isLoadingEvent;

  int getEventCount() {
    return _eventList.length;
  }

  Future<Event> fetchEvents() async {
    var _event;

    _isLoadingEvent = true;
    notifyListeners();

    var response =
        await http.get(Constant.baseUrl + Constant.events + Constant.jsonExt);

    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);
//      print(responseData);

      final List<Event> fetchedEvents = [];
      responseData.forEach((String eventId, dynamic json) {
        if (responseData != null) {
          _event = Event.fromJson(eventId, json);

          fetchedEvents.add(_event);
        }
      });

      _eventList = fetchedEvents;

      print("LENGTH EVENT: ${_eventList.length}");
      _isLoadingEvent = false;
      notifyListeners();
    } else {
      _isLoadingEvent = false;
      notifyListeners();
      // throw Exception('failed to load data');
      print("failed to load Ibiza Events");
    }
    return _event;
  }

  void clearEvent() {
    _eventList.clear();
    notifyListeners();
  }
}
