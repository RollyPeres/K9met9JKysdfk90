import 'package:flutter/material.dart';

import '../../../shared/dimens.dart';
import '../molecules.dart';

class BaseContentSheetMol extends StatelessWidget {
  final Widget child;

  const BaseContentSheetMol({Key key, @required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(Dimens.horizontalPadding, Dimens.dp10, Dimens.horizontalPadding, 0),
      child: Column(
        children: [
          SheetIndicatorMol(),
          SizedBox(height: Dimens.dp12),
          child,
      ],),
    );
  }
}