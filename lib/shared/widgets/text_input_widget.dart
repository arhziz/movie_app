import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/app_core/app_core.dart';
import 'package:movie_app/shared/shared.dart';

/// This widget is used to create a text input field with various
/// customization options such as label, prefix icon, suffix icon,
/// hint text, and more.
// ignore: must_be_immutable
class TextInputWidget extends StatefulWidget {
  /// Creates an instance of [TextInputWidget].
  /// The [key] parameter is used to identify the widget in the widget tree.
  TextInputWidget({
    super.key,
    this.label,
    this.errorText,
    this.prefixIcon,
    this.suffixIcon,
    this.hintText = 'Text',
    this.isDisabled = false,
    this.isEmail = false,
    this.isPassword = false,
    this.isDigit = false,
    this.extraLink,
    this.isInverse = false,
    this.controller,
    this.focusNode,
    this.lines = 1,
    this.onChange,
    this.validator,
    this.maxLength,
    this.isObscured = false,
  });

  /// The text to be displayed on the button.
  /// Defaults to 'Text'.
  final String hintText;

  /// Is the current input a password?
  /// Defaults to false.
  final bool isPassword;

  /// Is the current input a digit?
  /// Defaults to false.
  /// This is used to determine the keyboard type.
  final bool isDigit;

  /// Is the current input an email?
  /// Defaults to false.
  /// This is used to determine the keyboard type.
  final bool isEmail;

  /// The text to be displayed on the label.
  /// Defaults to null.
  /// This is used to display the label above the input field.
  final String? label;

  /// The text to be displayed on the error message.
  /// Defaults to null.
  /// This is used to display an error message below the input field.
  final String? errorText;

  /// The widget to be displayed as a prefix icon.
  /// Defaults to null.
  /// This is used to display an icon before the input field.
  final Widget? prefixIcon;

  /// The widget to be displayed as a suffix icon.
  /// Defaults to null.
  /// This is used to display an icon after the input field.
  final Widget? suffixIcon;

  /// The widget to be displayed as an extra link.
  /// Defaults to null.
  /// This is used to display an extra link after the input field.
  final Widget? extraLink;

  /// Is the current input disabled?
  /// Defaults to false.
  /// This is used to determine if the input field is enabled or disabled.
  final bool isDisabled;

  /// Is the current input inverse?
  /// Defaults to false.
  /// This is used to determine the color of the input field.
  final bool isInverse;

  /// The controller to be used for the input field.
  /// Defaults to null.
  /// This is used to control the input field.
  /// This is used to get the current value of the input field.
  TextEditingController? controller;

  /// The focus node to be used for the input field.
  /// Defaults to null.
  /// This is used to control the focus of the input field.
  /// This is used to determine if the input field is focused or not.
  FocusNode? focusNode;

  /// The callback function to be called when the input field value changes.
  /// Defaults to null.
  /// This is used to get the current value of the input field.
  /// This is used to get the current value of the input field.
  final void Function(String)? onChange;

  /// The callback function to be called when the input field value changes.
  /// Defaults to null.
  /// This is used to validate the input field.

  final String? Function(String?)? validator;

  /// The maximum length of the input field.
  /// Defaults to null.
  /// This is used to limit the number of characters that can be entered
  /// in the input field.
  final int? maxLength;

  /// The number of lines for the input field.
  /// Defaults to 1.
  final int lines;

  /// Is the current input obscured?
  /// Defaults to false.
  /// This is used to determine if the input field is obscured or not.
  final bool isObscured;
  @override
  State<TextInputWidget> createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget> {
  bool isObscured = false;

  @override
  void initState() {
    if (widget.isPassword) {
      isObscured = true;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null)
          DefaultContainer(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.label!,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: widget.isInverse
                        ? AppColors.white
                        : AppColors.drawerDark,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                if (widget.extraLink != null) widget.extraLink!,
              ],
            ),
          ),
        TextFormField(
          keyboardType: widget.isDigit
              ? TextInputType.number
              : widget.isEmail
                  ? TextInputType.emailAddress
                  : null,
          obscureText: isObscured || widget.isObscured,
          maxLength: widget.maxLength,
          maxLines: widget.lines,
          controller: widget.controller,
          focusNode: widget.focusNode,
          style: AppTextStyles.bodySmall.copyWith(
            color: AppColors.white,
            fontSize: 15.sp,
          ),
          enabled: !widget.isDisabled,
          validator: widget.validator,
          onChanged: (value) => widget.onChange!(value),
          decoration: InputDecoration(
            errorText: widget.errorText,
            errorStyle: AppTextStyles.bodySmall.copyWith(
              color: AppColors.error,
              fontSize: 12.sp,
            ),
            contentPadding: const EdgeInsets.all(
              15,
            ),
            filled: true,
            fillColor: widget.isDisabled
                ? const Color(0xFFF1F1F1).withOpacity(0.5)
                : widget.isInverse
                    ? AppColors.white
                    : Colors.transparent,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: AppColors.bottomSheetDark,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: AppColors.bottomSheetDark,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: AppColors.primaryDark,
                width: 2,
              ),
            ),
            hintText: widget.hintText,
            hintStyle: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.white.withAlpha(100),
              fontSize: 15.sp,
            ),
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.isPassword
                ? _PasswordEyeWidget(
                    isObscured: isObscured,
                    onTap: () {
                      setState(() {
                        isObscured = !isObscured;
                      });
                    },
                  )
                : widget.suffixIcon,
          ),
        ),
      ],
    );
  }
}

class _PasswordEyeWidget extends StatelessWidget {
  const _PasswordEyeWidget({
    required this.onTap,
    this.isObscured = false,
  });
  final bool isObscured;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: !isObscured
          ? SvgPicture.asset(
              AppAssets.iconEyesClosed,
              colorFilter: const ColorFilter.mode(
                AppColors.iconDark,
                BlendMode.srcIn,
              ),
              fit: BoxFit.scaleDown,
            )
          : SvgPicture.asset(
              AppAssets.iconEyes,
              colorFilter:
                  const ColorFilter.mode(AppColors.iconDark, BlendMode.srcIn),
              fit: BoxFit.scaleDown,
            ),
    );
  }
}
