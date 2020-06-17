import 'package:flutter/material.dart';

import '../../shared/shared.dart';
import '../atoms/texts/texts.dart';

class InfoProductMol extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        H4Atm('Martabak Keju Mini', style: TextStyle(fontWeight: FontWeight.w600, color: AppColors.black33Color)),
        SizedBox(height: Dimens.dp8),
        _buildPrice(),
      ],
    );
  }

  Widget _buildPrice(){
    return Row(
      children: [
        H4Atm('Rp. 15.000', style: TextStyle(fontWeight: FontWeight.w600, color: AppColors.orangeColor)),
        SizedBox(width: Dimens.dp4),
        H5Atm('Rp. 55.000', style: TextStyle(color: AppColors.blackD8Color, decoration: TextDecoration.lineThrough))
      ],
    );
  }
}