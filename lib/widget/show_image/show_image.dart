import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ku_contest/Firebase/database_manager.dart';

class ShowImage extends StatefulWidget {
  final String bibid;

  // ignore: use_key_in_widget_constructors
  const ShowImage(this.bibid);

  @override
  State<ShowImage> createState() => _ShowImageState();
}

class _ShowImageState extends State<ShowImage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FireStoreDataBase(bibid: widget.bibid).getData(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text(
            "Something went wrong",
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return Hero(
            tag: "Hero",
            child: CachedNetworkImage(
              imageUrl: snapshot.data.toString(),
            ),
          );
          // return Image.network(
          //   snapshot.data.toString(),
          // );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
