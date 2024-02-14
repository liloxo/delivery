import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery/controller/orders/accepted_controller.dart';
import 'package:delivery/core/class/statusrequest.dart';
import 'package:delivery/core/functions/getdecodepolyline.dart';
import 'package:delivery/core/services/services.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../data/model/ordersmodel.dart';

class TrackingController extends GetxController {
  StreamSubscription<Position>? positionStream;
  GoogleMapController? gmc;
  List<Marker> markers = [];
  StatusRequest statusRequest = StatusRequest.success;
  late OrdersModel ordersModel;
  CameraPosition? cameraPosition;
  Set<Polyline> polylineSet = {};
  double? destlat;
  double? destlong;
  double? currentlat;
  double? currentlong;
  MyServices myServices = Get.find();
  Timer? timer;
  OrdersAcceptedController ordersAcceptedController = Get.find();
  bool isloading = false;

  doneDelivery() async {
    statusRequest = StatusRequest.loading;
    update();
    await ordersAcceptedController.doneDelivery(ordersModel.ordersId!, ordersModel.ordersUsersid!);
    Get.offAllNamed('homepage');
  }

  refreshLocation(){
    timer = Timer.periodic(const Duration(seconds: 10), (timer) async { 
      await FirebaseFirestore.instance.collection('delivery').doc(ordersModel.ordersId).set({
      'lat':currentlat,
      'long':currentlong,
      'deliveryid':myServices.sharedPreferences.getString('id')
    });
    });
  }

  initPolyline()async{
    destlat = double.parse(ordersModel.addressLat!);
    destlong = double.parse(ordersModel.addressLong!);
    polylineSet = await getPolyline(currentlat, currentlong, destlat, destlong);
  }

 getCurrentLocation(){
  cameraPosition = CameraPosition(
        target: LatLng(double.parse(ordersModel.addressLat!),
            double.parse(ordersModel.addressLong!)),
        zoom: 12.4746,
      );
      markers.add(Marker(
          markerId: const MarkerId("destination"),
          position: LatLng(double.parse(ordersModel.addressLat!),
              double.parse(ordersModel.addressLong!))));
  positionStream = Geolocator.getPositionStream().listen((Position? position) {
    if(gmc != null){
      gmc!.animateCamera(CameraUpdate.newLatLng(LatLng(position!.latitude, position.longitude)));
    }
      markers.removeWhere((element) => element.markerId.value == 'current');
       markers.add(Marker(
          markerId: const MarkerId("current"),
          position: LatLng(position!.latitude,
              position.longitude)));
      update();
    });
 }

 @override
  void onInit() {
    ordersModel = Get.arguments['ordersmodel'];
    refreshLocation();
    initPolyline();
    getCurrentLocation();
    super.onInit();
  }

  @override
  void onClose() {
    gmc?.dispose();
    positionStream?.cancel();
    timer?.cancel();
    super.onClose();
  }

}