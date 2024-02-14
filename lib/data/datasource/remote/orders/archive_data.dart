import '../../../../core/class/crud.dart';
import '../../../../core/constant/linkapi.dart';

class OrdersArchiveData {
  Crud crud;
  OrdersArchiveData(this.crud);
  getData(String deliverid) async {
    var response = await crud.postData(AppLink.ordersarchive, {"id": deliverid});
    return response?.fold((l) => l, (r) => r);
  }
}