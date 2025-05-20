import 'package:flutter/material.dart';
import 'package:movie_app/app_core/app_core.dart';

///
class ClickableContainerWidget extends StatelessWidget {
  ///
  const ClickableContainerWidget({
    required this.child,
    this.onTap,
    this.isActive = false,
    this.bgColor,
    super.key,
  });

  ///This is the child of this container
  final Widget child;

  ///
  final Color? bgColor;

  ///
  final VoidCallback? onTap;

  ///Checking if the current widge this active
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(AppDimens.p2),
        decoration: BoxDecoration(
          color: isActive
              ? AppColors.primaryDark
              : bgColor ?? AppColors.white.withOpacity(0.11),
          border: Border.all(
            color: AppColors.white.withAlpha(100),
          ),
          borderRadius: BorderRadius.circular(
            AppDimens.p28,
          ),
        ),
        child: child,
      ),
    );
  }
}
