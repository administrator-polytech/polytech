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

class ShowCaseImage extends StatefulWidget {
  const ShowCaseImage({
    super.key,
    this.width,
    this.height,
    required this.url,
  });

  final double? width;
  final double? height;
  final String url;

  @override
  State<ShowCaseImage> createState() => _ShowCaseImageState();
}

class _ShowCaseImageState extends State<ShowCaseImage> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: Stack(
        children: [
          // Main image with clipping
          ClipPath(
            clipper: TopRightTriangleClipper(),
            child: Container(
              width: widget.width,
              height: widget.height,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.url),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // White triangle overlay for the cut corner
          Positioned(
            top: 0,
            right: 0,
            child: CustomPaint(
              size: Size(40, 40), // Adjust triangle size here
              painter: TrianglePainter(),
            ),
          ),
        ],
      ),
    );
  }
}

// Custom clipper to remove top-right triangle from image
class TopRightTriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    const double cutSize = 40.0; // Size of the triangular cut

    // Start from top-left corner
    path.lineTo(0, 0);
    // Draw to top-right minus the cut
    path.lineTo(size.width - cutSize, 0);
    // Draw diagonal cut
    path.lineTo(size.width, cutSize);
    // Draw to bottom-right
    path.lineTo(size.width, size.height);
    // Draw to bottom-left
    path.lineTo(0, size.height);
    // Close the path
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

// Painter to draw white triangle in top-right corner
class TrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFFFFFFF)
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(0, 0); // Top-left of triangle
    path.lineTo(size.width, 0); // Top-right
    path.lineTo(size.width, size.height); // Bottom-right
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
