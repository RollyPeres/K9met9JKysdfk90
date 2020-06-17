part of 'bottom_nav_bloc.dart';

abstract class BottomNavEvent extends Equatable {
  const BottomNavEvent();
  @override
  List<Object> get props => [];
}

class GetBottomNavHome extends BottomNavEvent {}

class GetBottomNavOrder extends BottomNavEvent {}

class GetBottomNavSale extends BottomNavEvent {}

class GetBottomNavProduct extends BottomNavEvent {}

class GetBottomNavAccount extends BottomNavEvent {}
