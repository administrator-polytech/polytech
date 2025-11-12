// Automatic FlutterFlow imports
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:math' as math;
import 'dart:async';

class GlowingDot {
  Offset position;
  double glowPhase;
  double glowSpeed;
  double maxGlowIntensity;
  double currentGlowRadius;

  GlowingDot({
    required this.position,
  })  : glowPhase = math.Random().nextDouble() * math.pi * 2,
        glowSpeed =
            0.01 + math.Random().nextDouble() * 0.015, // Slower for mobile
        maxGlowIntensity = 0.15 + math.Random().nextDouble() * 0.2,
        currentGlowRadius = 2.0;

  void update() {
    glowPhase += glowSpeed;
    if (glowPhase > math.pi * 2) {
      glowPhase = 0;
    }

    currentGlowRadius = 2 + math.sin(glowPhase) * 1.2 * maxGlowIntensity;
  }

  double get glowOpacity =>
      (0.05 + math.sin(glowPhase) * maxGlowIntensity).clamp(0.0, 0.3);
}

class Background extends StatefulWidget {
  const Background({
    super.key,
    this.width,
    this.height,
    this.dotSpacing = 50,
    this.connectionDistance = 150.0,
    this.dotColor = Colors.blue,
    this.lineColor = Colors.blue,
    this.dotSize = 2.0,
    this.lineWidth = 1.0,
    this.marginTop = 30.0,
    this.marginBottom = 30.0,
    this.marginLeft = 30.0,
    this.marginRight = 30.0,
  });

  final double? width;
  final double? height;
  final int dotSpacing;
  final double connectionDistance;
  final Color dotColor;
  final Color lineColor;
  final double dotSize;
  final double lineWidth;
  final double marginTop;
  final double marginBottom;
  final double marginLeft;
  final double marginRight;

  @override
  State<Background> createState() => _BackgroundState();
}

class _BackgroundState extends State<Background> with TickerProviderStateMixin {
  Offset interactionPosition = Offset(-1000, -1000);
  List<GlowingDot> glowingDots = [];
  late AnimationController glowController;

  // Simple fade state
  double fadeOpacity = 0.0;
  Timer? fadeTimer;
  bool isActive = false;

  @override
  void initState() {
    super.initState();

    // Simple timer for glow animation - more reliable on mobile
    glowController = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    )..repeat();

    glowController.addListener(() {
      if (mounted) {
        setState(() {
          for (var dot in glowingDots) {
            dot.update();
          }
        });
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final size = MediaQuery.of(context).size;
    if (size.width > 0 && size.height > 0) {
      generateGlowingDotGrid();
    }
  }

  void generateGlowingDotGrid() {
    final size = MediaQuery.of(context).size;
    final width = widget.width ?? size.width;
    final height = widget.height ?? size.height;

    glowingDots.clear();

    double drawableWidth = width - widget.marginLeft - widget.marginRight;
    double drawableHeight = height - widget.marginTop - widget.marginBottom;

    int dotsX = (drawableWidth / widget.dotSpacing).floor() + 1;
    int dotsY = (drawableHeight / widget.dotSpacing).floor() + 1;

    double actualSpacingX = dotsX > 1 ? drawableWidth / (dotsX - 1) : 0;
    double actualSpacingY = dotsY > 1 ? drawableHeight / (dotsY - 1) : 0;

    for (int i = 0; i < dotsX; i++) {
      for (int j = 0; j < dotsY; j++) {
        double x = widget.marginLeft + (i * actualSpacingX);
        double y = widget.marginTop + (j * actualSpacingY);

        x = math.min(x, width - widget.marginRight);
        y = math.min(y, height - widget.marginBottom);

        glowingDots.add(GlowingDot(position: Offset(x, y)));
      }
    }
  }

  void _showInteraction(Offset position) {
    setState(() {
      interactionPosition = position;
      fadeOpacity = 1.0;
      isActive = true;
    });

    fadeTimer?.cancel();
  }

  void _hideInteraction() {
    setState(() {
      isActive = false;
    });

    // Simple fade out
    fadeTimer = Timer.periodic(Duration(milliseconds: 50), (timer) {
      setState(() {
        fadeOpacity -= 0.05;
        if (fadeOpacity <= 0.0) {
          fadeOpacity = 0.0;
          interactionPosition = Offset(-1000, -1000);
          timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    glowController.dispose();
    fadeTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: Listener(
        // Use Listener for better mobile support
        onPointerDown: (event) {
          _showInteraction(event.localPosition);
        },
        onPointerMove: (event) {
          if (isActive) {
            setState(() {
              interactionPosition = event.localPosition;
            });
          }
        },
        onPointerUp: (event) {
          _hideInteraction();
        },
        onPointerCancel: (event) {
          _hideInteraction();
        },
        // Also keep MouseRegion for desktop
        child: MouseRegion(
          cursor: SystemMouseCursors.none,
          onEnter: (event) {
            _showInteraction(event.localPosition);
          },
          onHover: (event) {
            if (isActive || true) {
              // Always update on desktop
              setState(() {
                interactionPosition = event.localPosition;
                fadeOpacity = 1.0;
              });
            }
          },
          onExit: (event) {
            _hideInteraction();
          },
          child: CustomPaint(
            size: Size(
              widget.width ?? double.infinity,
              widget.height ?? double.infinity,
            ),
            painter: SimplifiedGlowPainter(
              interactionPosition: interactionPosition,
              glowingDots: glowingDots,
              connectionDistance: widget.connectionDistance,
              dotColor: widget.dotColor,
              lineColor: widget.lineColor,
              dotSize: widget.dotSize,
              lineWidth: widget.lineWidth,
              fadeOpacity: fadeOpacity,
            ),
          ),
        ),
      ),
    );
  }
}

class SimplifiedGlowPainter extends CustomPainter {
  final Offset interactionPosition;
  final List<GlowingDot> glowingDots;
  final double connectionDistance;
  final Color dotColor;
  final Color lineColor;
  final double dotSize;
  final double lineWidth;
  final double fadeOpacity;

  SimplifiedGlowPainter({
    required this.interactionPosition,
    required this.glowingDots,
    required this.connectionDistance,
    required this.dotColor,
    required this.lineColor,
    required this.dotSize,
    required this.lineWidth,
    required this.fadeOpacity,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Draw glowing dots - simplified for mobile performance
    for (final glowingDot in glowingDots) {
      // Draw glow effect only if visible
      if (glowingDot.glowOpacity > 0.05) {
        final glowPaint = Paint()
          ..color = dotColor
              .withOpacity(glowingDot.glowOpacity * 0.8) // Slightly dimmer
          ..style = PaintingStyle.fill
          ..maskFilter =
              MaskFilter.blur(BlurStyle.normal, glowingDot.currentGlowRadius)
          ..isAntiAlias = true; // Added for smoother rendering

        canvas.drawCircle(glowingDot.position,
            dotSize + glowingDot.currentGlowRadius, glowPaint);
      }

      // Always draw the main dot
      final dotPaint = Paint()
        ..color = dotColor
        ..style = PaintingStyle.fill
        ..isAntiAlias = true; // Added for smoother rendering

      canvas.drawCircle(glowingDot.position, dotSize, dotPaint);

      // Subtle inner highlight
      final highlightPaint = Paint()
        ..color = dotColor.withOpacity(0.4)
        ..style = PaintingStyle.fill
        ..isAntiAlias = true; // Added for smoother rendering

      canvas.drawCircle(glowingDot.position, dotSize * 0.4, highlightPaint);
    }

    // Draw connection lines with fade
    if (interactionPosition.dx >= 0 &&
        interactionPosition.dy >= 0 &&
        fadeOpacity > 0.0) {
      for (final glowingDot in glowingDots) {
        final distance = (interactionPosition - glowingDot.position).distance;

        if (distance <= connectionDistance && distance > 0) {
          final distanceOpacity =
              (1.0 - (distance / connectionDistance)).clamp(0.0, 1.0);
          final finalOpacity = distanceOpacity * fadeOpacity * 0.8;

          if (finalOpacity > 0.02) {
            // Only draw if visible enough
            final connectionPaint = Paint()
              ..color = lineColor.withOpacity(finalOpacity)
              ..strokeWidth = lineWidth * distanceOpacity
              ..style = PaintingStyle.stroke
              ..isAntiAlias = true; // Added for smoother rendering

            canvas.drawLine(
                interactionPosition, glowingDot.position, connectionPaint);
          }
        }
      }
    }
  }

  @override
  bool shouldRepaint(SimplifiedGlowPainter oldDelegate) {
    return interactionPosition != oldDelegate.interactionPosition ||
        fadeOpacity != oldDelegate.fadeOpacity;
  }
}
