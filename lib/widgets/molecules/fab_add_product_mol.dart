import 'package:flutter/material.dart';

import '../../shared/shared.dart';

class FabAddProductMol extends StatelessWidget {
  final VoidCallback onPressed;
  final Color color;
  final Widget child;

  const FabAddProductMol({Key key, @required this.onPressed, this.color, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
          child: Container(
        padding:
            EdgeInsets.symmetric(vertical: Dimens.dp12, horizontal: Dimens.dp24),
        decoration: BoxDecoration(
          gradient: color == null ? AppColors.primaryGradient: null,
          boxShadow: Shadows.primaryShadow,
          borderRadius: BorderRadius.circular(Dimens.dp32),
          color: color,
        ),
        child: child ?? Text(
          '+ ${Strings.addProduct}',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
