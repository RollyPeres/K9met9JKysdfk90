import 'package:flutter/material.dart';

import '../../../shared/shared.dart';
import '../../atoms/atoms.dart';

class FormInputMol extends StatelessWidget {
  final String label, hintText;
  final TextEditingController controller;
  final FocusNode focusNode;
  final ValueChanged<String> onChange, onSubmit;
  final TextInputAction inputAction;
  final TextInputType inputType;

  const FormInputMol(
      {Key key,
      this.label,
      this.hintText,
      this.controller,
      this.focusNode,
      this.onChange,
      this.onSubmit,
      this.inputAction,
      this.inputType})
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
          TextFormField(
            style: TextStyle(
                fontSize: Dimens.dp12,
                fontWeight: FontWeight.bold,
                color: AppColors.black4bColor),
            controller: controller,
            decoration: InputDecoration(
              border: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.whiteF2Color)),
              hintText: hintText ?? '',
              contentPadding: EdgeInsets.only(bottom: Dimens.dp8),
              isDense: true,
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.whiteF2Color)),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.whiteF2Color)),
            ),
            textInputAction: inputAction,
            keyboardType: inputType,
            focusNode: focusNode,
            onChanged: onChange,
            onFieldSubmitted: onSubmit,
          ),
        ],
      ),
    );
  }

  Widget _buildLabel() {
    if (label != null) {
      return Padding(
        padding: EdgeInsets.only(bottom: Dimens.paddingLabelText),
        child: H4Atm(
          label,
          style: TextStyle(color: AppColors.black4bColor),
        ),
      );
    } else {
      return SizedBox();
    }
  }
}
