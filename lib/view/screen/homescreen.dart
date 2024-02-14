import 'package:delivery/controller/homescreen_controller.dart';
import 'package:delivery/view/widget/home/custombottomappbarhome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(builder: (controller)
      => Scaffold(
        drawer: const Drawer(),
      appBar: AppBar(title: const Text('Orders'),),
      bottomNavigationBar: const CustomBottomAppBarHome(),
      body: controller.pages.elementAt(controller.currentPage),
      )
    );
  }
}