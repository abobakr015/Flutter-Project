import 'package:flutter/material.dart';

class Strimdata {
  var count = 0;
  Stream<Image> streamImage() async* {
    List<Image> nameimages = [
      const Image(image: AssetImage('images/1.jpg')),
      const Image(image: AssetImage('images/2.jpg')),
      const Image(image: AssetImage('images/3.jpg')),
      const Image(image: AssetImage('images/4.jpg')),
      const Image(image: AssetImage('images/5.jpg')),
      const Image(image: AssetImage('images/6.jpg')),
      const Image(image: AssetImage('images/7.jpg')),
      const Image(image: AssetImage('images/8.jpg')),
      const Image(image: AssetImage('images/9.jpg')),
      const Image(image: AssetImage('images/10.jpg')),
    ];
    for (var i = 0; i <= nameimages.length; i++) {
      await Future.delayed(const Duration(seconds: 5));
      if (i == nameimages.length) {
        i = 0;
      }
      yield nameimages[i];
    }
  }
}
