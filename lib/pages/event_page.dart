import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'dart:async';

import '../services/main_model.dart';
import '../utils/strings.dart';
import '../screens/event_item_list.dart';

class EventPage extends StatefulWidget {
  final MainModel model;

  EventPage(this.model);

  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  @override
  void initState() {
    super.initState();

    if (widget.model.eventList.length == 0) loadData();
  }

  Future loadData() async {
    await widget.model.fetchEvents();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(builder: (context, child, model) {
      return Scaffold(
          backgroundColor: Colors.white10,
          appBar: AppBar(
            iconTheme: IconThemeData(
              color: Colors.white70, //change your color here
            ),
            title: Text(
              Strings.event,
              style: TextStyle(
                color: Colors.white70,
              ),
            ),
            backgroundColor: Colors.black87,
          ),
          body: Container(
            child: model.isLoadingEvent
                ? Center(child: CircularProgressIndicator())
                : model.eventList.length == 0
                    ? Center(child: Text("There are no Event list."))
                    : RefreshIndicator(
                        // backgroundColor: Colors.white,
                        // color: Colors.green,
                        onRefresh: () => model.fetchEvents(),
                        child: ListView.builder(
                          itemCount: model.getEventCount(),
                          itemBuilder: (context, i) {
                            var event = model.eventList[i];
                            return EventItemList(event);
                          },
                        ),
                      ),
          ));
    });
  }
}
