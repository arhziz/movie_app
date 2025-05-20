import 'package:flutter/material.dart';

//ignore: must_be_immutable
/// A widget that provides a default container with a bottom margin.
/// The [DefaultContainer] widget is a stateless widget that takes a [child]
/// widget
class DefaultContainer extends StatelessWidget {
  /// Creates a [DefaultContainer] widget.
  /// The [child] parameter is required and is the widget that will be
  ///  displayed inside the container.
  const DefaultContainer({
    required this.child,
    super.key,
    this.marginBottom = 10,
  });

  /// The bottom margin of the container.
  /// This value is used to set the bottom margin of the container.
  final double marginBottom;

  /// The child widget that will be displayed inside the container.
  /// This widget is required and cannot be null.
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: marginBottom),
      child: child,
    );
  }
}
