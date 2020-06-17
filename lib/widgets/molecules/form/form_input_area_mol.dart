import 'package:flutter/material.dart';

import '../../../shared/shared.dart';
import '../../atoms/atoms.dart';

class FormInputAreaMol extends StatelessWidget {
  final String label, hintText;
  final TextEditingController controller;
  final FocusNode focusNode;
  final ValueChanged<String> onChange, onSubmit;
  final int minLine, maxLine;

  const FormInputAreaMol(
      {Key key,
      this.label,
      this.hintText,
      this.controller,
      this.focusNode,
      this.onChange,
      this.onSubmit,
      this.minLine = 3,
      this.maxLine})
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
            style: TextStyle(fontSize: Dimens.dp14),
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
            minLines: minLine,
            maxLines: maxLine,
            textInputAction: TextInputAction.newline,
            keyboardType: TextInputType.multiline,
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
