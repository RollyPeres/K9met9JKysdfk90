import 'package:flutter/services.dart';

import '../../../../shared/shared.dart';
import '../data.dart';

class OrderApiProvider {
  Future<List<Order>> getAllOrders() async {
    var data = await rootBundle.loadString(AssetsPaths.mockAllOrderJson);
    return listOrderFromJson(data);
  }

  Future<List<Order>> getNewOrders() async {
    var data = await rootBundle.loadString(AssetsPaths.mockNewOrdeJson);
    return listOrderFromJson(data);
  }

  Future<List<Order>> getShippedOrders() async {
    var data = await rootBundle.loadString(AssetsPaths.mockShippedOrderJson);
    return listOrderFromJson(data);
  }

  Future<List<Order>> getCompleteOrders() async {
    var data = await rootBundle.loadString(AssetsPaths.mockCompleteOrderJson);
    return listOrderFromJson(data);
  }

  Future<List<Order>> getDeclineOrders() async {
    var data = await rootBundle.loadString(AssetsPaths.mockDeclineOrderJson);
    return listOrderFromJson(data);
  }
}
