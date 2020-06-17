part of 'order_bloc.dart';

abstract class OrderState extends Equatable {
  const OrderState();
  @override
  List<Object> get props => [];
}

class OrderLoading extends OrderState {}

class OrderLoaded extends OrderState {
  final List<Order> data;

  OrderLoaded({@required this.data});

  @override
  List<Object> get props => [data];
}

class OrderError extends OrderState {}
