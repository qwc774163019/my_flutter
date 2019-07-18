import 'dart:ui';

import 'package:flutter/material.dart';

import 'EventChannelPage.dart';
import 'MyHomePage.dart';

void main() => runApp(MyApp(window.defaultRouteName));

Widget MyApp(String defaultRouteName){
  switch(defaultRouteName){
    case '/method_route':
      return MyHomePage(title: 'MyHomePage',);
    case '/event_route':
      return EventChannelPage(title: 'EventChannelPage',);
    default:
//      return Center(
//        child: Text('Unknown route:$defaultRouteName',textDirection: TextDirection.ltr),
//      );
      return MyHomePage(title: 'MyHomePage',);
  }
}




