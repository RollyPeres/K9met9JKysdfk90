import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../order.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final OrderRepository repository;

  OrderBloc({@required this.repository});

  @override
  OrderState get initialState => OrderLoading();

  @override
  Stream<OrderState> mapEventToState(
    OrderEvent event,
  ) async* {
    yield* _mapEventStateOrder(event);
  }

  Stream<OrderState> _mapEventStateOrder(OrderEvent event) async* {
    try {
      List<Order> result;
      if (event is GetOrderAll) {
        result = await repository.getAllOrders();
      } else if (event is GetOrderNew) {
        result = await repository.getNewOrders();
      } else if (event is GetOrderShipped) {
        result = await repository.getShippedOrders();
      } else if (event is GetOrderComplete) {
        result = await repository.getCompleteOrders();
      } else if (event is GetOrderDecline) {
        result = await repository.getDeclineOrders();
      }

      yield OrderLoaded(data: result);
    } catch (e) {
      yield OrderError();
    }
  }
}
