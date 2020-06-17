import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../shared/dimens.dart';
import '../molecules/molecules.dart';

class ListProductCardOrg extends StatelessWidget {
  final ScrollPhysics physics;

  const ListProductCardOrg({Key key, this.physics}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.builder(
      shrinkWrap: true,
      physics: physics ?? NeverScrollableScrollPhysics(),
      gridDelegate: SliverStaggeredGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: Dimens.width(context) ~/ (Dimens.minSizeCardProduct - 20),
        staggeredTileCount: 6,
        staggeredTileBuilder: (v) => StaggeredTile.fit(1),
      ),
      itemBuilder: (_, index) {
        return ProductCardMol();
      },
      itemCount: 6,
    );
  }
}
