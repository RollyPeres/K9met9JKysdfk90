import 'package:flutter/material.dart';

import '../../widgets.dart';

class FormRadioMol extends StatelessWidget {
  final String label;
  final dynamic value, groupValue;
  final ValueChanged<dynamic> onChange;

  const FormRadioMol({
    Key key,
    @required this.label,
    @required this.value,
    @required this.groupValue,
    @required this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: H4Atm(label ?? '')),
        Radio(
          value: value,
          groupValue: groupValue,
          onChanged: onChange,
        ),
      ],
    );
  }
}
