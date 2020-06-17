import 'package:flutter/material.dart';

import '../../../shared/shared.dart';

class AppLogoAtm extends StatelessWidget {
  final double size;
  final double opacity;

  const AppLogoAtm({Key key, this.size, this.opacity = 1}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: Image.asset(
        AssetsPaths.appLogo,
        width: size,
        height: size,
      ),
    );
  }
}
