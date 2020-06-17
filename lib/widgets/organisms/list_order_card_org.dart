import 'package:flutter/material.dart';

import '../../modules/order/data/model/order.dart';
import '../../shared/shared.dart';
import '../molecules/molecules.dart';
import '../widgets.dart';

class ListOrderCardOrg extends StatelessWidget {
  final List<Order> orders;

  const ListOrderCardOrg({Key key, @required this.orders}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScrollConfigAtm(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: Dimens.horizontalPadding),
        child: Column(
          children: [
            SizedBox(height: Dimens.dp16),
            ListView.separated(
              itemCount: orders.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (_, index) {
                return _itemCard(orders[index]);
              },
              separatorBuilder: (_, i) {
                return SizedBox(height: Dimens.dp20);
              },
            ),
            SizedBox(height: Dimens.dp32),
          ],
        ),
      ),
    );
  }

  Widget _itemCard(Order order) {
    OrderCardStatus _status;
    if (order.status == 'newOrder') {
      _status = OrderCardStatus.newOrder;
    } else if (order.status == 'shipped') {
      _status = OrderCardStatus.orderShipped;
    } else if (order.status == 'complete') {
      _status = OrderCardStatus.orderComplete;
    } else if (order.status == 'decline') {
      _status = OrderCardStatus.orderDecline;
    }
    return OrderCardMol(status: _status, order: order);
  }
}
