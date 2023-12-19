import 'package:eyeq/controllers/utils/app_colors.dart';
import 'package:eyeq/controllers/utils/common_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController? controller;
  final validator;
  final String? labelText;
  final Color? fillcolor;
  final TextStyle? textStyle;
  final String? fieldHeading;
  final Color? bordercolor;
  final bool? isTextHidden;
  final String? hintText;
  final IconData? buttonIcon;
  final String? prefixIcon;
  final Widget? customPrefix;
  final bool? togglePassword;
  final int? maxLength;
  final int? maxlines;
  final toggleFunction;
  final String? toggleIcon;
  final TextInputType? keyboardType;
  final bool? readOnly;
  final onTap;
  final prefixIconTap;
  final onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focus;
  final bool isEnabled, needDecoration;
  final Widget? customSuffix;

  AppTextField({
    this.controller,
    this.textStyle,
    this.maxlines,
    this.validator,
    this.bordercolor,
    this.labelText,
    this.fillcolor,
    this.hintText,
    this.isTextHidden,
    this.buttonIcon,
    this.prefixIcon,
    this.customPrefix,
    this.onChanged,
    this.togglePassword = false,
    this.toggleFunction,
    this.toggleIcon,
    this.keyboardType,
    this.maxLength,
    this.readOnly,
    this.onTap,
    this.inputFormatters,
    this.prefixIconTap,
    this.fieldHeading,
    this.focus,
    this.isEnabled = true,
    this.needDecoration = true,
    this.customSuffix,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        fieldHeading == null
            ? const SizedBox.shrink()
            : Text(
                fieldHeading ?? '',
                style: CommonFunctions.mediumTextStyle,
              ),
        SizedBox(height: height * 0.01),
        Container(
          decoration: needDecoration
              ? BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 3,
                      blurRadius: 2,
                      offset: const Offset(-1, 1), // changes position of shadow
                    ),
                  ],
                  border: Border.all(
                    color: AppColors.textLightColor,
                    width: 0.7,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                )
              : null,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: TextFormField(
              style: textStyle,
              onChanged: onChanged,
              enabled: isEnabled,
              inputFormatters: inputFormatters,
              obscureText: isTextHidden!,
              readOnly: readOnly == null ? false : true,
              onTap: onTap,
              maxLength: maxLength,
              focusNode: focus,
              keyboardType: keyboardType ?? TextInputType.text,
              textInputAction: TextInputAction.done,
              maxLines: maxlines,
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                prefixIcon: customPrefix ??
                    (prefixIcon != null
                        ? GestureDetector(
                            onTap: prefixIconTap,
                            child: SvgPicture.asset(
                              height: 10,
                              width: 10,
                              prefixIcon!,
                              // color: UIDataColors.blackText,
                            ))
                        : null),
                suffixIcon: togglePassword!
                    ? GestureDetector(
                        onTap: toggleFunction,
                        child:
                            customSuffix ?? SvgPicture.asset(toggleIcon ?? ""),
                      )
                    : customSuffix,
                hintText: hintText,
                fillColor: fillcolor ?? AppColors.lightGreyColor,
                filled: true,
                hintStyle: CommonFunctions.mediumTextStyle.copyWith(
                  color: AppColors.textLightColor,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 15.0,
                  horizontal: 18.0,
                ),
                labelText: labelText,
                labelStyle: CommonFunctions.mediumTextStyle,
              ),
              controller: controller,
              validator: validator,
            ),
          ),
        ),
      ],
    );
  }
}
