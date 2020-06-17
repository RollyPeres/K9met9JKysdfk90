import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bottom_nav_event.dart';
part 'bottom_nav_state.dart';

class BottomNavBloc extends Bloc<BottomNavEvent, BottomNavState> {
  @override
  BottomNavState get initialState => BottomNavHome();

  @override
  Stream<BottomNavState> mapEventToState(
    BottomNavEvent event,
  ) async* {
    if (event is GetBottomNavHome) {
      yield BottomNavHome();
    } else if (event is GetBottomNavOrder) {
      yield BottomNavOrder();
    } else if (event is GetBottomNavSale) {
      yield BottomNavSale();
    } else if (event is GetBottomNavProduct) {
      yield BottomNavProduct();
    } else if (event is GetBottomNavAccount) {
      yield BottomNavAccount();
    }
  }
}
