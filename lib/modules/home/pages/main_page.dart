import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widgets/templates/templates.dart';
import '../../order/order.dart';
import '../../product/product.dart';
import '../bloc/bloc.dart';
import 'home_page.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MainTemp(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return BlocBuilder<BottomNavBloc, BottomNavState>(
      builder: (context, state) {
        if (state is BottomNavHome) {
          return HomePage();
        } else if (state is BottomNavOrder) {
          return OrderPage();
        } else if (state is BottomNavSale) {
          return Center(child: Text('Penjualan'));
        } else if (state is BottomNavProduct) {
          return Center(child: ProductPage());
        } else if (state is BottomNavAccount) {
          return Center(child: Text('Akun'));
        } else {
          return Center(child: Text('Undefine Page'));
        }
      },
    );
  }
}
