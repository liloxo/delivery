import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/linkapi.dart';
import '../../controller/home_controller.dart';
import '../../core/class/handlingdataview.dart';
import '../../data/model/itemsmodel.dart';
import '../widget/home/customappbar.dart';
import '../widget/home/customcardhome.dart';
import '../widget/home/customtitlehome.dart';
import '../widget/home/listcategorieshome.dart';
import '../widget/home/listitemshome.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return Scaffold(
      body: GetBuilder<HomeControllerImp>(builder: (controller) =>
       Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
          child: ListView(
         children: [
          CustomAppBar(
            titleappbar: "Find Product", onPressedIconFavorite: () {Get.toNamed('myfavorite');},controller: controller.search,
            onPressedSearch: () {
              controller.onSearchItems();
            },
            onChanged: (val) {
              controller.checkSearch(val);
            },
          ),
          HandlingDataView(
            statusRequest: controller.statusRequest, 
            widget: !controller.isSearch
            ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomCardHome(title: controller.titlehomecard, body: controller.bodyhomecard),
                const CustomTitleHome(title: "Categories"),
                const ListCategoriesHome(),
                const CustomTitleHome(title: "Top Selling"),
                const ListItemsHome(), 
               /* CustomTitleHome(title: "Offer"),
                ListItemsHome()*/
              ],
            )
            : ListItemsSearch(listdatamodel: controller.listdata)
          )
        ],
      )),
      )
    );
  }
}

class ListItemsSearch extends GetView<HomeControllerImp> {
  final List<ItemsModel> listdatamodel;
  const ListItemsSearch({Key? key, required this.listdatamodel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: listdatamodel.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              controller.goToPageProductDetails(listdatamodel[index]);
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: Card(
                  child: Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                        child: CachedNetworkImage(
                            imageUrl:
                                "${AppLink.imagestatic}/items/${listdatamodel[index].itemsImage}")),
                    Expanded(
                        flex: 2,
                        child: ListTile(
                          title: Text(listdatamodel[index].itemsName!),
                          subtitle: Text(listdatamodel[index].categoriesName!),
                        )),
                  ],
                ),
              )),
            ),
          );
        });
  }
}