import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class PostScreen extends StatefulWidget {
  String bibid;
  PostScreen({Key? key, required this.bibid}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  late double rating = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: SizedBox(
              height: size.height * 0.6,
              width: double.infinity,
              child: CachedNetworkImage(
                imageUrl:
                    'https://kucontest.net/wp-content/uploads/2021/10/LINE_ALBUM_%E0%B9%82%E0%B8%9B%E0%B9%80%E0%B8%95%E0%B8%AD%E0%B8%A3%E0%B9%8C%E0%B9%82%E0%B8%84%E0%B8%A3%E0%B8%87%E0%B8%81%E0%B8%B2%E0%B8%A3%E0%B8%A3%E0%B8%B2%E0%B8%87%E0%B8%A7%E0%B8%B1%E0%B8%A5%E0%B8%84%E0%B8%B8%E0%B8%93%E0%B8%A0%E0%B8%B2%E0%B8%9E-%E0%B8%84%E0%B8%A3%E0%B8%B1%E0%B9%89%E0%B8%87%E0%B8%97%E0%B8%B5%E0%B9%88-14-_3.jpg',
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
          Center(
            child: Column(
              children: [
                const SizedBox(height: 20),
                Text(
                  // ignore: unnecessary_null_comparison
                  widget.bibid == null
                      ? "bibid is null"
                      : "bibid = " + widget.bibid,
                ),
                const SizedBox(height: 20),
                Text(
                  'Rating : $rating',
                ),
                const SizedBox(height: 20),
                RatingBar.builder(
                  initialRating: 0,
                  minRating: 0,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  updateOnDrag: true,
                  onRatingUpdate: (rating) => setState(() {
                    this.rating = rating;
                    //print(rating);
                  }),
                ),
                const SizedBox(height: 20),
                Container(
                  width: size.width * 0.5,
                  child: TextFormField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    minLines: 1,
                    decoration: const InputDecoration(
                      labelText: 'แสดงความคิดเห็น',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: size.width * 0.3,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('ลงคะแนน'),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
