import 'package:flutter/material.dart';

import '../../../shared/shared.dart';

class CircleImageMol extends StatelessWidget {
  final double size;
  final ImageProvider image;

  const CircleImageMol({Key key, this.size = Dimens.dp32, @required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      padding: EdgeInsets.all(Dimens.dp2),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        shape: BoxShape.circle,
      ),
      child: Padding(
        padding: EdgeInsets.all(Dimens.dp2),
        child: CircleAvatar(
          backgroundImage: image,
          backgroundColor: Colors.grey,
          radius: size - Dimens.dp4,
        ),
      ),
    );
  }
}
