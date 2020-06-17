part of 'order_bloc.dart';

abstract class OrderEvent extends Equatable {
  const OrderEvent();
  @override
  List<Object> get props => [];
}

class GetOrderAll extends OrderEvent {}

class GetOrderNew extends OrderEvent {}

class GetOrderShipped extends OrderEvent {}

class GetOrderComplete extends OrderEvent {}

class GetOrderDecline extends OrderEvent {}
