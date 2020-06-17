import 'package:flutter/material.dart';

import '../../shared/shared.dart';
import '../widgets.dart';

class SectionMol extends StatelessWidget {
  final String title;
  final Widget child;

  const SectionMol({Key key, this.title, @required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: Dimens.dp12),
        _buildTitle(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimens.horizontalPadding),
          child: child,
        ),
        SizedBox(height: Dimens.dp12),
        Container(
          width: double.infinity,
          height: Dimens.dp8,
          color: AppColors.whiteF9Color,
        )
      ],
    );
  }

  Widget _buildTitle() {
    return title != null
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
                Padding(
                    padding: EdgeInsets.only(left: Dimens.horizontalPadding),
                    child: H3Atm(title)),
                Divider(),
              ])
        : SizedBox();
  }
}
