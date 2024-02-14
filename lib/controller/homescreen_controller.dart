import 'package:delivery/view/screen/orders/accepted.dart';
import 'package:delivery/view/screen/orders/pending.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeScreenController extends GetxController{
  changePage(int i);
}

class HomeScreenControllerImp extends HomeScreenController{

  int currentPage = 0;

  List<Widget> pages = [
    const OrdersPending(),
    const OrdersAccepted(),
    const Text('data'),
  ];
  List<IconData> icons = [
    Icons.home,
    Icons.shopping_cart_sharp,
    Icons.settings,
  ];
  List titlebottomappbar = [
    "Pending" , 
    "Accepted",
    "Settings",
  ] ; 

  @override
  changePage(int i) {
    currentPage = i;
    update();
  }

}