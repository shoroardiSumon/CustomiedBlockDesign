import 'package:flutter/material.dart';

class MultiRadialGradientPainter extends CustomPainter {
  final Color gradientColor;
  final Color bgColor;
  final Color fadeColor;

  MultiRadialGradientPainter({
    required this.gradientColor,
    required this.bgColor,
    this.fadeColor = const Color(0xFF1E0A3C),
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Fill the background with the specified color
    final backgroundPaint = Paint()..color = bgColor;
    canvas.drawRect(Offset.zero & size, backgroundPaint);

    final paint = Paint();

    // Define fixed positions and radii for the gradients
    final List<Offset> centers = [
      Offset(size.width * 0.25, size.height * 0.5),
      Offset(size.width * 0.45, size.height * 0.5),

      Offset(size.width * 0.5, size.height * 0.25),

      Offset(size.width * 0.75, size.height * 0.75),
    ];
    final List<double> radii = [
      size.width * 0.25,
      size.width * 0.25,

      size.width * 0.25,

      size.width * 0.25,
    ];

    for (int i = 0; i < centers.length; i++) {
      // Create radial gradient with an additional color stop for indigo fade
      final gradient = RadialGradient(
        colors: [gradientColor, fadeColor.withOpacity(0.0), fadeColor],
        stops: const [0.0, 0.25, 1.0], // Smooth transition to transparent and then to indigo
        radius: 1.0,
        center: Alignment(
          (2 * centers[i].dx / size.width) - 1,
          (2 * centers[i].dy / size.height) - 1,
        ),
      );

      final rect = Offset.zero & size;

      paint.shader = gradient.createShader(rect);
      canvas.drawCircle(centers[i], radii[i], paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}



//==Fixed positioned radials-- working well===
// class MultiRadialGradientPainter extends CustomPainter {
//   final Color gradientColor;
//   final Color bgColor;

//   MultiRadialGradientPainter({required this.gradientColor, required this.bgColor});

//   @override
//   void paint(Canvas canvas, Size size) {
//     // Fill the background with the specified color
//     final backgroundPaint = Paint()..color = bgColor;
//     canvas.drawRect(Offset.zero & size, backgroundPaint);

//     final paint = Paint();

//     // Define fixed positions and radii for the gradients
//     final List<Offset> centers = [
//       Offset(size.width * 0.25, size.height * 0.5),
//       Offset(size.width * 0.5, size.height * 0.25),
//       Offset(size.width * 0.75, size.height * 0.75),
//     ];
//     final List<double> radii = [
//       size.width * 0.2,
//       size.width * 0.2,
//       size.width * 0.2,
//     ];

//     for (int i = 0; i < centers.length; i++) {
//       // Create radial gradient
//       final gradient = RadialGradient(
//         colors: [gradientColor, Colors.transparent],
//         stops: const [0.0, 1.0], // Smooth transition to transparent
//         radius: 1.0,
//         center: Alignment(
//           (2 * centers[i].dx / size.width) - 1,
//           (2 * centers[i].dy / size.height) - 1,
//         ),
//       );

//       final rect = Offset.zero & size;

//       paint.shader = gradient.createShader(rect);
//       canvas.drawCircle(centers[i], radii[i], paint);
//     }
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return false;
//   }
// }

//==============well======================================

// class MultiRadialGradientPainter extends CustomPainter {
//   final Color gradientColor;
//   final Color bgColor;

//   MultiRadialGradientPainter({required this.gradientColor, required this.bgColor});

//   @override
//   void paint(Canvas canvas, Size size) {
//     // Fill the background with the specified color
//     final backgroundPaint = Paint()..color = bgColor;
//     canvas.drawRect(Offset.zero & size, backgroundPaint);

//     final paint = Paint();
//     final Random random = Random();

//     // Define a fixed number of gradients for better control
//     const int numberOfGradients = 3;

//     List<Offset> centers = [];
//     List<double> radii = [];

//     for (int i = 0; i < numberOfGradients; i++) {
//       double centerX;
//       double centerY;
//       double radius;

//       bool overlap;

//       // Generate non-overlapping centers and radii
//       do {
//         overlap = false;
//         centerX = random.nextDouble() * size.width;
//         centerY = (random.nextDouble() * (size.height * 0.5)) + (size.height * 0.25); // Random value between 25% and 75% of screen height
//         radius = (random.nextDouble() * (size.width / 3)) + 50; // Ensure minimum size for visibility

//         for (int j = 0; j < centers.length; j++) {
//           double dx = centerX - centers[j].dx;
//           double dy = centerY - centers[j].dy;
//           double distance = sqrt(dx * dx + dy * dy);

//           if (distance < radius + radii[j]) {
//             overlap = true;
//             break;
//           }
//         }
//       } while (overlap);

//       centers.add(Offset(centerX, centerY));
//       radii.add(radius);

//       // Create radial gradient
//       final gradient = RadialGradient(
//         colors: [gradientColor, Colors.transparent],
//         stops: const [0.0, 1.0], // Smooth transition to transparent
//         radius: 1.0,
//         center: Alignment(
//           (2 * centerX / size.width) - 1,
//           (2 * centerY / size.height) - 1,
//         ),
//       );

//       final rect = Offset.zero & size;

//       paint.shader = gradient.createShader(rect);
//       canvas.drawCircle(Offset(centerX, centerY), radius, paint);
//     }
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return false;
//   }
// }



// class MultiRadialGradientPainter extends CustomPainter {
//   final Color gradientColor;
//   final Color bgColor;

//   MultiRadialGradientPainter({required this.gradientColor, required this.bgColor});

//   @override
//   void paint(Canvas canvas, Size size) {
//     // Fill the background with the specified color
//     final backgroundPaint = Paint()..color = bgColor;
//     canvas.drawRect(Offset.zero & size, backgroundPaint);

//     final paint = Paint();
//     final Random random = Random();

//     // Define a fixed number of gradients for better control
//     const int numberOfGradients = 3;

//     List<Offset> centers = [];
//     List<double> radii = [];

//     for (int i = 0; i < numberOfGradients; i++) {
//       double centerX;
//       double centerY;
//       double radius;

//       bool overlap;

//       // Generate non-overlapping centers and radii
//       do {
//         overlap = false;
//         centerX = random.nextDouble() * size.width;
//         centerY = (random.nextDouble() * (size.height * 0.3)) + (size.height * 0.30); // Random value between 35% and 65% of screen height
//         radius = (random.nextDouble() * (size.width / 3)) + 50; // Ensure minimum size for visibility

//         for (int j = 0; j < centers.length; j++) {
//           double dx = centerX - centers[j].dx;
//           double dy = centerY - centers[j].dy;
//           double distance = sqrt(dx * dx + dy * dy);

//           if (distance < radius + radii[j]) {
//             overlap = true;
//             break;
//           }
//         }
//       } while (overlap);

//       centers.add(Offset(centerX, centerY));
//       radii.add(radius);

//       // Create radial gradient
//       final gradient = RadialGradient(
//         colors: [gradientColor, Colors.transparent],
//         stops: const [0.0, 1.0], // Smooth transition to transparent
//         radius: 1.0,
//         center: Alignment(
//           (2 * centerX / size.width) - 1,
//           (2 * centerY / size.height) - 1,
//         ),
//       );

//       final rect = Offset.zero & size;

//       paint.shader = gradient.createShader(rect);
//       canvas.drawCircle(Offset(centerX, centerY), radius, paint);
//     }
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return false;
//   }
// }



// class MultiRadialGradientPainter extends CustomPainter {
//   final Color gradientColor;
//   final Color bgColor;

//   MultiRadialGradientPainter({required this.gradientColor, required this.bgColor});

//   @override
//   void paint(Canvas canvas, Size size) {
//     // Fill the background with the specified color
//     final backgroundPaint = Paint()..color = bgColor;
//     canvas.drawRect(Offset.zero & size, backgroundPaint);

//     final paint = Paint();
//     final Random random = Random();

//     // Define a fixed number of gradients for better control
//     final int numberOfGradients = 3;

//     for (int i = 0; i < numberOfGradients; i++) {
//       // Generate random values for centerX and centerY within the specified range
//       final double centerX = random.nextDouble() * size.width;
//       final double centerY = (random.nextDouble() * (size.height * 0.3)) + (size.height * 0.35); // Random value between 35% and 65% of screen height
//       final double radius = (random.nextDouble() * (size.width / 3)) + 50; // Ensure minimum size for visibility

//       // Create radial gradient
//       final gradient = RadialGradient(
//         colors: [gradientColor, Colors.transparent],
//         stops: [0.0, 1.0], // Smooth transition to transparent
//         radius: 1.0,
//         center: Alignment(
//           (2 * centerX / size.width) - 1,
//           (2 * centerY / size.height) - 1,
//         ),
//       );

//       final rect = Offset.zero & size;

//       paint.shader = gradient.createShader(rect);
//       canvas.drawCircle(Offset(centerX, centerY), radius, paint);
//     }
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return false;
//   }
// }

// class MultiRadialGradientPainter extends CustomPainter {
//   final Color gradientColor;
//   final Color bgColor;

//   MultiRadialGradientPainter({required this.gradientColor, required this.bgColor});

//   @override
//   void paint(Canvas canvas, Size size) {
//     // Fill the background with the specified color
//     final backgroundPaint = Paint()..color = bgColor;
//     canvas.drawRect(Offset.zero & size, backgroundPaint);

//     final paint = Paint();
//     final Random random = Random();

//     // Define a fixed number of gradients for better control
//     final int numberOfGradients = 3;

//     for (int i = 0; i < numberOfGradients; i++) {
//       // Generate random values for centerX and centerY within the specified range
//       final double centerX = random.nextDouble() * size.width;
//       final double centerY = (random.nextDouble() * (size.height * 0.6)) + (size.height * 0.2); // Random value between 20% and 80% of screen height
//       final double radius = (random.nextDouble() * (size.width / 3)) + 50; // Ensure minimum size for visibility

//       // Create radial gradient
//       final gradient = RadialGradient(
//         colors: [gradientColor, Colors.transparent],
//         stops: const [0.0, 1.0], // Smooth transition to transparent
//         radius: 1.0,
//         center: Alignment(
//           (2 * centerX / size.width) - 1,
//           (2 * centerY / size.height) - 1,
//         ),
//       );

//       final rect = Offset.zero & size;

//       paint.shader = gradient.createShader(rect);
//       canvas.drawCircle(Offset(centerX, centerY), radius, paint);
//     }
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return false;
//   }
// }



// class MultiRadialGradientPainter extends CustomPainter {
//   final Color gradientColor;
//   final Color bgColor;

//   MultiRadialGradientPainter({required this.gradientColor, required this.bgColor});

//   @override
//   void paint(Canvas canvas, Size size) {
//     // Fill the background with indigo color
//     final backgroundPaint = Paint()..color = bgColor;
//     canvas.drawRect(Offset.zero & size, backgroundPaint);

//     final paint = Paint();
//     final Random random = Random();

//     // Define a fixed number of gradients for better control
//     final int numberOfGradients = 5;

//     for (int i = 0; i < numberOfGradients; i++) {
//       final double centerX = random.nextDouble() * size.width;
//       final double centerY = random.nextDouble() * size.height;
//       final double radius = (random.nextDouble() * (size.width / 3)) + 50; // Ensure minimum size for visibility

//       final gradient = RadialGradient(
//         colors: [gradientColor, Colors.transparent],
//         stops: [0.0, 1.0], // Smooth transition to transparent
//         radius: 1.0,
//         center: Alignment(
//           (2 * centerX / size.width) - 1,
//           (2 * centerY / size.height) - 1,
//         ),
//       );

//       final rect = Offset.zero & size;

//       paint.shader = gradient.createShader(rect);
//       canvas.drawCircle(Offset(centerX, centerY), radius, paint);
//     }
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return false;
//   }
// }



// class MultiRadialGradientPainter extends CustomPainter {
//   final List<Color> colors = [
//     Colors.yellow.withOpacity(0.5),
//     Colors.red.withOpacity(0.5),
//     Colors.green.withOpacity(0.5),
//     Colors.orange.withOpacity(0.5),
//     Colors.purple.withOpacity(0.5),
//   ];

//   @override
//   void paint(Canvas canvas, Size size) {
//     // Fill the background with indigo color
//     final backgroundPaint = Paint()..color = Colors.indigo;
//     canvas.drawRect(Offset.zero & size, backgroundPaint);

//     final paint = Paint();
//     final Random random = Random();

//     for (int i = 0; i < colors.length; i++) {
//       final double centerX = random.nextDouble() * size.width;
//       final double centerY = random.nextDouble() * size.height;
//       final double radius = (random.nextDouble() * (size.width / 3)) + 50; // Ensure minimum size for visibility

//       final gradient = RadialGradient(
//         colors: [colors[i], Colors.transparent],
//         stops: [0.0, 1.0], // Smooth transition to transparent
//         radius: 1.0,
//         center: Alignment(
//           (2 * centerX / size.width) - 1,
//           (2 * centerY / size.height) - 1,
//         ),
//       );

//       final rect = Offset.zero & size;

//       paint.shader = gradient.createShader(rect);
//       canvas.drawCircle(Offset(centerX, centerY), radius, paint);
//     }
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return false;
//   }
// }




// class MultiRadialGradientPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint();

//     // Define a fixed list of gradient centers and radii
//     final List<Offset> centers = [
//       Offset(size.width * 0.3, size.height * 0.3),
//       Offset(size.width * 0.7, size.height * 0.5),
//       Offset(size.width * 0.5, size.height * 0.8),
//     ];

//     final double radius = size.width / 3;

//     final List<Color> colors = [
//       Colors.yellow.withOpacity(0.5),
//       Colors.red.withOpacity(0.5),
//       Colors.green.withOpacity(0.5),
//     ];

//     for (int i = 0; i < centers.length; i++) {
//       final gradient = RadialGradient(
//         colors: [colors[i], Colors.transparent],
//         stops: [0.0, 0.67], // Gradient stops at 2/3rd position
//         radius: 1.0,
//         center: Alignment(
//           (2 * centers[i].dx / size.width) - 1,
//           (2 * centers[i].dy / size.height) - 1,
//         ),
//       );

//       final rect = Offset.zero & size;

//       paint.shader = gradient.createShader(rect);
//       canvas.drawCircle(centers[i], radius, paint);
//     }
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return false;
//   }
// }










// class MultiRadialGradientPainter extends CustomPainter {
//   final List<Color> colors = [
//     Colors.yellow.withOpacity(0.5),
//     Colors.red.withOpacity(0.5),
//     Colors.green.withOpacity(0.5),
//     Colors.orange.withOpacity(0.5),
//     Colors.purple.withOpacity(0.5),
//   ];

//   @override
//   void paint(Canvas canvas, Size size) {
//     // Fill the background with indigo color
//     final backgroundPaint = Paint()..color = Colors.indigo;
//     canvas.drawRect(Offset.zero & size, backgroundPaint);

//     final paint = Paint();
//     final Random random = Random();

//     for (int i = 0; i < colors.length; i++) {
//       final double centerX = random.nextDouble() * size.width;
//       final double centerY = random.nextDouble() * size.height;
//       final double radius = (random.nextDouble() * (size.width / 3)) + 50; // Ensure minimum size for visibility

//       final gradient = RadialGradient(
//         colors: [colors[i], Colors.transparent],
//         stops: [0.0, 0.67], // Gradient stops at 2/3rd position
//         radius: 1.0,
//         center: Alignment(
//           (2 * centerX / size.width) - 1,
//           (2 * centerY / size.height) - 1,
//         ),
//       );

//       final rect = Offset.zero & size;

//       paint.shader = gradient.createShader(rect);
//       canvas.drawCircle(Offset(centerX, centerY), radius, paint);
//     }
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return false;
//   }
// }









// class MultiRadialGradientPainter extends CustomPainter {
//   final Random random = Random();

//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint();

//     for (int i = 0; i < 5; i++) {  // Change the number here for more/less gradients
//       final double centerX = random.nextDouble() * size.width;
//       final double centerY = random.nextDouble() * size.height;
//       final double radius = random.nextDouble() * (size.width / 3);

//       final gradient = RadialGradient(
//         colors: [
//           Color.fromARGB(
//             255,
//             random.nextInt(256),
//             random.nextInt(256),
//             random.nextInt(256),
//           ),
//           Colors.transparent
//         ],
//         radius: 1.0,
//         center: Alignment(
//           (2 * centerX / size.width) - 1,
//           (2 * centerY / size.height) - 1,
//         ),
//       );

//       final rect = Offset.zero & size;

//       paint.shader = gradient.createShader(rect);
//       canvas.drawCircle(Offset(centerX, centerY), radius, paint);
//     }
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return false;
//   }
// }