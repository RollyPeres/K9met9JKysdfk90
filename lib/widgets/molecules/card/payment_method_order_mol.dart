import 'package:flutter/material.dart';

import '../../../shared/shared.dart';
import '../../atoms/texts/texts.dart';
import '../molecules.dart';

class PaymentMethodOrderMol extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildItem(Strings.status,
            child: LabelTextMol(
              label: 'Sudah Bayar',
              color: AppColors.supportCompleteColor,
            )),
        _buildItem(Strings.paymentMethod,
            child: Image.asset(
              AssetsPaths.gopay,
              width: 55,
            ))
      ],
    );
  }

  Widget _buildItem(String title, {Widget child}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Dimens.dp4),
      child: Row(
        children: [
          H4Atm(title, style: TextStyle(color: AppColors.black4bColor)),
          Spacer(),
          child,
        ],
      ),
    );
  }
}
