import 'package:flutter/material.dart';

import '../../../shared/shared.dart';
import '../../atoms/atoms.dart';

class PropertyOrderCardMol extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: _buildSectionLeft()),
        _buildSectionRight(),
      ],
    );
  }

  Widget _buildSectionLeft() {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              AppIcons.person,
              size: Dimens.dp14,
              color: AppColors.black75Color,
            ),
            SizedBox(width: Dimens.dp8),
            H4Atm(
              'Caesar Candil',
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: AppColors.black4bColor),
            )
          ],
        ),
        SizedBox(height: Dimens.dp12),
        Row(
          children: [
            Icon(
              AppIcons.bill,
              size: Dimens.dp14,
              color: AppColors.black75Color,
            ),
            SizedBox(width: Dimens.dp8),
            H4Atm(
              'Order ID #139874',
              style: TextStyle(color: AppColors.black4bColor),
            )
          ],
        ),
      ],
    );
  }

  Widget _buildSectionRight() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
      H4Atm(
        '21 Mei 2020 (12:30 WIB)',
        style: TextStyle(color: AppColors.black75Color),
      ),
      SizedBox(height: Dimens.dp12),
      H4Atm(
        'Jarak Lokasi 0.83 KM',
        style: TextStyle(color: AppColors.black75Color),
      )
    ]);
  }
}
