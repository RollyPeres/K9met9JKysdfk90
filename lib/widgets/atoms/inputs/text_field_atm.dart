import 'package:flutter/material.dart';

import '../../../shared/shared.dart';

class TextFieldAtm extends StatelessWidget {
  final IconData prefixIcon;
  final bool obscureText, enable;
  final TextEditingController controller;
  final FocusNode focusNode;
  final String hintText, errorText;
  final Widget suffix;
  final Color background;
  final double radius;
  final int minLine, maxLine;
  final ValueChanged<String> onChange, onSubmit;
  final TextInputAction inputAction;
  final TextStyle style;
  final TextInputType inputType;
  final InputBorder border;
  final VoidCallback onTap;

  TextFieldAtm({
    this.obscureText = false,
    this.focusNode,
    this.hintText,
    this.suffix,
    this.prefixIcon,
    this.controller,
    this.background,
    this.radius,
    this.errorText,
    this.minLine = 1,
    this.maxLine = 1,
    this.onChange,
    this.onSubmit,
    this.inputAction,
    this.style,
    this.inputType,
    this.border,
    this.enable = true,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      obscuringCharacter: '*',
      minLines: minLine,
      maxLines: maxLine,
      onChanged: onChange,
      onFieldSubmitted: onSubmit,
      textInputAction: inputAction ?? TextInputAction.done,
      style: style ?? TextStyle(fontSize: Dimens.dp12),
      keyboardType: inputType,
      enabled: enable,
      onTap: onTap,
      decoration: InputDecoration(
          prefixIcon:
              prefixIcon != null ? Icon(prefixIcon, size: Dimens.dp16) : null,
          filled: true,
          fillColor: background ?? Colors.transparent,
          contentPadding: EdgeInsets.all(16),
          hintText: hintText ?? '',
          errorText: errorText,
          suffixIcon: suffix,
          enabledBorder: border ??
              OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(radius ?? Dimens.dp8),
              ),
          border: border ??
              OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(radius ?? Dimens.dp8),
              )),
    );
  }
}
