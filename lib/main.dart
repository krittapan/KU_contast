import 'package:flutter/material.dart';
import 'package:ku_contest/constant.dart';
import 'package:ku_contest/screen/post_screen/post_screen.dart';

void main() {
  String? bibid = Uri.base.queryParameters["bibid"];
  runApp(MyApp(bibid: bibid!));
}

class MyApp extends StatefulWidget {
  String bibid;
  MyApp({Key? key, required this.bibid}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "KU Contest",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: PostScreen(
        bibid: widget.bibid,
      ),
    );
  }
}
