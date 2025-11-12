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

class Parallax extends StatefulWidget {
  const Parallax({
    super.key,
    this.width,
    this.height,
    this.image,
    this.movementFactor = -0.7,
    this.enableHorizontalParallax = false,
    this.debugMode = false, // Add this to see what's happening
  });

  final double? width;
  final double? height;
  final Widget Function()? image;
  final double movementFactor;
  final bool enableHorizontalParallax;
  final bool debugMode;

  @override
  State<Parallax> createState() => _ParallaxState();
}

class _ParallaxState extends State<Parallax> {
  final GlobalKey _containerKey = GlobalKey();
  double _parallaxOffset = 0.0;
  double _lastKnownPosition = double.infinity;

  // Debug info
  double _distanceFromCenter = 0.0;
  double _rawOffset = 0.0;
  double _maxOffset = 0.0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startPositionMonitoring();
    });
  }

  // Much more aggressive formula for dramatic effects
  double _calculateMaxOffset(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double absMovementFactor = widget.movementFactor.abs();

    // More aggressive formula - allow much larger movements
    final double baseOffset =
        screenSize.height * 0.3; // 30% of screen as base (was 10%)
    final double scalingFactor =
        math.pow(absMovementFactor, 0.6) * 200; // Higher multiplier (was 80)
    final double maxAllowed =
        screenSize.height * 1.5; // 150% of screen (was 70%)

    return math.min(maxAllowed, math.max(200.0, baseOffset + scalingFactor));
  }

  void _startPositionMonitoring() {
    void scheduleFrame() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          _updateParallax();
          scheduleFrame();
        }
      });
    }

    scheduleFrame();
  }

  void _updateParallax() {
    if (!mounted || _containerKey.currentContext == null) return;

    try {
      final RenderBox? renderBox =
          _containerKey.currentContext!.findRenderObject() as RenderBox?;
      if (renderBox == null) return;

      // Get current position
      final Offset globalPosition = renderBox.localToGlobal(Offset.zero);
      final double currentY = globalPosition.dy;

      // Skip if position hasn't changed much
      if ((currentY - _lastKnownPosition).abs() < 0.5) return;
      _lastKnownPosition = currentY;

      // Get screen center
      final Size screenSize = MediaQuery.of(context).size;
      final double screenCenter = screenSize.height / 2;

      // Calculate distance from center
      _distanceFromCenter = screenCenter - currentY;

      // Apply movement factor - this is the raw calculation
      _rawOffset = _distanceFromCenter * widget.movementFactor;

      // Apply dynamic bounds
      _maxOffset = _calculateMaxOffset(context);
      double newParallaxOffset = _rawOffset.clamp(-_maxOffset, _maxOffset);

      // Update only if significant change
      if ((_parallaxOffset - newParallaxOffset).abs() > 1.0) {
        setState(() {
          _parallaxOffset = newParallaxOffset;
        });
      }
    } catch (e) {
      debugPrint('Parallax error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: _containerKey,
      width: widget.width,
      height: widget.height,
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(),
      child: Stack(
        children: [
          // Main parallax content
          if (widget.image != null)
            Transform.translate(
              offset: Offset(0.0, _parallaxOffset),
              child: widget.image!(),
            )
          else
            Container(
              color: Colors.grey[300],
              child: Center(
                child: Text(
                  'No Image Provided',
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ),
            ),

          // Debug overlay
          if (widget.debugMode)
            Positioned(
              top: 10,
              left: 10,
              child: Container(
                padding: EdgeInsets.all(8),
                color: Colors.black.withOpacity(0.7),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Factor: ${widget.movementFactor}',
                        style: TextStyle(color: Colors.white, fontSize: 12)),
                    Text('Distance: ${_distanceFromCenter.toStringAsFixed(1)}',
                        style: TextStyle(color: Colors.white, fontSize: 12)),
                    Text('Raw Offset: ${_rawOffset.toStringAsFixed(1)}',
                        style: TextStyle(color: Colors.white, fontSize: 12)),
                    Text('Max Allowed: ${_maxOffset.toStringAsFixed(1)}',
                        style: TextStyle(color: Colors.white, fontSize: 12)),
                    Text('Final Offset: ${_parallaxOffset.toStringAsFixed(1)}',
                        style: TextStyle(color: Colors.white, fontSize: 12)),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
