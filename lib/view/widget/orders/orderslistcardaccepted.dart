import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import '../../../controller/orders/accepted_controller.dart';
import '../../../core/constant/color.dart';
import '../../../data/model/ordersmodel.dart';

class CardOrdersListAccepted extends GetView<OrdersAcceptedController> {
  final OrdersModel listdata;
  const CardOrdersListAccepted({Key? key, required this.listdata}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text("Order Number : #${listdata.ordersId}",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  const Spacer(),
                  // Text(listdata.ordersDatetime!)
                  Text(
                    Jiffy(listdata.ordersDatetime!, "yyyy-MM-dd").fromNow(),
                    style: const TextStyle(
                        color: AppColor.primaryColor,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const Divider(),
              Text(
                  "Order Type : ${controller.printOrderType(listdata.ordersType!)}"),
              Text("Order Price : ${listdata.ordersPrice} \$"),
              Text("Delivery Price : ${listdata.ordersPricedelivery} \$ "),
              Text(
                  "Payment Method : ${controller.printPaymentMethod(listdata.ordersPaymentmethod!)} "),
              Text(
                  "Order Status : ${controller.printOrderStatus(listdata.ordersStatus!)} "),
              const Divider(),
              Row(
                children: [
                  Text("Total Price : ${listdata.ordersId} \$ ",
                      style: const TextStyle(
                          color: AppColor.primaryColor,
                          fontWeight: FontWeight.bold)),
                  const Spacer(),
                  MaterialButton(
                    onPressed: () {
                      Get.toNamed('ordersdetails',
                          arguments: {"ordersmodel": listdata});
                    },
                    color: AppColor.thirdColor,
                    textColor: AppColor.secoundColor,
                    child: const Text("Details"),
                  ),
                  const SizedBox(width: 10),
                 if (listdata.ordersStatus! == "3") MaterialButton(
                    onPressed: () {
                      controller.doneDelivery(listdata.ordersId!, listdata.ordersUsersid!);
                    },
                    color: AppColor.thirdColor,
                    textColor: AppColor.secoundColor,
                    child: const Text("Done"),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}