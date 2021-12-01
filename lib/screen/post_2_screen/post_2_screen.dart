import 'dart:html' as html;
import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ku_contest/constant.dart';
import 'package:ku_contest/screen/Imagefull_screen/imagefull_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Post2Screen extends StatefulWidget {
  String bibid;
  String redirect;
  Post2Screen({Key? key, required this.bibid, required this.redirect})
      : super(key: key);

  @override
  State<Post2Screen> createState() => _Post2ScreenState();
}

class _Post2ScreenState extends State<Post2Screen> {
  final controller = CarouselController();
  int activeIndex = 0;
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
          children: [
            const SizedBox(height: 10),
            Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildImageSlider(size),
                    const SizedBox(height: 12),
                    buildIndicator(),
                    const SizedBox(height: 12),
                    buildButtons(),
                    const SizedBox(height: 22),
                    buildBackButtons(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildImage(String urlImage) => GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ImageFullscreen(
                      urlImage: urlImage,
                    )),
          );
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 12),
          color: Colors.grey[100],
          child: Image.network(
            urlImage,
            fit: BoxFit.contain,
          ),
        ),
      );
  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: 2,
        effect: const SlideEffect(activeDotColor: kPrimaryColor),
      );
  Widget buildImageSlider(Size size) => CarouselSlider.builder(
        carouselController: controller,
        itemCount: 2,
        itemBuilder: (context, index, realIndex) {
          final urlImade = "https://ku.ac.th/contest/img/" +
              widget.bibid +
              "_" +
              (index + 1).toString() +
              ".jpg";
          return buildImage(urlImade);
        },
        options: CarouselOptions(
          height: size.height * 0.8,
          onPageChanged: (index, reason) => setState(() => activeIndex = index),
        ),
      );
  Widget buildButtons({bool stretch = false}) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: const Color(0xffB2BB1E),
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
            ),
            onPressed: previous,
            child: const Icon(
              Icons.arrow_back,
              size: 22,
              color: kPrimaryColor,
            ),
          ),
          stretch ? Spacer() : SizedBox(width: 32),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: const Color(0xffB2BB1E),
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
            ),
            onPressed: next,
            child: const Icon(
              Icons.arrow_forward,
              size: 22,
              color: kPrimaryColor,
            ),
          )
        ],
      );
  Widget buildBackButtons() => Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: const Color(0xffB2BB1E),
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 22),
          ),
          onPressed: htmlOpenLink,
          child: const Text('ยอนกลับ'),
        ),
      );
  void htmlOpenLink() {
    html.window.open(widget.redirect, '_self');
  }

  void next() => controller.nextPage(duration: Duration(milliseconds: 500));
  void previous() =>
      controller.previousPage(duration: Duration(milliseconds: 500));
}
