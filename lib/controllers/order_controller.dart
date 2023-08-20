import 'package:get/get.dart';
import 'package:go_spendr_backend/models/order_model.dart';
import 'package:go_spendr_backend/services/database_service.dart';

class OrderController extends GetxController {
  final DatabaseService database = DatabaseService();

  var orders = <Orders>[].obs;
  var pendingOrders = <Orders>[].obs;

  @override
  void onInit() {
    orders.bindStream(database.getOrders());
    pendingOrders.bindStream(database.getPendingOrders());

    super.onInit();
  }

  void updateOrder(
    Orders order,
    String field,
    bool value,
  ) {
    database.updateOrder(order, field, value);
  }
}
