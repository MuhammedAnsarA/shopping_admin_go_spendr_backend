import 'package:get/get.dart';
import 'package:go_spendr_backend/models/order_stats_model.dart';
import 'package:go_spendr_backend/services/database_service.dart';

class OrderStatsController extends GetxController {
  final DatabaseService database = DatabaseService();

  var stats = Future.value(<OrderStats>[]).obs;

  @override
  void onInit() {
    stats.value = database.getOrderStats();
    super.onInit();
  }
}
