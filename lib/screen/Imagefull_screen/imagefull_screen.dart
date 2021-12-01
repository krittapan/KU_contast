import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ImageFullscreen extends StatelessWidget {
  String urlImage;
  ImageFullscreen({Key? key, required this.urlImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            child: PhotoView(
              imageProvider: NetworkImage(urlImage),
              minScale: PhotoViewComputedScale.contained * 0.8,
              maxScale: PhotoViewComputedScale.covered * 1.8,
            ),
          ),
          Positioned(
            bottom: 25,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xffB2BB1E),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 22, vertical: 22),
                  ),
                  child: const Text('ยอนกลับ'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
