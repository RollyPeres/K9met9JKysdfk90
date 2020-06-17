import 'package:flutter/material.dart';

import '../../../shared/shared.dart';
import '../../widgets.dart';

class SearchLocationTemp extends StatefulWidget {
  final ValueChanged<bool> tappedSelectMap;

  const SearchLocationTemp({Key key, this.tappedSelectMap}) : super(key: key);

  @override
  _SearchLocationTempState createState() => _SearchLocationTempState();
}

class _SearchLocationTempState extends State<SearchLocationTemp> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FormPickLocationMol(
          hintText: 'Cari Lokasi',
        ),
        SizedBox(height: Dimens.dp18),
        _buildButtonNavigateMap(),
        Divider(height: Dimens.dp24),
        ListLocationOrg(
          physic: BouncingScrollPhysics(),
        ),
      ],
    );
  }

  Widget _buildButtonNavigateMap() {
    return InkWell(
      onTap: (){
        widget.tappedSelectMap(true);
      },
      child: Row(
        children: [
          Icon(AppIcons.map, size: Dimens.dp20, color: AppColors.black33Color),
          SizedBox(width: Dimens.dp12),
          H4Atm('PILIH LEWAT PETA',
              style: TextStyle(color: AppColors.black33Color)),
        ],
      ),
    );
  }
}
