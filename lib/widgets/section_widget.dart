import 'package:flutter/material.dart';

class Section extends StatelessWidget {
  final Widget child;
  final double maxWidth;
  final double padTop;
  final double padBottom;

  const Section({
    super.key,
    required this.child,
    this.maxWidth = 1100,
    this.padTop = 56,
    this.padBottom = 56,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: Padding(
          padding: EdgeInsets.only(
            top: padTop,
            bottom: padBottom,
          ),
          child: child,
        ),
      ),
    );
  }
}
