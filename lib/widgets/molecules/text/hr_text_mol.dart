import 'package:flutter/material.dart';

import '../../../shared/shared.dart';
import '../../atoms/texts/texts.dart';

class HrTextMol extends StatelessWidget {
  final String text;

  const HrTextMol({Key key, @required this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider()),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimens.dp10),
          child: H3Atm(
            text,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.disabledTextColor),
          ),
        ),
        Expanded(child: Divider()),
      ],
    );
  }
}
