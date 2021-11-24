import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:ku_contest/Firebase/database_manager.dart';
import 'package:ku_contest/widget/show_image/show_image.dart';
import 'package:ku_contest/widget/vote_widget/vote_widget.dart';

class PostScreen extends StatelessWidget {
  String bibid;
  PostScreen({Key? key, required this.bibid}) : super(key: key);

  late double rating = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        children: <Widget>[
          const SizedBox(height: 40),
          Container(
            height: size.height * 0.8,
            width: double.infinity,
            child: ShowImage(bibid),
          ),
          Center(
            child: Column(
              children: [
                const SizedBox(height: 20),
                Text(
                  // ignore: unnecessary_null_comparison
                  bibid == null ? "bibid is null" : "bibid = " + bibid,
                ),
                VoteWidget(
                  bibid: bibid,
                  size: size,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
