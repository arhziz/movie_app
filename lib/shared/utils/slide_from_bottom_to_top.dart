import 'package:flutter/material.dart';

///
class SlideFromBottomRoute<T> extends PageRouteBuilder<T> {
  /// Creates a [SlideFromBottomRoute] that slides the new page in from
  /// the bottom.
  SlideFromBottomRoute({required Widget page})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final tween = Tween(begin: const Offset(0, 1), end: Offset.zero)
                .chain(CurveTween(curve: Curves.easeOut));
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        );
}
