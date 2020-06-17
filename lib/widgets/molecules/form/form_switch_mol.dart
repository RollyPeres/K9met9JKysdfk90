import 'package:flutter/material.dart';

import '../../../shared/shared.dart';
import '../../atoms/texts/texts.dart';

class FormSwitchMol extends StatelessWidget {
  final String label, statusText;
  final bool value;
  final ValueChanged<bool> onChange;

  const FormSwitchMol(
      {Key key,
      this.label,
      this.value = false,
      @required this.onChange,
      this.statusText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Dimens.dp4),
      child: Row(
        children: [
          label != null
              ? Expanded(
                  child: H4Atm(
                    label,
                    style: TextStyle(color: AppColors.black4bColor),
                  ),
                )
              : SizedBox(),
          _buildSwitch(context),
        ],
      ),
    );
  }

  Widget _buildSwitch(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        statusText != null
            ? H3Atm(
                statusText,
                style: TextStyle(
                  color: value ? AppColors.primaryColor : AppColors.black75Color,
                  fontWeight: FontWeight.bold,
                ),
              )
            : SizedBox(),
        Switch(value: value, onChanged: onChange)
      ],
    );
  }
}
