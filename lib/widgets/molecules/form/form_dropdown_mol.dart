import 'package:flutter/material.dart';

import '../../../shared/shared.dart';
import '../../widgets.dart';

class FormDropdownMol extends StatelessWidget {
  final List<String> data;
  final FocusNode focusNode;
  final String value, hintText, label;
  final ValueChanged<String> onChange;

  const FormDropdownMol(
      {Key key,
      @required this.data,
      this.focusNode,
      this.value,
      this.hintText,
      @required this.onChange,
      this.label})
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
          Container(
            padding: EdgeInsets.symmetric(horizontal: Dimens.dp8),
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.whiteF2Color),
                borderRadius: BorderRadius.circular(Dimens.dp8)),
            child: DropdownButton(
              focusNode: focusNode,
              isExpanded: true,
              icon: Icon(AppIcons.expand, size: Dimens.dp18),
              hint: H4Atm(hintText ?? ''),
              items: data.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: H4Atm(value),
                );
              }).toList(),
              onChanged: onChange,
              value: value,
              underline: SizedBox(),
              elevation: 4,
            ),
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
