import 'package:flutter/material.dart';

import '../../../shared/shared.dart';
import '../../atoms/texts/texts.dart';

class AddressCardMol extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        H4Atm(
          'Semarang Tengah',
          style: TextStyle(
              color: AppColors.black4bColor, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: Dimens.dp8),
        H4Atm(
          'Jl. Gajahmada No.107, Miroto, Kec. Semarang Tengah, Kota Semarang,  Jawa Tengah 50133',
          style: TextStyle(color: AppColors.black4bColor),
        ),
        H4Atm(
          'https://maps.app.goo.gl/Npaor83jb5RQYoXj8',
          style: TextStyle(color: AppColors.blueColor),
        ),
      ],
    );
  }
}
