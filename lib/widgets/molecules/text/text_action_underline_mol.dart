import 'package:flutter/material.dart';

import '../../../shared/shared.dart';
import '../../widgets.dart';

class TextUnderlineActionMol extends StatelessWidget {
  final String text, underlineText;
  final VoidCallback onPressed;

  const TextUnderlineActionMol(
      {Key key,
      @required this.text,
      @required this.underlineText,
      this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        H4Atm(
          '$text ',
          style: TextStyle(color: AppColors.disabledTextColor),
        ),
        InkWell(
          onTap: onPressed,
          child: H4Atm(
            underlineText,
            style: TextStyle(
              color: AppColors.disabledTextColor,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}
