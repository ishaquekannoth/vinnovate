import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vinnovate/app/utilities/utils.dart';

enum FieldType {
  eMail,
  password,
}

class CustomFormFieldWithValidation extends StatelessWidget {
  final ValueNotifier<bool> isPasswordShown = ValueNotifier(false);
  final String? Function(String?)? validator;
  final double? borderRadius;
  final FieldType type;
  final String? hintText;
  final String? labelText;
  final TextStyle? hintStyle;
  final IconData? icon;
  final Widget? postFixIcon;
  final Widget? preFixIcon;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry margin;
  final TextEditingController? controller;
  final AutovalidateMode? autovalidateMode;
  final TextStyle? labelStyle;
  final bool? addCountryCode;
  final int? defaultCharLength;
  final void Function(String value)? onChanged;

  final EdgeInsetsGeometry? contentPadding;
  final GlobalKey<FormState>? formKey;
  final bool? isDense;
  final bool? enable;

  final String? obscuringCharacter;
  final double? cursorHeight;
  CustomFormFieldWithValidation({
    this.formKey,
    this.obscuringCharacter,
    this.labelStyle,
    this.contentPadding,
    this.margin = EdgeInsets.zero,
    this.borderRadius,
    this.hintStyle = const TextStyle(color: Colors.grey),
    this.autovalidateMode = AutovalidateMode.disabled,
    this.postFixIcon,
    this.validator,
    this.isDense = false,
    this.enable = true,
    this.padding,
    this.controller,
    required this.type,
    this.hintText = "",
    super.key,
    this.icon = Icons.email,
    this.defaultCharLength,
    this.cursorHeight,
    this.labelText,
    this.onChanged,
    this.addCountryCode = true,
    this.preFixIcon,
  });
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: ValueListenableBuilder(
        valueListenable: isPasswordShown,
        builder: (context, value, child) => Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          margin: margin,
          child: TextFormField(
            onChanged: onChanged,
            enabled: enable,
            cursorHeight: cursorHeight,
            obscuringCharacter: obscuringCharacter ?? '•',
            autovalidateMode: autovalidateMode,
            controller: controller,
            inputFormatters: [
              type == FieldType.eMail
                  ? LengthLimitingTextInputFormatter(defaultCharLength ?? 30)
                  : LengthLimitingTextInputFormatter(defaultCharLength ?? 20),
            ],
            keyboardType: type == FieldType.eMail
                ? TextInputType.emailAddress
                : TextInputType.name,
            obscureText: type == FieldType.password && !isPasswordShown.value,
            decoration: InputDecoration(
              prefixIcon: preFixIcon,
              errorMaxLines: 1,
              hintStyle: hintStyle,
              labelText: labelText,
              hintText: hintText,
              filled: true,
              fillColor:
                  const Color.fromARGB(255, 234, 235, 236).withOpacity(0.5),
              alignLabelWithHint: true,
              suffixIcon: type == FieldType.password
                  ? ValueListenableBuilder(
                      valueListenable: isPasswordShown,
                      builder: (context, value, child) => IconButton(
                          icon: Icon(
                            value
                                ? CupertinoIcons.eye
                                : CupertinoIcons.eye_slash,
                          ),
                          onPressed: () {
                            isPasswordShown.value = !isPasswordShown.value;
                          }),
                    )
                  : null,
              errorStyle: TextStyle(
                height: 0.h,
              ),
              focusedBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              border: InputBorder.none,
            ),
            validator: validator == null &&
                    autovalidateMode != AutovalidateMode.disabled
                ? (type == FieldType.eMail
                    ? (value) {
                        if (value!.isEmpty) {
                          return null;
                        } else if (!value.isValidEmail) {
                          return "Invalid Email Address";
                        } else {
                          return null;
                        }
                      }
                    : (value) {
                        if (value == null) {
                          return null;
                        } else if (value.isNotEmpty &&
                            value.trim().length < 8) {
                          return "Password Should be atleast 8 char's";
                        } else {
                          return null;
                        }
                      })
                : validator,
          ),
        ),
      ),
    );
  }
}
