import 'package:flutter/material.dart';


class CutContainerPainter extends CustomPainter {
  final LinearGradient linearGradient;
  final Color bgColor;
  final double borderStrokeWidth;

  CutContainerPainter({
    required this.linearGradient, 
    required this.bgColor,
    required this.borderStrokeWidth
  });

  final double containerRadius = 20.0; // Radius for the rounded edges
  final double smoothRadius = 5.0; // Radius for the cut rounded edges
  

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = bgColor
      ..style = PaintingStyle.fill;

    final path = Path();

    // Move to top left corner with rounded corner
    path.moveTo(containerRadius, 0);

    // Line to top right corner before the first smooth curve
    path.lineTo(size.width - containerRadius - smoothRadius*2, 0);

    // First smooth curve before the 45-degree cut
    path.quadraticBezierTo(
      size.width - containerRadius - smoothRadius, 0,
      size.width - containerRadius, smoothRadius,
    );

    // 45-degree cut
    //path.lineTo(size.width - smoothRadius, cutSize + smoothRadius);
    path.lineTo(size.width - smoothRadius, containerRadius + 0);

    // Second smooth curve after the 45-degree cut
    path.quadraticBezierTo(
      size.width, containerRadius + smoothRadius,
      size.width, containerRadius + 2 * smoothRadius,
    );

    // Line to bottom right corner with rounded corner
    path.lineTo(size.width, size.height - containerRadius);
    path.quadraticBezierTo(size.width, size.height, size.width - containerRadius, size.height);

    // Line to bottom left corner with rounded corner
    path.lineTo(containerRadius, size.height);
    path.quadraticBezierTo(0, size.height, 0, size.height - containerRadius);

    // Line to top left corner with rounded corner
    path.lineTo(0, containerRadius);
    path.quadraticBezierTo(0, 0, containerRadius, 0);

    // Line back to starting point
    path.close();

    // Draw the background path
    canvas.drawPath(path, paint);

    // Create a border paint with gradient
    final borderPaint = Paint()
      ..shader = linearGradient.createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderStrokeWidth;

    // Draw the border path
    canvas.drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}






//==========================================================ok============
// class CutContainerPainter extends CustomPainter {
//   final LinearGradient linearGradient;
//   final Color bgColor;

//   CutContainerPainter({required this.linearGradient, required this.bgColor});

//   // Introduce a customizable cutRadius for flexibility
//     final double cutRadius = 30.0; // Adjust this value to control the roundness
//     final double moveToPixel = 30.0;

//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = bgColor
//       ..style = PaintingStyle.fill;

//     final path = Path();
    
//     // Move to top left corner
//     path.moveTo(moveToPixel, 0);


//     // Line to top right corner with slight curve
//     path.lineTo(size.width - cutRadius, 0);

//     // Create a smooth curve for the top right corner
//     path.quadraticBezierTo(
//       size.width, cutRadius, // Control point (slightly below top edge)
//       size.width, cutRadius, // End point with rounded corner
//     );


//     // Line to bottom right corner
//     path.lineTo(size.width, size.height - moveToPixel);

//     // Line to bottom left corner with normal radius
//     path.quadraticBezierTo(
//       size.width, size.height, // Control point
//       size.width - moveToPixel, size.height, // End point
//     );

//     // Line to top left corner
//     path.lineTo(moveToPixel, size.height);

//     // Line to top left corner with slight curve
//     path.quadraticBezierTo(
//       0, size.height, // Control point
//       0, size.height - moveToPixel, // End point
//     );

//     // Line to top left corner with curve, adjusting for cut
//     path.lineTo(0, cutRadius); // Adjust starting point for rounding
//     path.quadraticBezierTo(
//       0, 0, // Control point
//       moveToPixel, 0, // End point with rounded corner
//     );

//     // Line back to starting point
//     path.close();

//     canvas.drawPath(path, paint);

//     final borderPaint = Paint()
//       ..shader = linearGradient.createShader(Rect.fromLTWH(0, 0, size.width, size.height))
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 3;

//     canvas.drawPath(path, borderPaint);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
// }
//=====================================================================end

