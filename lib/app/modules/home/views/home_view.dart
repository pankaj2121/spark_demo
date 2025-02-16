import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Column(
        children: [
           Text(
             'HomeView is working',
             style: TextStyle(fontSize: 20),
           ),
          Container(
            height: 50,
            width: 50,
            color: Colors.red,
            child: Image.asset("assets/emoji.png"),
          )
        ],
      ),
    );
  }
}
