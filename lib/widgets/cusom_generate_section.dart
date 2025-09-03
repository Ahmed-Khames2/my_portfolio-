import 'dart:math';
import 'package:flutter/material.dart';

class Section extends StatefulWidget {
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
  State<Section> createState() => _SectionState();
}

class _SectionState extends State<Section> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 60),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final content = Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: widget.maxWidth),
        child: Padding(
          padding: EdgeInsets.only(
            top: widget.padTop,
            bottom: widget.padBottom,
          ),
          child: widget.child,
        ),
      ),
    );

    return Stack(
      children: [
        Positioned.fill(
          child: CodingBackground(controller: _controller),
        ),
        content,
      ],
    );
  }
}

class CodingBackground extends StatefulWidget {
  final AnimationController controller;
  const CodingBackground({super.key, required this.controller});

  @override
  State<CodingBackground> createState() => _CodingBackgroundState();
}

class _CodingBackgroundState extends State<CodingBackground> {
  final Random _rnd = Random();
  final int symbolCount = 60;
  late List<_CodingSymbol> symbols;

  final List<String> symbolsList = [
    "{ }",
    "< />",
    "();",
    "=>",
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
  ];

  @override
  void initState() {
    super.initState();

    symbols = List.generate(symbolCount, (index) {
      final isIcon = _rnd.nextBool();
      final angle = _rnd.nextDouble() * 2 * pi;
      final speed = 0.0005 + _rnd.nextDouble() * 0.0015;

      return _CodingSymbol(
        text: isIcon ? null : symbolsList[_rnd.nextInt(symbolsList.length)],
        icon: isIcon ? iconsList[_rnd.nextInt(iconsList.length)] : null,
        x: _rnd.nextDouble(),
        y: _rnd.nextDouble(),
        size: 14 + _rnd.nextDouble() * 18,
        dx: cos(angle) * speed,
        dy: sin(angle) * speed,
        color: Colors.blueAccent.withOpacity(0.05 + _rnd.nextDouble() * 0.1),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
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
        }

        return CustomPaint(
          painter: CodingBackgroundPainter(symbols),
          child: Container(),
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
  Color color;

  _CodingSymbol({
    this.text,
    this.icon,
    required this.x,
    required this.y,
    required this.size,
    required this.dx,
    required this.dy,
    required this.color,
  });
}

class CodingBackgroundPainter extends CustomPainter {
  final List<_CodingSymbol> symbols;
  CodingBackgroundPainter(this.symbols);

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
  bool shouldRepaint(covariant CodingBackgroundPainter oldDelegate) => true;
}
