import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
class CarouselProject extends StatelessWidget {
  final List<String> images;

  const CarouselProject({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    final bgColor = Theme.of(context).colorScheme.background;

    return Container(
      color: bgColor, // 👈 لون الخلفية حسب الثيم
      child: CarouselSlider(
        options: CarouselOptions(
          height: double.infinity,
          viewportFraction: 1,
          enableInfiniteScroll: true,
          enlargeCenterPage: false,
          autoPlay: true,
        ),
        items: images.map((img) {
          return SizedBox.expand(
            child: Image.asset(
              img,
              fit: BoxFit.cover,
            ),
          );
        }).toList(),
      ),
    );
  }
}
