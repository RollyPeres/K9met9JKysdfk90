import 'package:flutter/material.dart';

class ScrollConfigAtm extends StatelessWidget {
  final Widget child;

  const ScrollConfigAtm({Key key, @required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: _ScrollBehavior(),
      child: child,
    );
  }
}

class _ScrollBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}