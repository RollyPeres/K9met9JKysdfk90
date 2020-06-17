import 'package:flutter/material.dart';
import 'package:gets_seller/shared/shared.dart';

import '../../organisms/organisms.dart';
import '../../widgets.dart';

class OnboardingStoreTemp extends StatefulWidget {
  @override
  _OnboardingStoreTempState createState() => _OnboardingStoreTempState();
}

class _OnboardingStoreTempState extends State<OnboardingStoreTemp> {
  int _currentStep = 0;

  FAStepstate _getStateStep(int step) {
    if (step == _currentStep) {
      return FAStepstate.indexed;
    } else if (step < _currentStep) {
      return FAStepstate.complete;
    } else if (step > _currentStep) {
      return FAStepstate.disabled;
    } else {
      return FAStepstate.error;
    }
  }

  bool _getActiveStep(int v) {
    if (v == _currentStep) {
      return true;
    } else {
      return false;
    }
  }

  void _navigateToMain() {
    Navigator.pushNamedAndRemoveUntil(context, Routes.main, (_) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pemilik Toko')),
      body: HorizontalStepperOrg(
        initialStep: _currentStep,
        steps: [
          FAStep(
              title: Text('Data Pribadi'),
              content: StoreOwnerFormTemp(),
              state: _getStateStep(0),
              isActive: _getActiveStep(0)),
          FAStep(
              title: Text('Data Toko'),
              content: StoreFormTemp(),
              state: _getStateStep(1),
              isActive: _getActiveStep(1)),
          FAStep(
              title: Text('Lokasi Toko'),
              content: LocationFormTemp(),
              state: _getStateStep(2),
              isActive: _getActiveStep(2)),
        ],
        onChange: (v) {
          setState(() {
            _currentStep = v;
          });
        },
        onPressLastStep: () {
          // todo: add action last step
          _navigateToMain();
        },
      ),
    );
  }
}
