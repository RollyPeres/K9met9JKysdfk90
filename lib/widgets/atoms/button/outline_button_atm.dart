import 'package:flutter/material.dart';

import '../../../shared/shared.dart';

class OutlineButtonAtm extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final Color color;
  final bool smallPadding;

  const OutlineButtonAtm({
    Key key,
    @required this.onPressed,
    @required this.child,
    this.color,
    this.smallPadding = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: child,
      color: Colors.transparent,
      textColor: color ?? AppColors.primaryColor,
      padding: EdgeInsets.symmetric(
        horizontal: smallPadding ? Dimens.dp14 : Dimens.dp24,
        vertical: smallPadding ? Dimens.dp8 : Dimens.dp16,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimens.roundButton),
        side: BorderSide(color: color ?? AppColors.primaryColor),
      ),
      disabledTextColor: AppColors.disabledTextColor,
      elevation: 0,
      highlightElevation: 0,
    );
  }
}
