import '../data.dart';

class OrderRepository {
  final OrderApiProvider provider;

  OrderRepository(this.provider);

  Future<List<Order>> getAllOrders() async {
    return await provider.getAllOrders();
  }

  Future<List<Order>> getNewOrders() async {
    return await provider.getNewOrders();
  }

  Future<List<Order>> getShippedOrders() async {
    return await provider.getShippedOrders();
  }

  Future<List<Order>> getCompleteOrders() async {
    return await provider.getCompleteOrders();
  }

  Future<List<Order>> getDeclineOrders() async {
    return await provider.getDeclineOrders();
  }
}
