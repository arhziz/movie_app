import 'package:flutter/material.dart';
import 'package:movie_app/app_core/app_core.dart';
import 'package:movie_app/shared/shared.dart';

///@template text_button_widget
/// TextButtonWidget widget
///@endtemplate
class PrimaryButtonWidget extends StatelessWidget {
  /// {@macro text_button_widget}
  const PrimaryButtonWidget({
    this.text = 'Label',
    this.onPressed,
    super.key,
    this.color = Colors.white,
    this.backgroundColor = AppColors.primaryDark,
    this.borderRadius = 15,
    this.isDisabled = false,
  });

  /// The text to be displayed on the button.
  /// Defaults to 'Label'.
  final String text;

  /// The callback function to be called when the button is pressed.
  /// Defaults to null.
  final VoidCallback? onPressed;

  /// The color of the button.
  /// Defaults to white.
  final Color color;

  /// The background color of the button.
  /// Defaults to blue.
  final Color backgroundColor;

  ///Checking if the button is disabled
  final bool isDisabled;

  /// The border radius of the button.
  /// Defaults to 8.0.
  /// This value is used to create rounded corners for the button.
  final double borderRadius;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.sizeWidth,
      decoration: BoxDecoration(
        color: !isDisabled ? backgroundColor : Colors.grey.withAlpha(100),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        child: Text(
          text,
          style: AppTextStyles.bodySmall.copyWith(
            color: !isDisabled ? color : Colors.grey,
            fontSize: AppDimens.p16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
