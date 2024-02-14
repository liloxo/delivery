import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../core/class/statusrequest.dart';
import '../core/functions/handlingdatacontroller.dart';
import '../core/services/services.dart';
import '../data/datasource/remote/home_data.dart';
import '../data/model/itemsmodel.dart';

abstract class HomeController extends SearchMixController {
initialData();
getData();
goToItems(List categories, int selectedCat, String catid);
}

class HomeControllerImp extends HomeController{
  MyServices myServices = Get.find();
  String? username;
  String? lang;
  String titlehomecard = '';
  String bodyhomecard = '';
  String deliverytime = '';
  HomeData homeData = HomeData(Get.find());
  List items = [];
  List categories = [];
  List settingsdata = [];
  
  @override
  initialData(){
    lang = myServices.sharedPreferences.getString('lang');
    username = myServices.sharedPreferences.getString("username");
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.getData();
    //print("======================== $response");
    statusRequest = handlingData(response);
    if(StatusRequest.success == statusRequest ){
      if(response['status'] == "success"){
       categories.addAll(response['categories']);
       items.addAll(response['items']);
       settingsdata.addAll(response['settings']);
       titlehomecard = settingsdata[0]['settings_titlehome'];
       bodyhomecard = settingsdata[0]['settings_bodyhome'];
       deliverytime = settingsdata[0]['settings_deliverytime'];
       myServices.sharedPreferences.setString('deliverytime', deliverytime);
      }else{
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  goToPageProductDetails(itemsModel) {
    Get.toNamed("productdetails", arguments: {"itemsmodel": itemsModel});
  }

@override
  goToItems(categories, selectedCat, catid) {
    Get.toNamed("/items",arguments:{
      "categories" : categories,
      "selectedcat": selectedCat,
      "catid"      : catid
      });
  }

  @override
  void onInit() {
    search = TextEditingController();
    getData();
    initialData();
    super.onInit();
  }
  
}

class SearchMixController extends GetxController {
  List<ItemsModel> listdata = [];

  late StatusRequest statusRequest;
  HomeData homedata = HomeData(Get.find());

  searchData() async {
    statusRequest = StatusRequest.loading;
    var response = await homedata.searchData(search!.text);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        listdata.clear();
        List responsedata = response['data'];
        listdata.addAll(responsedata.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  bool isSearch = false;
  TextEditingController? search;
  checkSearch(val) {
    if (val == "") {
      statusRequest = StatusRequest.none;
      isSearch = false;
    }
    update();
  }

  onSearchItems() {
    isSearch = true;
    searchData();
    update();
  }
}