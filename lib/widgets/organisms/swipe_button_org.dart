import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

import '../../shared/shared.dart';
import '../widgets.dart';

enum SwipeButtonPosition {
  SwipeLeft,
  SwipeRight,
}

class SwipeButtonOrg extends StatefulWidget {
  const SwipeButtonOrg({
    Key key,
    this.initialPosition = SwipeButtonPosition.SwipeLeft,
    @required this.onChanged,
    this.height = 45.0,
    @required this.text,
  })  : assert(initialPosition != null && onChanged != null && height != null),
        super(key: key);

  final String text;
  final double height;
  final SwipeButtonPosition initialPosition;
  final ValueChanged<SwipeButtonPosition> onChanged;

  @override
  SwipeButtonOrgState createState() => SwipeButtonOrgState();
}

class SwipeButtonOrgState extends State<SwipeButtonOrg>
    with SingleTickerProviderStateMixin {
  final GlobalKey _containerKey = GlobalKey();
  final GlobalKey _positionedKey = GlobalKey();
  var _color = AppColors.blackD8Color;

  AnimationController _controller;
  Offset _start = Offset.zero;

  RenderBox get _positioned => _positionedKey.currentContext.findRenderObject();

  RenderBox get _container => _containerKey.currentContext.findRenderObject();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController.unbounded(vsync: this);
    if (widget.initialPosition == SwipeButtonPosition.SwipeRight) {
      _controller.value = 1.0;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: widget.height + Dimens.dp8,
      child: Stack(
        key: _containerKey,
        alignment: AlignmentDirectional.center,
        children: <Widget>[
          AnimatedContainer(
            duration: Duration(milliseconds: 200),
            width: double.infinity,
            height: widget.height,
            decoration: BoxDecoration(color: _color,
            borderRadius: BorderRadius.circular(Dimens.roundButton)),
            child: Center(
              child: H3Atm(widget.text,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          ),
          AnimatedBuilder(
            animation: _controller,
            builder: (BuildContext context, Widget child) {
              return Align(
                alignment: Alignment((_controller.value * 2.0) - 1.0, 0.0),
                child: child,
              );
            },
            child: GestureDetector(
              onHorizontalDragStart: _onDragStart,
              onHorizontalDragUpdate: _onDragUpdate,
              onHorizontalDragEnd: _onDragEnd,
              child: Container(
                key: _positionedKey,
                height: widget.height + Dimens.dp8,
                padding: EdgeInsets.symmetric(
                    vertical: Dimens.dp12, horizontal: Dimens.dp20),
                decoration: BoxDecoration(
                    color: AppColors.priamryDarkColor,
                    borderRadius: BorderRadius.circular(Dimens.dp8)),
                child: Icon(AppIcons.swipe, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onDragStart(DragStartDetails details) {
    final pos = _positioned.globalToLocal(details.globalPosition);
    _start = Offset(pos.dx, 0.0);
    _controller.stop(canceled: true);
  }

  void _onDragUpdate(DragUpdateDetails details) {
    final pos = _container.globalToLocal(details.globalPosition) - _start;
    final extent = _container.size.width - _positioned.size.width;
    _controller.value = (pos.dx.clamp(0.0, extent) / extent);
  }

  void _onDragEnd(DragEndDetails details) {
    final extent = _container.size.width - _positioned.size.width;
    var fractionalVelocity = (details.primaryVelocity / extent).abs();
    if (fractionalVelocity < 0.5) {
      fractionalVelocity = 0.5;
    }
    SwipeButtonPosition result;
    double acceleration, velocity;
    if (_controller.value > 0.5) {
      acceleration = 0.5;
      velocity = fractionalVelocity;
      result = SwipeButtonPosition.SwipeRight;
    } else {
      acceleration = -0.5;
      velocity = -fractionalVelocity;
      result = SwipeButtonPosition.SwipeLeft;
    }
    final simulation = _SwipeSimulation(
      acceleration,
      _controller.value,
      1.0,
      velocity,
    );
    _controller.animateWith(simulation).then((_) {
      if (result == SwipeButtonPosition.SwipeRight) {
        setState(() {
          _color = AppColors.primaryColor;
        });
      } else {
        setState(() {
          _color = AppColors.blackD8Color;
        });
      }
      if (widget.onChanged != null) {
        widget.onChanged(result);
      }
    });
  }
}

class _SwipeSimulation extends GravitySimulation {
  _SwipeSimulation(
      double acceleration, double distance, double endDistance, double velocity)
      : super(acceleration, distance, endDistance, velocity);

  @override
  double x(double time) => super.x(time).clamp(0.0, 1.0);

  @override
  bool isDone(double time) {
    final _x = x(time).abs();
    return _x <= 0.0 || _x >= 1.0;
  }
}
