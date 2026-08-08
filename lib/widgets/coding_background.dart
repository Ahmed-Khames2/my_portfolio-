import 'dart:math';
import 'package:flutter/material.dart';

class CodingBackground extends StatefulWidget {
  final AnimationController controller;
  const CodingBackground({super.key, required this.controller});

  @override
  State<CodingBackground> createState() => _CodingBackgroundState();
}

class _CodingBackgroundState extends State<CodingBackground> {
  final Random _rnd = Random();
  final int symbolCount = 40;
  late List<_CodingSymbol> symbols;

  final List<String> symbolsList = [
    "1000001",
    "1001011",
    "Flutter",
    "Dart",
    "var",
    "int",
    "bool",
  ];

  final List<IconData> iconsList = [
    Icons.flutter_dash,
    Icons.code,
    Icons.computer,
    Icons.code_off,
  ];

  @override
  void initState() {
    super.initState();

    symbols = List.generate(symbolCount, (index) {
      final isIcon = _rnd.nextBool();
      final angle = _rnd.nextDouble() * 2 * pi;
      final speed = 0.0001 + _rnd.nextDouble() * 0.0003;

      return _CodingSymbol(
        text: isIcon ? null : symbolsList[_rnd.nextInt(symbolsList.length)],
        icon: isIcon ? iconsList[_rnd.nextInt(iconsList.length)] : null,
        x: _rnd.nextDouble(),
        y: _rnd.nextDouble(),
        size: 14 + _rnd.nextDouble() * 18,
        dx: cos(angle) * speed,
        dy: sin(angle) * speed,
        opacityFactor: 0.05 + _rnd.nextDouble() * 0.1,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return AnimatedBuilder(
      animation: widget.controller,
      builder: (context, _) {
        for (var s in symbols) {
          s.x += s.dx;
          s.y += s.dy;

          if (s.x > 1) s.x = 0;
          if (s.x < 0) s.x = 1;
          if (s.y > 1) s.y = 0;
          if (s.y < 0) s.y = 1;

          s.color = colorScheme.primary.withValues(alpha: s.opacityFactor);
        }

        return CustomPaint(
          painter: _CodingBackgroundPainter(symbols),
          child: const SizedBox.expand(),
        );
      },
    );
  }
}

class _CodingSymbol {
  String? text;
  IconData? icon;
  double x;
  double y;
  double size;
  double dx;
  double dy;
  double opacityFactor;
  Color color;

  _CodingSymbol({
    this.text,
    this.icon,
    required this.x,
    required this.y,
    required this.size,
    required this.dx,
    required this.dy,
    required this.opacityFactor,
  }) : color = Colors.transparent;
}

class _CodingBackgroundPainter extends CustomPainter {
  final List<_CodingSymbol> symbols;
  _CodingBackgroundPainter(this.symbols);

  @override
  void paint(Canvas canvas, Size size) {
    final textPainter = TextPainter(textDirection: TextDirection.ltr);

    for (var s in symbols) {
      final dx = s.x * size.width;
      final dy = s.y * size.height;

      if (s.text != null) {
        textPainter.text = TextSpan(
          text: s.text,
          style: TextStyle(
            fontSize: s.size,
            color: s.color,
            fontWeight: FontWeight.bold,
          ),
        );
        textPainter.layout();
        textPainter.paint(canvas, Offset(dx, dy));
      } else if (s.icon != null) {
        final iconPainter = TextPainter(
          text: TextSpan(
            text: String.fromCharCode(s.icon!.codePoint),
            style: TextStyle(
              fontSize: s.size,
              fontFamily: s.icon!.fontFamily,
              color: s.color,
            ),
          ),
          textDirection: TextDirection.ltr,
        );
        iconPainter.layout();
        iconPainter.paint(canvas, Offset(dx, dy));
      }
    }
  }

  @override
  bool shouldRepaint(covariant _CodingBackgroundPainter oldDelegate) => true;
}
