import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../modules/auth/auth.dart';
import '../../../shared/shared.dart';
import '../../atoms/atoms.dart';
import '../../molecules/molecules.dart';

class LoginTemp extends StatefulWidget {
  @override
  _LoginTempState createState() => _LoginTempState();
}

class _LoginTempState extends State<LoginTemp> {

  // ------------------------------------------------------------------------------------

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();

  bool _obsecure = true;
  LoginBloc _bloc;

  void _navigateToRegister() {
    Navigator.pushNamed(context, Routes.register);
  }

  void _navigateToForgetPass() {
    Navigator.pushNamed(context, Routes.forgetPass);
  }

  void _requestNextFocus() {
    FocusScope.of(context).nextFocus();
  }

  bool get isPopulated =>
      _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty;

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of<LoginBloc>(context);
    _emailController.addListener(_onEmailChanged);
    _passwordController.addListener(_onPasswordChanged);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (_, state) {
        // if (state.isSuccess) {
        // BlocProvider.of<AuthenticationBloc>(context).add(LoggedIn());
        // }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          print('STATE =====> $state');
          return Scaffold(
            body: ScrollConfigAtm(
              child: SingleChildScrollView(
                padding:
                    EdgeInsets.symmetric(horizontal: Dimens.horizontalPadding),
                child: Column(
                  children: [
                    SizedBox(height: 50),
                    AppLogoAtm(size: 104),
                    SizedBox(height: Dimens.dp16),
                    _buildTitleAndSubTitle(),
                    SizedBox(height: 40),
                    _buildForm(state),
                    SizedBox(height: Dimens.dp24),
                    TextUnderlineActionMol(
                      text: Strings.forgetPasswordQuestion,
                      underlineText: Strings.clickInHere,
                      onPressed: _navigateToForgetPass,
                    ),
                    SizedBox(height: 40),
                    _buildButtonBottom(state),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTitleAndSubTitle() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: Dimens.width(context) * 0.6,
          child: H2Atm(
            Strings.messageLogin,
            align: TextAlign.center,
          ),
        ),
        SizedBox(height: Dimens.dp8),
        H4Atm(
          Strings.subMessageLogin,
          align: TextAlign.center,
          style: TextStyle(color: AppColors.disabledTextColor),
        ),
      ],
    );
  }

  Widget _buildForm(state) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextFieldAtm(
          background: AppColors.inputBgColor,
          hintText: Strings.inputUsernameOrEmail,
          prefixIcon: AppIcons.email,
          inputType: TextInputType.emailAddress,
          focusNode: _emailFocus,
          controller: _emailController,
          inputAction: TextInputAction.next,
          errorText: _getErrorMessageEmail(state),
          onSubmit: (_) => _requestNextFocus(),
        ),
        SizedBox(height: Dimens.dp16),
        TextFieldAtm(
          background: AppColors.inputBgColor,
          hintText: Strings.inputPassword,
          prefixIcon: AppIcons.lock,
          obscureText: _obsecure,
          focusNode: _passwordFocus,
          controller: _passwordController,
          onSubmit: (_) => _onFormSubmitted,
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
      ],
    );
  }

  Widget _buildButtonBottom(state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        PrimaryButtonAtm(
          onPressed: isLoginButtonEnabled(state) ? _onFormSubmitted : null,
          child: Text(Strings.login),
        ),
        SizedBox(height: Dimens.dp20),
        HrTextMol(text: Strings.or),
        SizedBox(height: Dimens.dp20),
        SocialButtonMol(
            onPress: () {},
            image: AssetsPaths.googleLogo,
            text: Strings.google),
        SizedBox(height: Dimens.dp20),
        Center(
            child: TextUnderlineActionMol(
          text: Strings.dontHaveAccountQuestion,
          underlineText: Strings.signUpInHere,
          onPressed: _navigateToRegister,
        )),
        SizedBox(height: Dimens.dp20),
      ],
    );
  }

  void _onEmailChanged() {
    _bloc.add(
      LoginEmailChanged(email: _emailController.text),
    );
  }

  void _onPasswordChanged() {
    _bloc.add(
      LoginPasswordChanged(password: _passwordController.text),
    );
  }

  void _onFormSubmitted() {
    _bloc.add(
      GetSubmittedLogin(
        email: _emailController.text,
        password: _passwordController.text,
      ),
    );
  }

  bool isLoginButtonEnabled(LoginState state) {
    return state.isFormValid && isPopulated && !state.isSubmitting;
  }

  String _getErrorMessageEmail(LoginState state) {
    return !state.isEmailValid ? 'Masukkan E-mail dengan benar' : null;
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocus.dispose();
    _passwordFocus.dispose();
    super.dispose();
  }
}
