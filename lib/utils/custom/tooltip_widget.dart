// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:widgettest/controller/tootip_provider.dart';

// class TooltipWidget extends StatelessWidget {
//   const TooltipWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(16),
//       color: Colors.white,
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           const Text('Some instruction showing here'),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               TextButton(
//                 onPressed: () => Provider.of<TooltipProvider>(context, listen: false).skip(),
//                 child: const Text('Skip'),
//               ),
//               Row(
//                 children: [
//                   IconButton(
//                     icon: const Icon(Icons.arrow_back),
//                     onPressed: () => Provider.of<TooltipProvider>(context, listen: false).previous(),
//                   ),
//                   IconButton(
//                     icon: const Icon(Icons.arrow_forward),
//                     onPressed: () => Provider.of<TooltipProvider>(context, listen: false).next(),
//                   ),
//                 ],
//               ),
//               IconButton(
//                 icon: const Icon(Icons.close),
//                 onPressed: () => Provider.of<TooltipProvider>(context, listen: false).skip(),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }