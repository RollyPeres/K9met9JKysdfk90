import 'package:flutter/material.dart';

import '../../../shared/shared.dart';
import '../../widgets.dart';

class RegisterTemp extends StatefulWidget {
  @override
  _RegisterTempState createState() => _RegisterTempState();
}

class _RegisterTempState extends State<RegisterTemp> {
  bool _obsecure = true;

  void _backNavigate() {
    Navigator.of(context).maybePop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return ScrollConfigAtm(
      child: CustomScrollView(
        slivers: [
          _buildHeader(),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: Dimens.horizontalPadding),
            sliver: SliverList(
                delegate: SliverChildListDelegate([
              _buildTitleAndSubtitle(),
              SizedBox(height: 40),
              _buildForm(),
              SizedBox(height: 60),
              _buildButtonAction(),
            ])),
          )
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return SliverAppBar(
      expandedHeight: 125,
      backgroundColor: Colors.white,
      elevation: 2,
      pinned: true,
      brightness: Brightness.light,
      iconTheme: IconThemeData(size: Dimens.dp24),
      flexibleSpace: FlexibleSpaceBar(
        background: Align(
          alignment: AlignmentDirectional.topEnd,
          child: Padding(
            padding: EdgeInsets.all(Dimens.dp16),
            child: AppLogoAtm(size: 120, opacity: 0.1),
          ),
        ),
      ),
    );
  }

  Widget _buildTitleAndSubtitle() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        H1Atm(Strings.signUpNewAccount),
        SizedBox(height: Dimens.dp16),
        H4Atm(
          Strings.messageSignUp,
          style: TextStyle(color: AppColors.disabledTextColor),
        )
      ],
    );
  }

  Widget _buildForm() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextFieldAtm(
          background: AppColors.inputBgColor,
          hintText: Strings.inputYourName,
          prefixIcon: AppIcons.person,
        ),
        SizedBox(height: Dimens.dp16),
        TextFieldAtm(
          background: AppColors.inputBgColor,
          hintText: Strings.inputEmail,
          prefixIcon: AppIcons.email,
          inputType: TextInputType.emailAddress,
        ),
        SizedBox(height: Dimens.dp16),
        TextFieldAtm(
          background: AppColors.inputBgColor,
          hintText: Strings.inputPassword,
          prefixIcon: AppIcons.lock,
          inputType: TextInputType.visiblePassword,
          obscureText: _obsecure,
          suffix: InkWell(
            child: Icon(
              _obsecure ? Icons.visibility_off : Icons.visibility,
            ),
            onTap: () {
              setState(() {
                _obsecure = !_obsecure;
              });
            },
          ),
        ),
        SizedBox(height: Dimens.dp16),
      ],
    );
  }

  Widget _buildButtonAction() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        PrimaryButtonAtm(onPressed: () {}, child: Text(Strings.signUp)),
        SizedBox(height: Dimens.dp24),
        Center(
            child: TextUnderlineActionMol(
          text: Strings.haveAccountQuestion,
          underlineText: Strings.loginInHere,
          onPressed: _backNavigate,
        )),
        SizedBox(height: Dimens.dp24),
      ],
    );
  }
}
