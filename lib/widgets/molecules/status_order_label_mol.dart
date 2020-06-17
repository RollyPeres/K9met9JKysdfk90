import 'package:flutter/material.dart';

import '../../shared/shared.dart';
import '../atoms/texts/texts.dart';

class StatusOrderLabelMol extends StatelessWidget {
  final Color color;
  final String label;

  const StatusOrderLabelMol({Key key, @required this.color, @required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Dimens.dp8),
      alignment: AlignmentDirectional.center,
      color: color,
      child: H4Atm(
        label,
        style: TextStyle(color: AppColors.black4bColor),
      ),
    );
  }
}
