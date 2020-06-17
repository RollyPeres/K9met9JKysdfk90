import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../shared/shared.dart';
import '../../widgets.dart';

class FormDateMol extends StatelessWidget {
  final DateFormat format;
  final String label, hintText;
  final DateTime initialValue;
  final FocusNode focusNode;
  final TextEditingController controller;

  const FormDateMol(
      {Key key,
      this.format,
      this.label,
      this.initialValue,
      this.focusNode,
      this.hintText,
      this.controller})
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
          DateTimeField(
            format: format ?? DateFormat('dd / MM / yyyy'),
            onShowPicker: (context, value) {
              return showDatePicker(
                  context: context,
                  initialDate: initialValue ?? DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime(2100));
            },
            focusNode: focusNode,
            controller: controller,
            initialValue: initialValue,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(16),
              hintText: hintText,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: AppColors.blackD8Color),
                borderRadius: BorderRadius.circular(Dimens.dp8),
              ),
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
