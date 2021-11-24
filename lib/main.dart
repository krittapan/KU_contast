import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ku_contest/constant.dart';
import 'package:ku_contest/screen/post_screen/post_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  String? bibid = Uri.base.queryParameters["bibid"];
  await Firebase.initializeApp();
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
      // ignore: unnecessary_null_comparison
      home: widget.bibid == null
          ? const Scaffold(
              body: Center(
                child: Text('null bibid'),
              ),
            )
          : PostScreen(bibid: widget.bibid),
    );
  }
}
