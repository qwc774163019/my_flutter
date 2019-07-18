import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EventChannelPage extends StatefulWidget {
  final String title;

  EventChannelPage({Key key, this.title}) : super(key: key);

  @override
  _EventChannelState createState() {
    // TODO: implement createState
    return new _EventChannelState();
  }
}

class _EventChannelState extends State<EventChannelPage> {
  static const eventChannel = const EventChannel('to_flutter');
  String _result = '';
  StreamSubscription _streamSubscription;

  @override
  void initState() {
    super.initState();
//    _getEventResult();
  }

  @override
  void dispose() {
    super.dispose();
    if (_streamSubscription != null) {
      _streamSubscription.cancel();
    }
  }

  _getEventResult() async {
    try {
      _streamSubscription =
          eventChannel.receiveBroadcastStream().listen((data) {
        setState(() {
          _result = data;
        });
      });
    } on PlatformException catch (e) {
      setState(() {
        _result = "event get data err: '${e.message}'.";
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'EventChannelPage',
      home: new Scaffold(
        appBar: AppBar(title: Text(widget.title),),
        body: Center(
          child: Text('${_result}',style: TextStyle(color: Colors.lightBlue,fontSize: 18.0),),
        ),
        floatingActionButton: FloatingActionButton(onPressed: _incrementCounter,child: Icon(Icons.photo),),
      ),

    );
  }

  void _incrementCounter() {
    _getEventResult();
  }
}
