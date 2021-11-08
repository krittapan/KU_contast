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
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 40),
            Text(
              // ignore: unnecessary_null_comparison
              widget.bibid == null
                  ? "bibid is null"
                  : "bibid = " + widget.bibid,
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: CachedNetworkImage(
                  
                  imageUrl:
                      'https://www.homenayoo.com/wp-content/uploads/2019/12/456-1024x576.jpg'
                      fit: BoxFit.cover,
                      ),
            ),
            const SizedBox(height: 40),
            Text(
              'Rating : $rating',
            ),
            const SizedBox(height: 30),
            RatingBar.builder(
              initialRating: 0,
              minRating: 1,
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
                print(rating);
              }),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: size.width * 0.4,
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: 'แสดงความคิดเห็น',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {},
              child: const Text('ลงคะแนน'),
            )
          ],
        ),
      ),
    );
  }
}
