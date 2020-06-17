import 'package:flutter/material.dart';

import '../../shared/shared.dart';
import '../molecules/molecules.dart';

class ListLocationOrg extends StatelessWidget {
  final ScrollPhysics physic;

  const ListLocationOrg({Key key, this.physic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: physic ?? NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [
        LocationCardMol(
            title: 'Lokasi saat ini',
            detail:
                'Jl. Cimuncang No.3, Padasuka, Cibeunying Kidul, Kota Bandung, Jawa Barat 40215',
            icon: AppIcons.location),
        Divider(height: Dimens.dp32),
        LocationCardMol(
            title: 'Jalan Solontongan No.12',
            detail: 'Buah Batu, RT 02 RW 12, Kota Bandung'),
        Divider(height: Dimens.dp32),
        LocationCardMol(
            title: 'Jalan Solontongan No.12',
            detail: 'Buah Batu, RT 02 RW 12, Kota Bandung',
            note: 'Rumah cat biru dekat stadion siliwangi'),
        Divider(height: Dimens.dp32),
      ],
    );
  }
}
