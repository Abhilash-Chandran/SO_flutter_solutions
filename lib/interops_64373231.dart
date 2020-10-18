@JS('window')
library whatever;

import 'dart:js';

import 'package:js/js.dart';
import 'package:flutter/material.dart';

@JS('theObjectCall') // Accessing method getCurrentPosition from Geolocation API
external void theJsObjectCall(ObjectYouWantToSend theObject);

void someJsCallWithObject() {
  ObjectYouWantToSend oywts = ObjectYouWantToSend(a: 'xyz');
  theJsObjectCall(oywts);
}

@JS()
@anonymous
class ObjectYouWantToSend {
  external factory ObjectYouWantToSend({
    String a,
  });
  external String get a;
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: Center(
            child: FlatButton(
              onPressed: someJsCallWithObject,
              child: Text('Call The js Function.'),
            ),
          ),
        ),
      ),
    );
  }
}
