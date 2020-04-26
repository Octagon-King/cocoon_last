import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'dart:async';

import '../services/main_model.dart';
import '../utils/strings.dart';
import '../screens/ibiza_item_list.dart';

class IbizaPage extends StatefulWidget {
  final MainModel model;

  IbizaPage(this.model);

  @override
  _IbizaPageState createState() => _IbizaPageState();
}

class _IbizaPageState extends State<IbizaPage> {
  @override
  void initState() {
    super.initState();

    if (widget.model.ibizaList.length == 0) loadData();
  }

  Future loadData() async {
    await widget.model.fetchIbizas();
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
            title: Text(Strings.ibiza,
              style: TextStyle(
                color: Colors.white70,
              ),
            ),
            backgroundColor: Colors.black87,
          ),
          body: Container(
            child: model.isLoadingIbiza
                ? Center(child: CircularProgressIndicator())
                : model.ibizaList.length == 0
                    ? Center(child: Text("There are no Ibiza list."))
                    : RefreshIndicator(
                        // backgroundColor: Colors.white,
                        // color: Colors.green,
                        onRefresh: () => model.fetchIbizas(),
                        child: ListView.builder(
                          itemCount: model.getIbizaCount(),
                          itemBuilder: (context, i) {
                            var ibiza = model.ibizaList[i];
                            return IbizaItemList(ibiza);
                          },
                        )),
          ));
    });
  }
}
