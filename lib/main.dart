import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:widgettest/controller/block_provider.dart';
import 'package:widgettest/controller/tooltip_provider_two.dart';
import 'package:widgettest/controller/tootip_provider.dart';
import 'package:widgettest/pages/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => BlockProvider()),
    ChangeNotifierProvider(create: (context) => TooltipProvider()),
    ChangeNotifierProvider(create: (context) => TooltipProviderTwo()),
  ], child:  const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      //home: const HomePage(),
      home: ShowCaseWidget(
        builder: (context) => const HomePage(),
      ),
    );
  }
}

