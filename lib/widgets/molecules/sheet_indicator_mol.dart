import 'package:flutter/material.dart';
import 'package:gets_seller/shared/shared.dart';

class SheetIndicatorMol extends StatelessWidget {
  final double width;
  final Color color;

  const SheetIndicatorMol(
      {Key key, this.width = 40, this.color = AppColors.blackD8Color})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildItem(),
          SizedBox(height: Dimens.dp4),
          _buildItem(),
        ],
      ),
    );
  }

  Widget _buildItem() {
    return Container(
      height: Dimens.dp4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: color,
      ),
    );
  }
}
