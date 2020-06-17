import 'package:flutter/material.dart';

import '../../../shared/shared.dart';

class SecondaryButtonAtm extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final Color color;
  final bool smallPadding;

  const SecondaryButtonAtm({
    Key key,
    @required this.onPressed,
    @required this.child, this.color = AppColors.primaryColor, this.smallPadding = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: child,
      textColor: color,
      padding: EdgeInsets.symmetric(
        horizontal: smallPadding ? Dimens.dp14 : Dimens.dp24,
        vertical: smallPadding ? Dimens.dp8 : Dimens.dp16,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimens.roundButton),
        side: BorderSide.none,
      ),
      disabledTextColor: AppColors.disabledTextColor,
      elevation: 0,
      highlightElevation: 0,
    );
  }
}
