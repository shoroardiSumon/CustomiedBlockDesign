// import 'dart:async';
// import 'dart:convert';

// import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class CandleGraph extends StatefulWidget {
//   const CandleGraph({super.key});

//   @override
//   _CandleGraphState createState() => _CandleGraphState();
// }

// class _CandleGraphState extends State<CandleGraph> {
//   List<FlSpot> _spots = [];
//   double _currentPrice = 0;
//   double _priceChange = 0;
//   String _selectedPeriod = '1 hour';
//   Timer? _timer;

//   @override
//   void initState() {
//     super.initState();
//     _fetchData();
//     _timer = Timer.periodic(const Duration(minutes: 60), (timer) {
//       _fetchData();
//     });
//   }

//   @override
//   void dispose() {
//     _timer?.cancel();
//     super.dispose();
//   }

//   Future<void> _fetchData() async {
//     final response = await http.get(Uri.parse(
//         'https://api.coingecko.com/api/v3/coins/bitcoin/market_chart?vs_currency=usd&days=1'));
//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);
//       final List<dynamic> prices = data['prices'];
//       setState(() {
//         _spots = prices
//             .asMap()
//             .entries
//             .map((entry) =>
//                 FlSpot(entry.key.toDouble(), entry.value[1].toDouble()))
//             .toList();
//         _currentPrice = _spots.last.y;
//         _priceChange = ((_currentPrice - _spots.first.y) / _spots.first.y) * 100;
//       });
//     } else {
//       throw Exception('Failed to load data');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(16.0),
//       decoration: BoxDecoration(
//         color: const Color(0xff2c2c2c),
//         borderRadius: BorderRadius.circular(16),
//         border: Border.all(color: const Color(0xff00ff00), width: 2),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text(
//             'Live Price',
//             style: TextStyle(color: Colors.white, fontSize: 16),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               RichText(
//                 text: TextSpan(
//                   children: [
//                     TextSpan(
//                       text: '${_currentPrice.toStringAsFixed(3)}k',
//                       style: const TextStyle(
//                           color: Colors.white,
//                           fontSize: 24,
//                           fontWeight: FontWeight.bold),
//                     ),
//                     TextSpan(
//                       text:
//                           '\n${_priceChange.toStringAsFixed(2)}% ${_priceChange < 0 ? '↓' : '↑'}',
//                       style: TextStyle(
//                           color: _priceChange < 0 ? Colors.red : Colors.green,
//                           fontSize: 16),
//                     ),
//                   ],
//                 ),
//               ),
//               DropdownButtonHideUnderline(
//                 child: DropdownButton2(
//                   value: _selectedPeriod,
//                   items: ['1 hour', '1 day', '1 week']
//                       .map((period) => DropdownMenuItem<String>(
//                             value: period,
//                             child: Text(
//                               period,
//                               style: const TextStyle(color: Colors.white),
//                             ),
//                           ))
//                       .toList(),
//                   onChanged: (value) {
//                     setState(() {
//                       _selectedPeriod = value as String;
//                       _fetchData();
//                     });
//                   },
//                   // dropdownDecoration: BoxDecoration(
//                   //   color: const Color(0xff2c2c2c),
//                   //   borderRadius: BorderRadius.circular(16),
//                   // ),
//                   // icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 16),
//           Expanded(
//             child: LineChart(
//               mainData(),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   LineChartData mainData() {
//     return LineChartData(
//       gridData: FlGridData(
//         show: true,
//         drawVerticalLine: true,
//         getDrawingHorizontalLine: (value) {
//           return const FlLine(
//             color: Color(0xff37434d),
//             strokeWidth: 1,
//           );
//         },
//         getDrawingVerticalLine: (value) {
//           return const FlLine(
//             color: Color(0xff37434d),
//             strokeWidth: 1,
//           );
//         },
//       ),
//       titlesData: FlTitlesData(
//         show: true,
//         rightTitles: const SideTitles(showTitles: false),
//         topTitles: const SideTitles(showTitles: false),
//         bottomTitles: SideTitles(
//           showTitles: true,
//           reservedSize: 22,
//           getTextStyles: (context, value) => const TextStyle(
//               color: Color(0xff68737d), fontWeight: FontWeight.bold, fontSize: 12),
//           getTitles: (value) {
//             int minutes = (value.toInt() * 60) % 1440;
//             int hours = (minutes ~/ 60) % 24;
//             int minute = minutes % 60;
//             return '${hours.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
//           },
//           margin: 8,
//         ),
//         leftTitles: SideTitles(
//           showTitles: true,
//           getTextStyles: (context, value) => const TextStyle(
//             color: Color(0xff67727d),
//             fontWeight: FontWeight.bold,
//             fontSize: 12,
//           ),
//           getTitles: (value) {
//             return value.toInt().toString();
//           },
//           reservedSize: 32,
//           margin: 12,
//         ),
//       ),
//       borderData: FlBorderData(
//         show: true,
//         border: Border.all(color: const Color(0xff37434d), width: 1),
//       ),
//       minX: 0,
//       maxX: _spots.length.toDouble(),
//       minY: _spots.isNotEmpty
//           ? _spots.map((spot) => spot.y).reduce((a, b) => a < b ? a : b)
//           : 0,
//       maxY: _spots.isNotEmpty
//           ? _spots.map((spot) => spot.y).reduce((a, b) => a > b ? a : b)
//           : 0,
//       lineBarsData: [
//         LineChartBarData(
//           spots: _spots,
//           isCurved: true,
//           colors: [
//             const Color(0xff23b6e6),
//             const Color(0xff02d39a),
//           ],
//           barWidth: 3,
//           isStrokeCapRound: true,
//           dotData: const FlDotData(
//             show: false,
//           ),
//           belowBarData: BarAreaData(
//             show: true,
//             colors: [
//               const Color(0x3323b6e6),
//               const Color(0x3323b6e6),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }