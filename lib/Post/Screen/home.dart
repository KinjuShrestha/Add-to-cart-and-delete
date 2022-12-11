import 'package:flutter/material.dart';
import 'package:mobgrocery/Jewlery/Screen/jewleryScreen.dart';
import 'package:mobgrocery/Post/Screen/post_ScreenUi.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //late TabController _tabController;
  @override
  void initState() {
    // _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Products"),
          centerTitle: true,
        ),
        body: JewleryView());
  }
}
