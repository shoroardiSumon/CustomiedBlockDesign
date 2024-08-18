// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:widgettest/controller/block_provider.dart';
// import 'package:widgettest/utils/custom/block_painter.dart';

// class CustomizedBlock extends StatefulWidget {
//   const CustomizedBlock({super.key});

//   @override
//   State<CustomizedBlock> createState() => _CustomizedBlockState();
// }

// class _CustomizedBlockState extends State<CustomizedBlock> {
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

//   @override
//   void initState() {
//     super.initState();
//     // Initialize blocks in the provider
//     final blockProvider = Provider.of<BlockProvider>(context, listen: false);
//     blockProvider.setBlocks([
//       {
//         "menuId": 2,
//         "menuName": "Finance",
//         "subMenuName": "Bitcoin Live Price",
//         "subMenuId": 1,
//         "blockType": "GENERAL"
//       },
//       {
//         "menuId": 2,
//         "menuName": "Finance",
//         "subMenuName": "Price Change",
//         "subMenuId": 2,
//         "blockType": "GENERAL"
//       },
//       {
//         "menuId": 2,
//         "menuName": "Finance",
//         "subMenuName": "Market Cap",
//         "subMenuId": 3,
//         "blockType": "GENERAL"
//       },
//       {
//         "menuId": 3,
//         "menuName": "Network Pulse",
//         "subMenuName": "Search Volumes (Research Driven)",
//         "subMenuId": 7,
//         "blockType": "GENERAL"
//       },
//       {
//         "menuId": 4,
//         "menuName": "Miner’s Haven",
//         "subMenuName": "Halving Countdown",
//         "subMenuId": 8,
//         "blockType": "GENERAL"
//       },
//     ]);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldKey,
//       //drawer: const AppDrawer(),
//       body: AppBackground(
//         child: SingleChildScrollView(
//           child: Consumer2<AppThemeProvider, BlockProvider>(
//               builder: (context, appThemeProvider, blockProvider, _) {
//             return Padding(
//               padding: const EdgeInsets.symmetric(
//                   horizontal: horizontalPadding, vertical: veriticalPadding),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const SizedBox(
//                     height: 50,
//                   ),
//                   Container(
//                       height: 44,
//                       width: double.infinity,
//                       alignment: Alignment.centerLeft,
//                       padding: const EdgeInsets.all(0),
//                       child: Row(
//                         children: [
//                           InkWell(
//                             onTap: () {
//                               _scaffoldKey.currentState?.openDrawer();
//                             },
//                             child: Container(
//                               height: double.infinity,
//                               width: 44,
//                               alignment: Alignment.center,
//                               child: Image.asset(appThemeProvider.isDarkMode
//                                   ? appDrawerIconDark
//                                   : appDrawerIconLight),
//                             ),
//                           ),
//                           Expanded(
//                               child: Container(
//                             height: double.infinity,
//                             alignment: Alignment.center,
//                             child: Text(
//                               AppLocalizations.of(context)!.app_title,
//                               style: TextStyle(
//                                   color: appThemeProvider.textColor,
//                                   fontSize: 20,
//                                   fontFamily: 'PetitFormalScript',
//                                   fontWeight: FontWeight.w400),
//                             ),
//                           )),
//                           InkWell(
//                             onTap: () {
//                               // Navigator.of(context).push(
//                               //   MaterialPageRoute(
//                               //     builder: (context) =>
//                               //         const NotificationScreen(),
//                               //   ),
//                               // );
//                             },
//                             child: Container(
//                               height: double.infinity,
//                               width: 44,
//                               alignment: Alignment.center,
//                               child: Image.asset(appThemeProvider.isDarkMode
//                                   ? appNotificationIconDark
//                                   : appNotificationIconLight),
//                             ),
//                           ),
//                         ],
//                       )),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   if (blockProvider.expandedBlockIndex != null) ...[
//                     InkWell(
//                       onTap: () {
//                         blockProvider.swapToTop(blockProvider.expandedBlockIndex!);
//                       },
//                       child: CustomPaint(
//                         painter: BlockPainter(
//                           isEmptyAndLightModeBlock: false,
//                           borderStrokeWidth: 2,
//                           bgColor: appThemeProvider.blockBackgroundColor,
//                           linearGradient: LinearGradient(
//                             colors: [
//                               appThemeProvider.blockBorderColorTop,
//                               appThemeProvider.blockBorderColorBottom,
//                               appThemeProvider.blockBorderColorBottom
//                             ],
//                             begin: Alignment.topCenter,
//                             end: Alignment.bottomCenter,
//                           ),
//                         ),
//                         child: Container(
//                           padding: const EdgeInsets.all(20),
//                           height: 180,
//                           width: double.infinity,
//                           child: Text(
//                             blockProvider.blocks[blockProvider.expandedBlockIndex!]['subMenuName'],
//                             style: TextStyle(
//                                 color: appThemeProvider.textColor,
//                                 fontSize: 24,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                   ],
//                   GridView.builder(
//                     shrinkWrap: true,
//                     padding: const EdgeInsets.all(0),
//                     physics: const NeverScrollableScrollPhysics(),
//                     gridDelegate:
//                         const SliverGridDelegateWithFixedCrossAxisCount(
//                             crossAxisCount: 2,
//                             crossAxisSpacing: 20,
//                             mainAxisSpacing: 20,
//                             childAspectRatio: 1.1),
//                     itemCount: blockProvider.blocks.length,
//                     itemBuilder: (BuildContext context, int index) {
//                       bool isLeftContainer = index % 2 == 0;

//                       if (blockProvider.expandedBlockIndex == index) {
//                         return const SizedBox.shrink();
//                       }

//                       return InkWell(
//                         onTap: () {
//                           blockProvider.swapToTop(index);
//                         },
//                         child: CustomPaint(
//                           painter: BlockPainter(
//                             isEmptyAndLightModeBlock: false,
//                             borderStrokeWidth: 2,
//                             bgColor: appThemeProvider.blockBackgroundColor,
//                             linearGradient: LinearGradient(
//                               colors: isLeftContainer
//                                   ? [
//                                       appThemeProvider.blockBorderColorTop,
//                                       appThemeProvider.blockBorderColorBottom,
//                                       appThemeProvider.blockBorderColorBottom
//                                     ]
//                                   : [
//                                       appThemeProvider
//                                           .blockGridRightBorderColorTop,
//                                       appThemeProvider
//                                           .blockGridRightBorderColorBottom,
//                                       appThemeProvider
//                                           .blockGridRightBorderColorBottom
//                                     ],
//                               begin: Alignment.topCenter,
//                               end: Alignment.bottomCenter,
//                             ),
//                           ),
//                           child: Container(
//                             padding: const EdgeInsets.all(20),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   blockProvider.blocks[index]['menuName'],
//                                   style: TextStyle(
//                                       color: appThemeProvider.textColor,
//                                       fontSize: 14),
//                                 ),
//                                 const SizedBox(
//                                   height: 2,
//                                 ),
//                                 Text(
//                                   blockProvider.blocks[index]['subMenuName'],
//                                   style: TextStyle(
//                                       color: appThemeProvider.textColor,
//                                       fontSize: 24,
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                   // SizedBox(
//                   //   height: bottomNavBarHeight + 20,
//                   // ),
//                 ],
//               ),
//             );
//           }),
//         ),
//       ),
//     );
//   }
// }