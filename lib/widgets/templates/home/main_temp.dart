import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../modules/home/bloc/bloc.dart';
import '../../../shared/shared.dart';
import '../../widgets.dart';

class MainTemp extends StatefulWidget {
  final Widget body;

  const MainTemp({Key key, @required this.body}) : super(key: key);

  @override
  _MainTempState createState() => _MainTempState();
}

class _MainTempState extends State<MainTemp> {
  int _currentIndex = 0;
  BottomNavBloc _bloc;

  @override
  void initState() {
    _bloc = BlocProvider.of<BottomNavBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBloc, BottomNavState>(
      builder: (context, state) {
        _setCurrentStateBottomNav(state);
        return Scaffold(
          bottomNavigationBar: _buildBottomNav(),
          body: widget.body,
        );
      },
    );
  }

  Widget _buildBottomNav() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(AppIcons.home),
          activeIcon: GradientIconAtm(icon: Icon(AppIcons.home)),
          title: H4Atm(Strings.home),
        ),
        BottomNavigationBarItem(
          icon: Icon(AppIcons.cart),
          title: H4Atm(Strings.order),
        ),
        BottomNavigationBarItem(
          icon: Icon(AppIcons.pay),
          activeIcon: GradientIconAtm(icon: Icon(AppIcons.pay)),
          title: H4Atm(Strings.sale),
        ),
        BottomNavigationBarItem(
          icon: Icon(AppIcons.product),
          activeIcon: GradientIconAtm(icon: Icon(AppIcons.product)),
          title: H4Atm(Strings.product),
        ),
        BottomNavigationBarItem(
          icon: Icon(AppIcons.person),
          activeIcon: GradientIconAtm(icon: Icon(AppIcons.person)),
          title: H4Atm(Strings.account),
        ),
      ],
      onTap: _onTapItem,
      currentIndex: _currentIndex,
    );
  }

  void _setCurrentStateBottomNav(BottomNavState state) {
    if (state is BottomNavHome) {
      _currentIndex = 0;
    } else if (state is BottomNavOrder) {
      _currentIndex = 1;
    } else if (state is BottomNavSale) {
      _currentIndex = 2;
    } else if (state is BottomNavProduct) {
      _currentIndex = 3;
    } else if (state is BottomNavAccount) {
      _currentIndex = 4;
    }
  }

  void _onTapItem(int index){
    switch (index) {
      case 0:
        _bloc.add(GetBottomNavHome());
        break;
        case 1:
        _bloc.add(GetBottomNavOrder());
        break;
        case 2:
        _bloc.add(GetBottomNavSale());
        break;
        case 3:
        _bloc.add(GetBottomNavProduct());
        break;
        case 4:
        _bloc.add(GetBottomNavAccount());
        break;
      default:
    }
  }
}
