import 'package:flutter/material.dart';

import '../../shared/shared.dart';
import '../widgets.dart';
import 'fa_stepper.dart';

class HorizontalStepperOrg extends StatefulWidget {
  final int initialStep;
  final VoidCallback onPressLastStep;
  final List<FAStep> steps;
  final ValueChanged<int> onChange;

  const HorizontalStepperOrg(
      {Key key,
      this.initialStep = 0,
      this.onPressLastStep,
      @required this.steps,
      this.onChange})
      : super(key: key);

  @override
  _HorizontalStepperOrgState createState() => _HorizontalStepperOrgState();
}

class _HorizontalStepperOrgState extends State<HorizontalStepperOrg> {
  int _currentStep = 0;

  @override
  void initState() {
    setState(() {
      _currentStep = widget.initialStep;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FAStepper(
      physics: BouncingScrollPhysics(),
      stepNumberColor: AppColors.primaryColor,
      steps: widget.steps,
      currentStep: _currentStep,
      onStepCancel: () {
        setState(() {
          if (_currentStep > 0) {
            _currentStep = _currentStep - 1;
          } else {
            _currentStep = 0;
          }
          widget.onChange(_currentStep);
        });
      },
      onStepContinue: () {
        setState(() {
          if (_currentStep < widget.steps.length - 1) {
            _currentStep = _currentStep + 1;
          }
          widget.onChange(_currentStep);
        });
      },
      onStepTapped: (v) {
        setState(() {
          _currentStep = v;
          widget.onChange(_currentStep);
        });
      },
      controlsBuilder: (
        BuildContext context, {
        VoidCallback onStepCancel,
        VoidCallback onStepContinue,
      }) {
        VoidCallback nextAction;
        if (_currentStep == widget.steps.length - 1) {
          nextAction = widget.onPressLastStep;
        } else {
          nextAction = onStepContinue;
        }

        return Container(
            width: Dimens.width(context),
            padding: EdgeInsets.all(Dimens.dp16),
            child: _buildControls(nextAction, onStepCancel));
      },
    );
  }

  Widget _buildControls(onStepContinue, onStepCancel) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _buildBackButton(onStepCancel),
        Expanded(
          child: PrimaryButtonAtm(
            onPressed: onStepContinue,
            child: Text(Strings.next),
          ),
        )
      ],
    );
  }

  Widget _buildBackButton(onPress) {
    if (_currentStep != (widget.steps.length - 1) && _currentStep != 0) {
      return Expanded(
        child: SecondaryButtonAtm(
          onPressed: onPress,
          child: Text(Strings.back),
        ),
      );
    } else {
      return SizedBox();
    }
  }
}
