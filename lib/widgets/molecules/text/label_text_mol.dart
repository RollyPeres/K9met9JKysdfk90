import 'package:flutter/material.dart';

import '../../../shared/shared.dart';
import '../../widgets.dart';

class LabelTextMol extends StatelessWidget {
  final String label;
  final Color color;

  const LabelTextMol(
      {Key key, @required this.label, this.color = AppColors.whiteF2Color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimens.dp24),
        color: color,
      ),
      padding:
          EdgeInsets.symmetric(vertical: Dimens.dp8, horizontal: Dimens.dp20),
      child: H5Atm(
        label,
        style: TextStyle(color: AppColors.black4bColor),
      ),
    );
  }
}
