import 'package:flutter/material.dart';

import '../../../shared/shared.dart';
import '../../atoms/atoms.dart';
import '../../atoms/texts/texts.dart';

class FormPickLocationMol extends StatelessWidget {
  final String label, hintText;
  final bool enable;
  final VoidCallback onTap;

  const FormPickLocationMol(
      {Key key, this.label, this.hintText, this.enable, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Dimens.dp4),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildLabel(),
          TextFieldAtm(
            hintText: hintText,
            background: AppColors.whiteF2Color,
            prefixIcon: AppIcons.pin,
            suffix: Icon(
              AppIcons.search,
              size: Dimens.dp18,
              color: AppColors.blackD8Color,
            ),
            onTap: onTap,
            enable: enable,
          ),
        ],
      ),
    );
  }

  Widget _buildLabel() {
    if (label != null) {
      return Padding(
        padding: EdgeInsets.only(bottom: Dimens.dp12),
        child: H4Atm(
          label,
          style: TextStyle(
              color: AppColors.black4bColor, fontWeight: FontWeight.bold),
        ),
      );
    } else {
      return SizedBox();
    }
  }
}
