import 'package:flutter/material.dart';

import '../../../shared/shared.dart';
import '../../molecules/molecules.dart';

class OrderTemp extends StatefulWidget {
  final lenght;
  final initialIndex;
  final List<Widget> children;

  const OrderTemp({Key key, this.lenght = 5, this.initialIndex = 0, @required this.children})
      : super(key: key);
  @override
  _OrderTempState createState() => _OrderTempState();
}

class _OrderTempState extends State<OrderTemp>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(Strings.order),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return DefaultTabController(
      length: widget.lenght,
      initialIndex: widget.initialIndex,
      child: Column(
        children: [
          OrderTabBarMol(),
          Expanded(child: TabBarView(
            physics: BouncingScrollPhysics(),
            children: widget.children,
          ))
        ],
      )
    );
    // return DefaultTabController(length: null, child: null);
  }
}
