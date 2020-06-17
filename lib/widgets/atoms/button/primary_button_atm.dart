import 'package:flutter/material.dart';

import '../../../shared/shared.dart';

class PrimaryButtonAtm extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final Color color;
  final bool smallPadding;

  const PrimaryButtonAtm({
    Key key,
    @required this.onPressed,
    @required this.child,
    this.color, this.smallPadding = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: child,
      color: color ?? AppColors.primaryColor,
      textColor: Colors.white,
      padding: EdgeInsets.symmetric(
        horizontal: smallPadding ? Dimens.dp14 : Dimens.dp24,
        vertical: smallPadding ? Dimens.dp8 : Dimens.dp16,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimens.roundButton),
        side: BorderSide.none,
      ),
      disabledColor: AppColors.disabledTextColor,
      disabledTextColor: Colors.white,
      elevation: 0,
      highlightElevation: 0,
    );
  }
}
