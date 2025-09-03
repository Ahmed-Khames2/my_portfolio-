import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselProject extends StatelessWidget {
  final List<String> images;

  const CarouselProject({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: double.infinity, // 👈 يملى الكونتينر اللي محاطه
        viewportFraction: 1, // 👈 يخلي الصورة تاخد عرض كامل
        enableInfiniteScroll: true,
        enlargeCenterPage: false,
        autoPlay: true,
      ),
      items: images.map((img) {
        return SizedBox.expand( // 👈 يملأ الكونتينر كله
          child: Image.asset(
            img,
            fit: BoxFit.cover, // 👈 يملى شاشة الموبايل بالكامل
          ),
        );
      }).toList(),
    );
  }
}
