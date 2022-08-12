import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'cart_page.dart';
import 'images.dart';
import 'search_page.dart';
import 'wish_list.dart';
import 'camera.dart';
import 'home.dart';

class Cyl extends StatefulWidget {
  final CameraDescription cameraDescription;
  const Cyl({super.key, required this.cameraDescription});

  @override
  State<Cyl> createState() => _Cyl();
}

class _Cyl extends State<Cyl> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Choose Your Look',
      initialRoute: '/',
      routes: {
        '/': (_) => const Home(),
        CameraPage.routes: (_) => CameraPage(
              cameraDescription: widget.cameraDescription,
            ),
        ImagesPage.routes: (_) => const ImagesPage(),
        CartPage.routes: (_) => const CartPage(),
        WishlistPage.routes: (_) => const WishlistPage(),
        SearchPage.routes: (_) => const SearchPage(),
        CategorySearchPage.routes: (_) => const CategorySearchPage(),
      },
    );
  }
}
