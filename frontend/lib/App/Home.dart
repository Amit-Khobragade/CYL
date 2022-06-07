import 'package:flutter/material.dart';
import './AppBar/AppBar.dart';
import './SubSection/SubSection.dart';
import './Variables/ColorVariables.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      backgroundColor: ColorVariables.color60Per,
      body: SafeArea(
        child: CustomScrollView(
          scrollDirection: Axis.vertical,
          slivers: [
            const NavBar(),
            SliverList(
              delegate: SliverChildListDelegate([
                const SubSection(
                  title: "Lipstick",
                ),
                const SubSection(title: "Eye Liner"),
                const SubSection(title: "Foundation"),
                const SubSection(title: "Nail Polish"),
              ]),
            ),
          ],
        ),
      ),
    ));
  }
}
