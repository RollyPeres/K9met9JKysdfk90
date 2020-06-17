import 'package:flutter/material.dart';

import '../../../shared/shared.dart';

class ProductImageAtm extends StatelessWidget {
  final double width, height;
  final BorderRadiusGeometry radius;
  final bool withShadow;

  const ProductImageAtm(
      {Key key, this.radius, this.withShadow = false, this.width = Dimens.minSizeCardProduct, this.height= Dimens.minSizeCardProduct})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.blackD8Color,
        boxShadow: withShadow ? Shadows.primaryShadow : null,
        borderRadius: radius ?? BorderRadius.circular(Dimens.dp4),
      ),
      child: ClipRRect(
          borderRadius: radius ?? BorderRadius.circular(Dimens.dp4),
          child: Image.network(
            AssetsPaths.mockProductImage,
            fit: BoxFit.cover,
            width: width,
            height: height,
          )),
    );
  }
}
