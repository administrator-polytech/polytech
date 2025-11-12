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

import '/custom_code/widgets/index.dart';

import 'dart:math' as math;

class Galaxy extends StatefulWidget {
  const Galaxy({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<Galaxy> createState() => _GalaxyState();
}

class _GalaxyState extends State<Galaxy> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<Star> stars = [];
  Offset? pointerPosition;
  final math.Random random = math.Random();

  // Interaction parameters matching the JS code
  final double interactionRadius = 100.0;
  final double distortionIntensity = 0.3;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 120),
      vsync: this,
    )..repeat();

    _generateStars();
  }

  void _generateStars() {
    final centerX = (widget.width ?? 400) / 2;
    final centerY = (widget.height ?? 400) / 2;

    // Background stars
    for (int i = 0; i < 800; i++) {
      final radius = random.nextDouble() * math.min(centerX, centerY);
      final angle = random.nextDouble() * 2 * math.pi;

      final x = centerX + radius * math.cos(angle);
      final y = centerY + radius * math.sin(angle);

      stars.add(Star(
        originalX: x,
        originalY: y,
        x: x,
        y: y,
        size: random.nextDouble() * 0.8 + 0.3,
        color: const Color(0xFFE8D7F1),
        opacity: random.nextDouble() * 0.6 + 0.2,
        layer: 0,
      ));
    }

    // Spiral arms (2 arms)
    for (int arm = 0; arm < 2; arm++) {
      final armAngle = (arm * math.pi);

      for (int i = 0; i < 1000; i++) {
        final t = (i / 1000) * 4;
        final baseRadius = 20.0 + t * 40;
        final spiralAngle = armAngle + t * 0.4;

        final scatter = (random.nextDouble() - 0.5) * 15;
        final angleScatter = (random.nextDouble() - 0.5) * 0.3;

        final radius = baseRadius + scatter;
        final angle = spiralAngle + angleScatter;

        final x = centerX + radius * math.cos(angle);
        final y = centerY + radius * math.sin(angle);

        final colors = [
          const Color(0xFFB8B8FF),
          const Color(0xFFC5A3FF),
          const Color(0xFF7AA2E3),
          const Color(0xFFD4A5D4),
          const Color(0xFFB565D8),
        ];

        stars.add(Star(
          originalX: x,
          originalY: y,
          x: x,
          y: y,
          size: random.nextDouble() * 1.5 + 0.5,
          color: colors[random.nextInt(colors.length)],
          opacity: random.nextDouble() * 0.6 + 0.4,
          layer: 1,
        ));
      }
    }

    // Core stars
    for (int i = 0; i < 300; i++) {
      final radius = math.pow(random.nextDouble(), 2).toDouble() * 30;
      final angle = random.nextDouble() * 2 * math.pi;

      final x = centerX + radius * math.cos(angle);
      final y = centerY + radius * math.sin(angle);

      final colors = [
        const Color(0xFFE0BBE4),
        const Color(0xFFD291BC),
        const Color(0xFFFEC8D8),
        const Color(0xFFB565D8),
      ];

      stars.add(Star(
        originalX: x,
        originalY: y,
        x: x,
        y: y,
        size: random.nextDouble() * 2.2 + 1.8,
        color: colors[random.nextInt(colors.length)],
        opacity: 0.8,
        layer: 2,
      ));
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanStart: (details) =>
          setState(() => pointerPosition = details.localPosition),
      onPanUpdate: (details) =>
          setState(() => pointerPosition = details.localPosition),
      onPanEnd: (_) => setState(() => pointerPosition = null),
      onPanCancel: () => setState(() => pointerPosition = null),
      child: MouseRegion(
        onHover: (event) =>
            setState(() => pointerPosition = event.localPosition),
        onExit: (_) => setState(() => pointerPosition = null),
        child: Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            gradient: RadialGradient(
              center: Alignment.center,
              radius: 1.8,
              colors: const [
                Color(0xFF0D0221),
                Color(0xFF1A1034),
                Color(0xFF2D1B3D),
                Color(0xFF0A0E27),
              ],
              stops: const [0.0, 0.4, 0.7, 1.0],
            ),
          ),
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return CustomPaint(
                painter: GalaxyPainter(
                  stars: stars,
                  pointerPosition: pointerPosition,
                  rotation: _controller.value * 2 * math.pi,
                  interactionRadius: interactionRadius,
                  distortionIntensity: distortionIntensity,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class Star {
  double originalX;
  double originalY;
  double x;
  double y;
  double size;
  Color color;
  double opacity;
  int layer;

  Star({
    required this.originalX,
    required this.originalY,
    required this.x,
    required this.y,
    required this.size,
    required this.color,
    required this.opacity,
    required this.layer,
  });
}

class GalaxyPainter extends CustomPainter {
  final List<Star> stars;
  final Offset? pointerPosition;
  final double rotation;
  final double interactionRadius;
  final double distortionIntensity;

  GalaxyPainter({
    required this.stars,
    required this.pointerPosition,
    required this.rotation,
    required this.interactionRadius,
    required this.distortionIntensity,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;
    final centerX = size.width / 2;
    final centerY = size.height / 2;

    // Sort by layer for proper rendering order
    final sortedStars = List<Star>.from(stars)
      ..sort((a, b) => a.layer.compareTo(b.layer));

    for (var star in sortedStars) {
      // Reset to original position
      star.x = star.originalX;
      star.y = star.originalY;

      // Apply distortion if pointer is nearby (matching the JS shader logic)
      if (pointerPosition != null) {
        final dx = star.originalX - pointerPosition!.dx;
        final dy = star.originalY - pointerPosition!.dy;
        final distance = math.sqrt(dx * dx + dy * dy);

        if (distance < interactionRadius) {
          // Calculate distortion based on distance (similar to shader effect)
          final distortionFactor = 1.0 - (distance / interactionRadius);
          final distortion =
              distortionFactor * distortionIntensity * interactionRadius;

          // Push particles away from pointer
          final angle = math.atan2(dy, dx);
          star.x += math.cos(angle) * distortion;
          star.y += math.sin(angle) * distortion;
        }
      }

      // Apply rotation (different speed based on distance from center)
      final dx = star.x - centerX;
      final dy = star.y - centerY;
      final radius = math.sqrt(dx * dx + dy * dy);
      final angle = math.atan2(dy, dx);

      // Differential rotation (inner parts rotate faster)
      final rotationSpeed =
          radius < 30 ? 0.0002 : 0.0001 / math.sqrt(radius / 50);
      final rotatedAngle = angle + rotation * rotationSpeed;

      final drawX = centerX + radius * math.cos(rotatedAngle);
      final drawY = centerY + radius * math.sin(rotatedAngle);

      // Draw star with glow for larger ones
      paint.color = star.color.withOpacity(star.opacity);
      canvas.drawCircle(Offset(drawX, drawY), star.size, paint);

      // Add glow effect for core and bright stars
      if (star.layer >= 1 && star.size > 1.0) {
        paint.color = star.color.withOpacity(star.opacity * 0.3);
        canvas.drawCircle(Offset(drawX, drawY), star.size * 2.5, paint);
      }
    }

    // Draw pointer indicator
    if (pointerPosition != null) {
      // Outer ring
      paint.color = const Color(0xFFB565D8).withOpacity(0.2);
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 2;
      canvas.drawCircle(pointerPosition!, interactionRadius, paint);

      // Inner dot
      paint.style = PaintingStyle.fill;
      paint.color = const Color(0xFFD291BC).withOpacity(0.7);
      canvas.drawCircle(pointerPosition!, 3, paint);
    }
  }

  @override
  bool shouldRepaint(GalaxyPainter oldDelegate) => true;
}
