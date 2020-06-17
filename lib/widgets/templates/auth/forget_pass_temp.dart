import 'package:flutter/material.dart';

import '../../../shared/shared.dart';
import '../../widgets.dart';

class ForgetPasswordTemp extends StatefulWidget {
  @override
  _ForgetPasswordTempState createState() => _ForgetPasswordTempState();
}

class _ForgetPasswordTempState extends State<ForgetPasswordTemp> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.back),
      ),
      body: _buildBody(),
      bottomNavigationBar: _buildButtomAction(),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Dimens.horizontalPadding),
      child: ScrollConfigAtm(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 50),
              _buildHeader(),
              SizedBox(height: 40),
              _buildForm(),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AppLogoAtm(size: 104),
        SizedBox(height: Dimens.dp12),
        H2Atm(Strings.changePassword),
        SizedBox(height: Dimens.dp8),
        H4Atm(
          Strings.messageChangePassword,
          style: TextStyle(color: AppColors.disabledTextColor),
        )
      ],
    );
  }

  Widget _buildForm() {
    return TextFieldAtm(
      background: AppColors.inputBgColor,
      hintText: Strings.inputUsernameOrEmail,
      prefixIcon: AppIcons.email,
      inputType: TextInputType.emailAddress,
      controller: _controller,
    );
  }

  Widget _buildButtomAction() {
    return Container(
      height: 63,
      padding: EdgeInsets.fromLTRB(Dimens.dp16, 0, Dimens.dp16, Dimens.dp16),
      child: PrimaryButtonAtm(
          onPressed: _controller.text.length > 1 ? (){} : null,
          child: Text(Strings.changePassword)),
    );
  }
}
