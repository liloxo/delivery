import '../../../../core/class/crud.dart';
import '../../../../core/constant/linkapi.dart';

class OrdersAcceptedData {
  Crud crud;
  OrdersAcceptedData(this.crud);
  getData(String deliveryid) async {
    var response = await crud.postData(AppLink.accepted, {"id": deliveryid});
    return response?.fold((l) => l, (r) => r);
  }

  doneDelivery(String ordersid,String userid) async {
    var response = await crud.postData(AppLink.doneorder, {"ordersid": ordersid,'usersid':userid});
    return response?.fold((l) => l, (r) => r);
  }
}