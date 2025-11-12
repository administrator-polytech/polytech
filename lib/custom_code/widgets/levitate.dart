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
import '/custom_code/actions/index.dart';
import 'dart:math' as math;

class Levitate extends StatefulWidget {
  const Levitate({
    super.key,
    this.width,
    this.height,
    required this.imageUrl,
  });

  final double? width;
  final double? height;
  final String imageUrl;

  @override
  State<Levitate> createState() => _LevitateState();
}

class _LevitateState extends State<Levitate>
    with SingleTickerProviderStateMixin {
  late AnimationController _levitateController;
  late Animation<double> _levitateAnimation;

  // Elastic bounce physics
  double _bounceOffset = 0.0;
  double _velocity = 0.0;

  // Parallax
  double _parallaxOffset = 0.0;

  // Track scroll velocity
  double _scrollVelocity = 0.0;
  DateTime _lastUpdateTime = DateTime.now();

  // Physics constants
  static const double _springConstant = 0.18;
  static const double _dampingFactor = 0.85;
  static const double _mass = 1.0;
  static const double _parallaxFactor = 0.25;
  static const double _bounceFactor = 1.5;

  @override
  void initState() {
    super.initState();
    _levitateController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);

    _levitateAnimation = Tween<double>(begin: -12.0, end: 12.0).animate(
      CurvedAnimation(parent: _levitateController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _levitateController.dispose();
    super.dispose();
  }

  void _animateElasticBounce() {
    Future.doWhile(() async {
      await Future.delayed(const Duration(milliseconds: 16));
      if (mounted) {
        setState(() {
          // Spring physics: F = -kx
          final springForce = -_springConstant * _bounceOffset;
          final acceleration = springForce / _mass;

          // Update velocity with acceleration
          _velocity += acceleration;

          // Apply damping
          _velocity *= _dampingFactor;

          // Update position
          _bounceOffset += _velocity;

          // Stop when motion is negligible
          if (_bounceOffset.abs() < 0.15 && _velocity.abs() < 0.15) {
            _bounceOffset = 0.0;
            _velocity = 0.0;
          }
        });
      }
      return mounted && (_bounceOffset.abs() > 0.15 || _velocity.abs() > 0.15);
    });
  }

  void _animateParallaxReturn() {
    Future.doWhile(() async {
      await Future.delayed(const Duration(milliseconds: 16));
      if (mounted) {
        setState(() {
          _parallaxOffset *= 0.88;
          if (_parallaxOffset.abs() < 0.5) {
            _parallaxOffset = 0.0;
          }
        });
      }
      return mounted && _parallaxOffset.abs() > 0.5;
    });
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        final now = DateTime.now();

        if (notification is ScrollUpdateNotification) {
          // Calculate velocity based on scroll delta and time
          final timeDelta = now.difference(_lastUpdateTime).inMilliseconds;
          if (timeDelta > 0) {
            final scrollDelta = notification.scrollDelta ?? 0.0;
            _scrollVelocity =
                scrollDelta / timeDelta * 16.0; // Normalize to 60fps
          }
          _lastUpdateTime = now;

          // Real-time subtle parallax feedback
          if (mounted) {
            setState(() {
              final delta = notification.scrollDelta ?? 0.0;
              _parallaxOffset = (delta * _parallaxFactor).clamp(-60.0, 60.0);
            });
          }
        }

        if (notification is ScrollEndNotification) {
          // Trigger bounce based on scroll velocity
          if (mounted) {
            setState(() {
              _bounceOffset = _scrollVelocity * _bounceFactor;
              _velocity = _scrollVelocity * 0.5;
            });
          }

          // Reset velocity tracking
          _scrollVelocity = 0.0;

          // Start animations
          _animateElasticBounce();
          _animateParallaxReturn();
        }

        return false;
      },
      child: AnimatedBuilder(
        animation: _levitateAnimation,
        builder: (context, child) {
          // Combine all movements: levitation + bounce + parallax
          final totalVerticalOffset = _levitateAnimation.value + _bounceOffset;
          final totalHorizontalOffset = _parallaxOffset * 0.15;

          // Add slight rotation based on bounce
          final rotation = (_bounceOffset / 150) * 0.08;

          // Add slight scale effect for more juice
          final scale = 1.0 + (_bounceOffset.abs() / 1000).clamp(0.0, 0.03);

          return Transform(
            transform: Matrix4.identity()
              ..translate(totalHorizontalOffset, totalVerticalOffset)
              ..rotateZ(rotation)
              ..scale(scale),
            alignment: Alignment.center,
            child: child,
          );
        },
        child: Image.network(
          widget.imageUrl,
          width: widget.width ?? 200,
          height: widget.height ?? 200,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              width: widget.width ?? 200,
              height: widget.height ?? 200,
              color: Colors.grey[300],
              child: const Icon(Icons.image, size: 50, color: Colors.grey),
            );
          },
        ),
      ),
    );
  }
}
