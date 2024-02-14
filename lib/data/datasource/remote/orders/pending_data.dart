import '../../../../core/class/crud.dart';
import '../../../../core/constant/linkapi.dart';

class OrdersPendingData {
  Crud crud;
  OrdersPendingData(this.crud);
  getData() async {
    var response = await crud.postData(AppLink.pendingorders,{});
    return response?.fold((l) => l, (r) => r);
  }
  approveOrder(String deliveryid,String userid,String ordersid) async {
    var response = await crud.postData(AppLink.approveorder,{'deliveryid':deliveryid, 'usersid':userid,'ordersid':ordersid});
    return response?.fold((l) => l, (r) => r);
  }
}