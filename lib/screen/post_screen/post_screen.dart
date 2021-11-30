import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ku_contest/constant.dart';
import 'package:ku_contest/widget/vote_widget/vote_widget.dart';

class PostScreen extends StatefulWidget {
  String bibid;
  String uid;
  String redirect;
  PostScreen(
      {Key? key,
      required this.bibid,
      required this.uid,
      required this.redirect})
      : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: const Text('KU contest '),
        ),
        body: ListView(
          children: <Widget>[
            Center(
              child: Column(
                children: [
                  CarouselSlider.builder(
                    options: CarouselOptions(
                      enlargeCenterPage: true,
                      enableInfiniteScroll: false,
                      pageSnapping: false,
                      //autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                    ),
                    itemCount: 2,
                    itemBuilder: (context, index, realIndex) {
                      final urlImade = "https://ku.ac.th/contest/img/" +
                          widget.bibid +
                          "_" +
                          (index + 1).toString() +
                          ".jpg";
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Stack(
                          fit: StackFit.expand,
                          children: <Widget>[
                            CachedNetworkImage(
                              imageUrl: urlImade,
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  Text(
                    // ignore: unnecessary_null_comparison
                    widget.bibid == null
                        ? "bibid is null"
                        : "bibid = " + widget.bibid,
                  ),
                  VoteWidget(
                    bibid: widget.bibid,
                    uid: widget.uid,
                    size: size,
                    redirect: widget.redirect,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
