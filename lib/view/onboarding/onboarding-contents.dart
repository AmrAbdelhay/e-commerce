import 'package:flutter/material.dart';

class OnboardingContents {
  final String title;
  final String image;
  final String desc;

  OnboardingContents(
      {required this.title, required this.image, required this.desc});
}

List<OnboardingContents> contents = [
  OnboardingContents(
    title: "ADIDAS SHOES",
    image: "",
    desc: "The adidas range of men's shoes has got you covered.",
  ),
  OnboardingContents(
    title: "Stay Strong",
    image: "",
    desc:
    "if you're striving to be the best or you just want the best fit for your daily life.",
  ),
  OnboardingContents(
    title: "",
    image: "",
    desc:
    "With iconic designs and high-performance technologies, you can be sure that your shoes won't let you down..",
  ),
];
