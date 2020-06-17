import 'package:flutter/material.dart';

import '../../../shared/shared.dart';
import '../../widgets.dart';

class SelectLocationTemp extends StatefulWidget {
  final ValueChanged<bool> tappedSelectMap;

  const SelectLocationTemp({Key key, this.tappedSelectMap}) : super(key: key);

  @override
  _SelectLocationTempState createState() => _SelectLocationTempState();
}

class _SelectLocationTempState extends State<SelectLocationTemp> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(height: 400, child: MapOrg()),
        _buildBody(),
      ],
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Dimens.dp16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          LocationCardMol(
            title: 'Gedung Sate',
            detail:
                'Jalan Diponegoro No.22, Citarum, Kec. Bandung Wetan, Kota Bandung, Jawa Barat 40115',
            icon: AppIcons.pin,
          ),
          SizedBox(height: Dimens.dp20),
          TextFieldAtm(
            hintText: 'Tambahkan detail note',
            prefixIcon: AppIcons.notes,
            background: AppColors.whiteF2Color,
          ),
          SizedBox(height: Dimens.dp20),
          PrimaryButtonAtm(
              onPressed: () {
                Navigator.of(context).maybePop();
              },
              child: Text('Konirmasi Alamat'))
        ],
      ),
    );
  }
}
