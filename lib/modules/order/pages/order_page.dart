import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widgets/widgets.dart';
import '../order.dart';

class OrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          OrderBloc(repository: OrderRepository(OrderApiProvider())),
      child: _OrderPage(),
    );
  }
}

class _OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<_OrderPage> {
  @override
  Widget build(BuildContext context) {
    return OrderTemp(
      children: [
        _buildDeclineOrder(),
        _buildNewOrder(),
        _buildShippedOrder(),
        _buildCompleteOrder(),
        _buildAllOrder()
        // _buildDeclineOrder(),
      ],
    );
  }

  Widget _buildAllOrder(){
    BlocProvider.of<OrderBloc>(context)..add(GetOrderAll());
    return BlocBuilder<OrderBloc, OrderState>(
      builder: (context, state) {
        if(state is OrderLoaded){
          return ListOrderCardOrg(orders: state.data);
        }else{
          return SizedBox();
        }
      },
    );
  }

  Widget _buildNewOrder(){
    BlocProvider.of<OrderBloc>(context)..add(GetOrderNew());
    return BlocBuilder<OrderBloc, OrderState>(
      builder: (context, state) {
        if(state is OrderLoaded){
          return ListOrderCardOrg(orders: state.data);
        }else{
          return SizedBox();
        }
      },
    );
  }

  Widget _buildShippedOrder(){
    BlocProvider.of<OrderBloc>(context)..add(GetOrderShipped());
    return BlocBuilder<OrderBloc, OrderState>(
      builder: (context, state) {
        if(state is OrderLoaded){
          return ListOrderCardOrg(orders: state.data);
        }else{
          return SizedBox();
        }
      },
    );
  }

  Widget _buildCompleteOrder(){
    BlocProvider.of<OrderBloc>(context)..add(GetOrderComplete());
    return BlocBuilder<OrderBloc, OrderState>(
      builder: (context, state) {
        if(state is OrderLoaded){
          return ListOrderCardOrg(orders: state.data);
        }else{
          return SizedBox();
        }
      },
    );
  }

  Widget _buildDeclineOrder(){
    BlocProvider.of<OrderBloc>(context)..add(GetOrderDecline());
    return BlocBuilder<OrderBloc, OrderState>(
      builder: (context, state) {
        if(state is OrderLoaded){
          return ListOrderCardOrg(orders: state.data);
        }else{
          return SizedBox();
        }
      },
    );
  }
}
