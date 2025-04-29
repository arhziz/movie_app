import 'package:flutter/material.dart';
import 'package:movie_app/app_core/app_core.dart';

///@template text_button_widget
/// TextButtonWidget widget
///@endtemplate
class TextButtonWidget extends StatelessWidget {
  /// {@macro text_button_widget}
  const TextButtonWidget({
    super.key,
    this.text = 'Text',
    this.onPressed,
    this.color = AppColors.white,
  });

  /// The text to be displayed on the button.
  /// Defaults to 'Text'.
  final String text;

  /// The callback function to be called when the button is pressed.
  /// Defaults to null.
  final VoidCallback? onPressed;

  /// The color of the button.
  /// Defaults to white.
  /// This color is used for the text and the background of the button.
  final Color color;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: Colors.transparent,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        text,
        style: AppTextStyles.bodySmall.copyWith(
          color: color,
        ),
      ),
    );
  }
}
