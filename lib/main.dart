import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ku_contest/constant.dart';
import 'package:ku_contest/screen/post_2_screen/post_2_screen.dart';
import 'package:ku_contest/screen/post_screen/post_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  String? bibid = Uri.base.queryParameters["bibid"];
  String? uid = Uri.base.queryParameters["uid"];
  String? redirect = Uri.base.queryParameters["redirect"];
  await Firebase.initializeApp();
  runApp(MyApp(
    bibid: bibid!,
    uid: uid!,
    redirect: redirect!,
  ));
}

class MyApp extends StatefulWidget {
  String bibid;
  String uid;
  String redirect;
  MyApp(
      {Key? key,
      required this.bibid,
      required this.uid,
      required this.redirect})
      : super(key: key);

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
      // ignore: unnecessary_null_comparison
      home: widget.uid == '0'
          ? Post2Screen(
              bibid: widget.bibid,
              redirect: widget.redirect,
            )
          : PostScreen(
              bibid: widget.bibid,
              uid: widget.uid,
              redirect: widget.redirect,
            ),
    );
  }
}
