import 'package:flutter/material.dart';

import '../../../shared/shared.dart';
import '../../widgets.dart';

class DashboardCardMol extends StatelessWidget {
  final String title;
  final int count;
  final VoidCallback onPressed;

  const DashboardCardMol(
      {Key key, @required this.title, @required this.count, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        constraints: BoxConstraints.tightFor(width: 150, height: 95),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimens.dp10),
            color: Theme.of(context).cardColor,
            boxShadow: Shadows.primaryShadow),
        padding: EdgeInsets.all(Dimens.dp12),
        margin: EdgeInsets.all(Dimens.dp8),
        child: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        H4Atm(title),
        SizedBox(height: Dimens.dp4),
        H1Atm(
          count.toString(),
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: Dimens.dp4),
        InkWell(
          onTap: onPressed,
          child: H4Atm(
            Strings.seeDetail,
            style: TextStyle(color: AppColors.primaryColor),
          ),
        ),
      ],
    );
  }
}
