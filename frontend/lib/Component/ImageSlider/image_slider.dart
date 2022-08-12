import 'dart:io';
import 'package:camera/camera.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImageSlider extends StatelessWidget {
  final List<XFile> files;
  final void Function(int index) onChanged;
  const ImageSlider({Key? key, required this.files, required this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: CarouselSlider(
        items: files.map((e) {
          return Image.file(
            File(e.path),
          );
        }).toList(),
        options: CarouselOptions(
          height: 600,
          scrollPhysics: const BouncingScrollPhysics(),
          enlargeCenterPage: true,
          onPageChanged: (index, reason) => onChanged(index),
        ),
      ),
    );
  }
}
