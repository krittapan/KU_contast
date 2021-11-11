import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:ku_contest/Firebase/database_manager.dart';

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
          Container(
            height: size.height * 0.8,
            width: double.infinity,
            child: FutureBuilder(
              future: FireStoreDataBase(bibid: widget.bibid).getData(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Text(
                    "Something went wrong",
                  );
                }
                if (snapshot.connectionState == ConnectionState.done) {
                  return CachedNetworkImage(imageUrl: snapshot.data.toString());
                  // return Image.network(
                  //   snapshot.data.toString(),
                  // );
                }
                return const Center(child: CircularProgressIndicator());
              },
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
