import 'package:flutter/material.dart';
import 'package:islami/tabs/hadeth/hadeth_item.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HadethTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 12, bottom: 20),
      child: CarouselSlider.builder(
        options: CarouselOptions(
          height: double.infinity,
          enlargeCenterPage: true,
          enlargeFactor: 0.2,
        ),
        itemCount: 50,
        itemBuilder: (_, index, __) => HadethItem(index: index),
      ),
    );
  }
}
