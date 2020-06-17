import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

import '../../widgets.dart';

class FormRadioGroupMol extends StatelessWidget {
  final String label;
  final List<Widget> items;

  const FormRadioGroupMol({Key key, this.label, this.items}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ExpandablePanel(
          headerAlignment: ExpandablePanelHeaderAlignment.center,
          header: H4Atm(
            label ?? '',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          expanded: Column(
            children: items,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
          ),
        ),
        Divider(),
      ],
    );
  }
}
