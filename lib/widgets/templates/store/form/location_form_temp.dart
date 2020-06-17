import 'package:flutter/material.dart';

import '../../../../shared/shared.dart';
import '../../../widgets.dart';

class LocationFormTemp extends StatefulWidget {
  @override
  _LocationFormTempState createState() => _LocationFormTempState();
}

class _LocationFormTempState extends State<LocationFormTemp> {
  var _jarakValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          height: Dimens.dp8,
          color: AppColors.whiteF9Color,
        ),
        _buildForm(),
      ],
    );
  }

  Widget _buildForm() {
    return Padding(
      padding: EdgeInsets.all(Dimens.horizontalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          FormPickLocationMol(
            label: 'Pilih Lokasi Toko',
            hintText: 'Cari Lokasi',
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (_) => LocationSheetTemp(),
                isScrollControlled: true,
              );
              // Scaffold.of(context).showBottomSheet(
              //   (context) => LocationSheetTemp()
              //   // DraggableScrollableSheet(
              //   //   // expand: true,
              //   //   // initialChildSize: 0.8,
              //   //   builder: (_, scroll) => LocationSheetTemp(),
              //   // ),
              // );
            },
          ),
          Divider(height: Dimens.dp18),
          FormDropdownMol(
            label: 'Jangkauan Antar Garis',
            hintText: 'Jarak dalam KM',
            data: ['1', '2', '3', '4'],
            value: _jarakValue,
            onChange: (v) {
              setState(() {
                _jarakValue = v;
              });
            },
          ),
          SizedBox(height: 62),
        ],
      ),
    );
  }
}
