import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/app_core/app_core.dart';

/// A widget that represents an icon button.
/// The [IconButtonWidget] is a stateless widget that takes an [icon] and
/// an [onPressed] callback.
/// It is used to create a button with an icon that can be pressed.
class IconButtonWidget extends StatelessWidget {
  /// Creates an [IconButtonWidget].
  /// The [icon] parameter is required and is the icon to be displayed on the
  /// button.
  const IconButtonWidget({
    required this.icon,
    required this.onPressed,
    super.key,
  });

  /// The icon to be displayed on the button.
  /// This parameter is required and cannot be null.
  final String icon;

  /// The callback function to be called when the button is pressed.
  /// This parameter is required and cannot be null.
  /// It is used to define the action to be performed when the button is
  /// pressed.
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        decoration: BoxDecoration(
          color: AppColors.secondaryDark,
          borderRadius: BorderRadius.circular(15),
        ),
        child: SvgPicture.asset(
          icon,
          width: 24,
          height: 24,
        ),
      ),
    );
  }
}
