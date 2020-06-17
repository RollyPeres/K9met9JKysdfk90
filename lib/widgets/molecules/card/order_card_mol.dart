import 'package:flutter/material.dart';

import '../../../modules/order/order.dart';
import '../../../shared/shared.dart';
import '../../widgets.dart';

enum OrderCardStatus {
  newOrder,
  orderShipped,
  orderComplete,
  orderDecline,
}

class OrderCardMol extends StatefulWidget {
  final OrderCardStatus status;
  final Order order;

  const OrderCardMol({Key key, @required this.status, @required this.order})
      : super(key: key);

  @override
  _OrderCardMolState createState() => _OrderCardMolState();
}

class _OrderCardMolState extends State<OrderCardMol> {
  void _navigateToDetailOrder() {
    Navigator.pushNamed(context, Routes.detailOrder);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: Shadows.primaryShadow,
          borderRadius: BorderRadius.circular(Dimens.dp8)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(Dimens.dp8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildLabel(),
            _buildContent(),
          ],
        ),
      ),
    );
  }

  Widget _buildLabel() {
    if (widget.status == OrderCardStatus.newOrder) {
      return StatusOrderLabelMol(
        label: Strings.newOrder,
        color: AppColors.supportProcessedColor,
      );
    } else if (widget.status == OrderCardStatus.orderShipped) {
      return StatusOrderLabelMol(
        label: Strings.orderShipped,
        color: AppColors.supportShippedColor,
      );
    } else if (widget.status == OrderCardStatus.orderComplete) {
      return StatusOrderLabelMol(
        label: Strings.orderComplete,
        color: AppColors.supportCompleteColor,
      );
    } else if (widget.status == OrderCardStatus.orderDecline) {
      return StatusOrderLabelMol(
        label: Strings.orderDeclined,
        color: AppColors.supportDeclineColor,
      );
    } else {
      return SizedBox();
    }
  }

  Widget _buildContent() {
    return Padding(
      padding: EdgeInsets.all(Dimens.dp12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildHeaderCard(),
          Divider(height: Dimens.dp24),
          _buildInfo(),
          _buildActionButton(),
        ],
      ),
    );
  }

  Widget _buildHeaderCard() {
    return Row(
      children: [
        Row(
          children: [
            Icon(
              AppIcons.calendar,
              color: AppColors.black4bColor,
              size: Dimens.dp14,
            ),
            SizedBox(width: Dimens.dp8),
            H3Atm(
              widget.order.date,
              style: TextStyle(color: AppColors.black4bColor),
            ),
          ],
        ),
        Spacer(),
        Row(
          children: [
            Icon(
              AppIcons.bill,
              color: AppColors.black4bColor,
              size: Dimens.dp14,
            ),
            SizedBox(width: Dimens.dp8),
            H3Atm(
              'Order ID #${widget.order.id}',
              style: TextStyle(
                  color: AppColors.black4bColor, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildInfo() {
    return Row(
      children: [
        _buildNameAndProduct(),
        SizedBox(width: Dimens.dp24),
        _buildDistanceAndTotal(),
      ],
    );
  }

  Widget _buildNameAndProduct() {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          H4Atm(
            widget.order.customer,
            style: TextStyle(
                color: AppColors.black4bColor, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: Dimens.dp4),
          H4Atm(
            '${widget.order.product}',
            style: TextStyle(color: AppColors.black4bColor),
          ),
        ],
      ),
    );
  }

  Widget _buildDistanceAndTotal() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          'Jarak ${widget.order.distance} KM',
          style: TextStyle(
              color: AppColors.black4bColor,
              fontWeight: FontWeight.w300,
              fontSize: Dimens.dp12),
        ),
        SizedBox(height: Dimens.dp8),
        H4Atm(
          'Rp. ${widget.order.total}',
          style: TextStyle(color: AppColors.orangeColor),
        ),
      ],
    );
  }

  Widget _buildActionButton() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Divider(height: Dimens.dp20),
        SizedBox(height: Dimens.dp4),
        PrimaryButtonAtm(
            smallPadding: true,
            onPressed: _navigateToDetailOrder,
            child: Text(Strings.seeOrder))
      ],
    );
  }
}
