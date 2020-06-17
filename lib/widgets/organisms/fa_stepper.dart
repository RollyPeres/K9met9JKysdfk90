import 'package:flutter/material.dart';

import '../../shared/shared.dart';
import '../atoms/atoms.dart';

enum FAStepstate {
  indexed,
  editing,
  complete,
  disabled,
  error,
}

enum FAStepperTitleIconArrange { row, column }

@immutable
class FAStep {
  FAStep({
    @required this.title,
    this.subtitle,
    @required this.content,
    this.state = FAStepstate.indexed,
    this.isActive = false,
  })  : assert(title != null),
        assert(content != null),
        assert(state != null);

  final Widget title;
  final Widget subtitle;
  final Widget content;
  final FAStepstate state;
  final bool isActive;
}

class FAStepper extends StatefulWidget {
  FAStepper({
    Key key,
    @required this.steps,
    this.physics,
    this.titleIconArrange = FAStepperTitleIconArrange.column,
    this.stepNumberColor = AppColors.primaryColor,
    this.currentStep = 0,
    this.titleHeight = 66.0,
    this.onStepTapped,
    this.onStepContinue,
    this.onStepCancel,
    this.controlsBuilder,
  })  : assert(steps != null),
        assert(currentStep != null),
        assert(0 <= currentStep && currentStep < steps.length),
        super(key: key);

  final List<FAStep> steps;
  final ScrollPhysics physics;
  final FAStepperTitleIconArrange titleIconArrange;
  final Color stepNumberColor;
  final int currentStep;
  final double titleHeight;
  final ValueChanged<int> onStepTapped;
  final VoidCallback onStepContinue;
  final VoidCallback onStepCancel;
  final ControlsWidgetBuilder controlsBuilder;

  @override
  _FAStepperState createState() => _FAStepperState();
}

class _FAStepperState extends State<FAStepper> with TickerProviderStateMixin {
  final Map<int, FAStepstate> _oldStates = <int, FAStepstate>{};

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < widget.steps.length; i += 1)
      _oldStates[i] = widget.steps[i].state;
  }

  @override
  void didUpdateWidget(FAStepper oldWidget) {
    super.didUpdateWidget(oldWidget);
    assert(widget.steps.length == oldWidget.steps.length);

    for (int i = 0; i < oldWidget.steps.length; i += 1)
      _oldStates[i] = oldWidget.steps[i].state;
  }

  bool _isLast(int index) {
    return widget.steps.length - 1 == index;
  }

  Widget _buildCircleChild(int index, bool oldState) {
    final FAStepstate state =
        oldState ? _oldStates[index] : widget.steps[index].state;
    assert(state != null);
    switch (state) {
      case FAStepstate.indexed:
      case FAStepstate.disabled:
        return Text('${index + 1}', style: TextStyle(color: Colors.white));
      case FAStepstate.editing:
        return Icon(
          Icons.edit,
          size: 18.0,
          color: Colors.white,
        );
      case FAStepstate.complete:
        return Icon(
          Icons.check,
          size: 18.0,
          color: Colors.white,
        );
      case FAStepstate.error:
        return const Text('!');
    }
    return null;
  }

  Color _circleColor(int index) {
    if (widget.steps[index].state == FAStepstate.complete) {
      return AppColors.primaryColor;
    }
    return widget.steps[index].isActive
        ? widget.stepNumberColor //IposColors.stepEdit
        : AppColors.disabledTextColor;
  }

  Widget _buildCircle(int index, bool oldState) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      width: Dimens.dp24,
      height: Dimens.dp24,
      child: AnimatedContainer(
        curve: Curves.fastOutSlowIn,
        duration: kThemeAnimationDuration,
        decoration: BoxDecoration(
          color: _circleColor(index),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: _buildCircleChild(index,
              oldState && widget.steps[index].state == FAStepstate.error),
        ),
      ),
    );
  }

  Widget _buildTriangle(int index, bool oldState) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      width: Dimens.dp24,
      height: Dimens.dp24,
      child: Center(
        child: SizedBox(
          width: Dimens.dp24,
          height: Dimens.dp24 *
              0.866025, // Height of 24dp-long-sided equilateral triangle.
          child: CustomPaint(
            painter: _TrianglePainter(
              color: AppColors.redErrorColor,
            ),
            child: Align(
              alignment: const Alignment(
                  0.0, 0.8), // 0.8 looks better than the geometrical 0.33.
              child: _buildCircleChild(index,
                  oldState && widget.steps[index].state != FAStepstate.error),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIcon(int index) {
    if (widget.steps[index].state != _oldStates[index]) {
      return AnimatedCrossFade(
        firstChild: _buildCircle(index, true),
        secondChild: _buildTriangle(index, true),
        firstCurve: const Interval(0.0, 0.6, curve: Curves.fastOutSlowIn),
        secondCurve: const Interval(0.4, 1.0, curve: Curves.fastOutSlowIn),
        sizeCurve: Curves.fastOutSlowIn,
        crossFadeState: widget.steps[index].state == FAStepstate.error
            ? CrossFadeState.showSecond
            : CrossFadeState.showFirst,
        duration: kThemeAnimationDuration,
      );
    } else {
      if (widget.steps[index].state != FAStepstate.error)
        return _buildCircle(index, false);
      else
        return _buildTriangle(index, false);
    }
  }

  Widget _buildVerticalControls() {
    if (widget.controlsBuilder != null)
      return widget.controlsBuilder(context,
          onStepContinue: widget.onStepContinue,
          onStepCancel: widget.onStepCancel);

    return Container(
      margin: const EdgeInsets.all(16.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: PrimaryButtonAtm(
              onPressed: widget.onStepContinue,
              child: Text(Strings.next),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsetsDirectional.only(start: 8.0),
              child: SecondaryButtonAtm(
                onPressed: widget.onStepCancel,
                child: Text(Strings.back),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderText(int index) {
    return (widget.titleIconArrange == FAStepperTitleIconArrange.column)
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              AnimatedDefaultTextStyle(
                style: (index == widget.currentStep)
                    ? TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold)
                    : TextStyle(
                        color: AppColors.disabledTextColor,
                        fontWeight: FontWeight.normal), //_titleStyle(index),
                duration: kThemeAnimationDuration,
                curve: Curves.fastOutSlowIn,
                child: widget.steps[index].title,
              ),
              widget.steps[index].subtitle != null
                  ? Container(
                      margin: const EdgeInsets.only(top: 2.0),
                      child: widget.steps[index].subtitle,
                    )
                  : SizedBox(),
            ],
          )
        : Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              AnimatedDefaultTextStyle(
                style: (index == widget.currentStep)
                    ? TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold)
                    : TextStyle(
                        color: Colors.brown,
                        fontWeight: FontWeight.normal), //_titleStyle(index),
                duration: kThemeAnimationDuration,
                curve: Curves.fastOutSlowIn,
                child: widget.steps[index].title,
              ),
              widget.steps[index].subtitle ??
                  Container(
                    margin: const EdgeInsets.only(top: 2.0),
                    child: widget.steps[index].subtitle,
                  ),
            ],
          );
  }

  Widget _buildHorizontal() {
    final List<Widget> children = <Widget>[
      for (int i = 0; i < widget.steps.length; i += 1) ...<Widget>[
        InkResponse(
            onTap: widget.steps[i].state != FAStepstate.disabled
                ? () {
                    if (widget.onStepTapped != null) widget.onStepTapped(i);
                  }
                : null,
            canRequestFocus: widget.steps[i].state != FAStepstate.disabled,
            child: (widget.titleIconArrange == FAStepperTitleIconArrange.column)
                ? Row(
                    // crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              height: 44.0,
                              margin:
                                  const EdgeInsetsDirectional.only(start: 12.0),
                              child: Center(
                                child: _buildIcon(i),
                              ),
                            ),
                            Container(
                              // height: 24,
                              margin:
                                  const EdgeInsetsDirectional.only(start: 12.0),
                              child: _buildHeaderText(i),
                            ),
                          ],
                        ),
                        if (!_isLast(i))
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 8.0),
                            height: 1.0,
                            width: 18,
                            color: AppColors.primaryColor,
                          ),
                      ])
                : Row(
                    children: <Widget>[
                      Container(
                        height: 44.0,
                        child: Center(
                          child: _buildIcon(i),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsetsDirectional.only(start: 12.0),
                        child: _buildHeaderText(i),
                      ),
                      if (!_isLast(i))
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8.0),
                          height: 1.0,
                          width: 18,
                          color: Colors.blue,
                        ),
                    ],
                  )),
      ],
    ];

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
            width: double.infinity,
            height: widget.titleHeight,
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                color: AppColors.disabledTextColor,
                offset: Offset(1, 0),
                blurRadius: 4,
              )
            ]),
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: children.length,
                itemBuilder: (BuildContext context, int index) =>
                    children[index])),
        Expanded(
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: widget.physics ?? BouncingScrollPhysics(),
            children: <Widget>[
              AnimatedSize(
                curve: Curves.fastOutSlowIn,
                duration: kThemeAnimationDuration,
                vsync: this,
                child: widget.steps[widget.currentStep].content,
              ),
              _buildVerticalControls(),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterial(context));
    assert(debugCheckHasMaterialLocalizations(context));
    assert(() {
      if (context.findAncestorWidgetOfExactType<FAStepper>() != null)
        throw FlutterError('Steppers must not be nested.\n'
            'The material specification advises that one should avoid embedding '
            'steppers within steppers. '
            'https://material.io/archive/guidelines/components/steppers.html#steppers-usage');
      return true;
    }());
    return _buildHorizontal();
  }
}

// Paints a triangle whose base is the bottom of the bounding rectangle and its
// top vertex the middle of its top.
class _TrianglePainter extends CustomPainter {
  _TrianglePainter({
    this.color,
  });

  final Color color;

  @override
  bool hitTest(Offset point) => true; // Hitting the rectangle is fine enough.

  @override
  bool shouldRepaint(_TrianglePainter oldPainter) {
    return oldPainter.color != color;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final double base = size.width;
    final double halfBase = size.width / 2.0;
    final double height = size.height;
    final List<Offset> points = <Offset>[
      Offset(0.0, height),
      Offset(base, height),
      Offset(halfBase, 0.0),
    ];

    canvas.drawPath(
      Path()..addPolygon(points, true),
      Paint()..color = color,
    );
  }
}
