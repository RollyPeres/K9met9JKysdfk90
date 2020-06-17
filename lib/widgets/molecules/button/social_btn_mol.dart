import 'package:flutter/material.dart';

import '../../../shared/shared.dart';
import '../../atoms/texts/texts.dart';

class SocialButtonMol extends StatelessWidget {
  final VoidCallback onPress;
  final String image, text;

  const SocialButtonMol({
    Key key,
    @required this.onPress,
    @required this.image,
    @required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPress,
      padding: EdgeInsets.symmetric(
        horizontal: Dimens.dp24,
        vertical: Dimens.dp16,
      ),
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              image,
              width: Dimens.dp16,
              height: Dimens.dp16,
            ),
            SizedBox(width: Dimens.dp8),
            H3Atm(text),
          ],
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimens.roundButton),
        side: BorderSide(color: AppColors.disabledColor, width: 1),
      ),
    );
  }
}
