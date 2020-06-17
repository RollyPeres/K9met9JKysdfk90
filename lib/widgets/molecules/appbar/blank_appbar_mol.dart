import 'package:flutter/material.dart';

import '../../../shared/shared.dart';

class BlankAppBarMol extends AppBar {
  final Widget leading;

  BlankAppBarMol({this.leading})
      : super(
            leading: leading,
            backgroundColor: Colors.transparent,
            elevation: 0,
            brightness: Brightness.light,
            iconTheme: IconThemeData(
                color: AppColors.black33Color, size: Dimens.dp24));
}
