import 'dart:html' as html;
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class VoteWidget extends StatefulWidget {
  Size size;
  String bibid;
  String uid;
  String redirect;
  VoteWidget(
      {Key? key,
      required this.size,
      required this.bibid,
      required this.uid,
      required this.redirect})
      : super(key: key);

  @override
  _VoteWidgetState createState() => _VoteWidgetState();
}

class _VoteWidgetState extends State<VoteWidget> {
  late final _ratingController;
  late double _rating;
  double _initialRating = 0;
  TextEditingController commentController = TextEditingController();

  final Future<FirebaseApp> firebase = Firebase.initializeApp();
  CollectionReference _voteCollection =
      FirebaseFirestore.instance.collection("vote");
  CollectionReference _consenCollection =
      FirebaseFirestore.instance.collection("consen");

  @override
  void initState() {
    super.initState();
    _ratingController = TextEditingController(text: '3.0');
    _rating = _initialRating;
  }

  void htmlOpenLink() {
    html.window.open(widget.redirect, '_self');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Text(
          'Rating : $_rating',
        ),
        RatingBar.builder(
          initialRating: 0,
          minRating: 0,
          direction: Axis.horizontal,
          allowHalfRating: false,
          itemCount: 5,
          itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
          itemBuilder: (context, _) => const Icon(
            Icons.star,
            color: Colors.amber,
          ),
          updateOnDrag: true,
          onRatingUpdate: (rating) => setState(() {
            _rating = rating;
            //print(rating);
          }),
        ),
        const SizedBox(height: 20),
        Container(
          width: widget.size.width * 0.6,
          child: TextFormField(
            keyboardType: TextInputType.multiline,
            maxLines: null,
            minLines: 1,
            decoration: const InputDecoration(
              labelText: 'แสดงความคิดเห็น(ถ้ามี)',
              border: OutlineInputBorder(),
            ),
            controller: commentController,
          ),
        ),
        const SizedBox(height: 20),
        Container(
          width: widget.size.width * 0.3,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: const Color(0xffB2BB1E),
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 22),
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('ยืนยันการลงคะแนน'),
                    content: RatingBarIndicator(
                      rating: _rating,
                      itemBuilder: (context, index) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      itemCount: 5,
                      itemSize: 25.0,
                      unratedColor: Colors.amber.withAlpha(50),
                      direction: Axis.horizontal,
                    ),
                    actions: <Widget>[
                      TextButton(
                        child: const Text('ตกลง'),
                        onPressed: () async {
                          await _voteCollection.add(
                            {
                              "time": DateTime.now(),
                              "bibid": widget.bibid,
                              "uid": widget.uid,
                              "rating": _rating,
                              "comment": commentController.text,
                            },
                          ).whenComplete(() async {
                            await _consenCollection.doc(widget.bibid).update({
                              widget.uid: _rating,
                            });
                          });
                          htmlOpenLink();
                        },
                      ),
                      TextButton(
                        child: const Text('ยกเลิก'),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      )
                    ],
                  );
                },
              );
            },
            child: const Text('ลงคะแนน'),
          ),
        ),
      ],
    );
  }
}
