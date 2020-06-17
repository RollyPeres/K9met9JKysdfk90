part of 'bottom_nav_bloc.dart';

abstract class BottomNavState extends Equatable {
  const BottomNavState();
  @override
  List<Object> get props => [];
}

class BottomNavHome extends BottomNavState {}

class BottomNavOrder extends BottomNavState {}

class BottomNavSale extends BottomNavState {}

class BottomNavProduct extends BottomNavState {}

class BottomNavAccount extends BottomNavState {}
