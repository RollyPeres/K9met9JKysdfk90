import 'package:flutter/material.dart';

import '../../../shared/shared.dart';
import '../../widgets.dart';

class DetailsPaymentOrderCardMol extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildItem(Strings.subTotal, child: H4Atm('Rp. 80.000')),
        _buildItem(Strings.postalFee, child: H4Atm('Gratis')),
        SizedBox(height: Dimens.dp16),
        DashDividerAtm(),
        SizedBox(height: Dimens.dp16),
        _buildItem(Strings.totalPayment,
            child: H4Atm(
              'Rp. 80.000',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
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
