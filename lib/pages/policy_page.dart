import 'dart:async';

import 'package:cocoon/utils/constant.dart';
import 'package:cocoon/utils/strings.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:web_vuw/web_vuw.dart';

class PolicyPage extends StatefulWidget {
  final bool isPolicy;

  PolicyPage({this.isPolicy});
  @override
  _PolicyPageState createState() => _PolicyPageState();
}

class _PolicyPageState extends State<PolicyPage> {
  final Completer<WebVuwController> _controller = Completer<WebVuwController>();
  StreamSubscription _ssWebVuwEvents;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<WebVuwController>(
      future: _controller.future,
      builder:
          (BuildContext context, AsyncSnapshot<WebVuwController> snapshot) {
        final webViewReady = snapshot.connectionState == ConnectionState.done;
        final controller = snapshot.data;

        if (webViewReady) {
          _ssWebVuwEvents = controller.onEvents().listen((events) {});
        }

        return Scaffold(
          key: _scaffoldKey,
          backgroundColor: Colors.white10,
          appBar: AppBar(
            iconTheme: IconThemeData(
              color: Colors.white70, //change your color here
            ),
            backgroundColor: Colors.black26,
            title: Text(
              (widget.isPolicy || widget.isPolicy == null)
                  ? Strings.policy
                  : Strings.legal,
              style: TextStyle(
                color: Colors.white70,
              ),
            ),
          ),
          body: WebVuw(
            initialUrl: (widget.isPolicy || widget.isPolicy == null)
                ? Constant.privacyPolicy
                : Constant.legalNotice,
            enableJavascript: true,
            pullToRefresh: true,
            userAgent: 'userAgent',
            gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>[
              Factory<OneSequenceGestureRecognizer>(
                () => EagerGestureRecognizer(),
              ),
            ].toSet(),
            javaScriptMode: JavaScriptMode.unrestricted,
            onWebViewCreated: (WebVuwController webViewController) {
              _controller.complete(webViewController);
            },
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    if (_ssWebVuwEvents != null) _ssWebVuwEvents.cancel();
    super.dispose();
  }
}
