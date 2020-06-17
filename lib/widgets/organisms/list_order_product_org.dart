import 'package:flutter/material.dart';

import '../../shared/shared.dart';
import '../molecules/molecules.dart';

class ListOrderProductOrg extends StatelessWidget {
  final ScrollPhysics physics;

  const ListOrderProductOrg({Key key, this.physics}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 4,
      physics: physics ?? NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (_, i){
        return OrderProductCardMol();
      },
      separatorBuilder: (_, i){
        return Divider(
          height: Dimens.dp16,
        );
      },
    );
  }
}