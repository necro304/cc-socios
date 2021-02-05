import 'package:flutter/material.dart';
import 'package:get/get.dart'; 
import 'package:css_socios/app/modules/home/controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
      ),
      body: Column(
        children: [

        ],
      )
    );
  }
}
  