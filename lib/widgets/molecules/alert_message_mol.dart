import 'package:flutter/material.dart';

import '../../shared/shared.dart';

class AlertMessageMol extends StatelessWidget {
  final String message;
  final VoidCallback onPressed;
  final String higlightText;

  const AlertMessageMol({Key key, @required this.message, this.onPressed, this.higlightText}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.primaryColor),
          borderRadius: BorderRadius.circular(Dimens.dp8),
          color: AppColors.primaryColor.withOpacity(0.1)),
      child: Stack(
        children: [
          Icon(
            Icons.info_outline,
            color: AppColors.primaryColor.withOpacity(0.3),
            size: Dimens.dp24,
          ),
          _buildMessage()
        ],
      ),
    );
  }

  Widget _buildMessage() {
    return InkWell(
      onTap: onPressed,
          child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: Dimens.dp12,
          horizontal: Dimens.dp16,
        ),
        child: RichText(text: TextSpan(
          text: message,
          style: TextStyle(color: AppColors.black75Color, fontSize: Dimens.dp12),
          children: [TextSpan(
            text: higlightText ?? '',
            style: TextStyle(color: AppColors.black75Color, fontWeight: FontWeight.bold)
          )]
        )),
      ),
    );
  }
}
