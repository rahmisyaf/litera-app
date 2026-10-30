import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:litera/screens/topic_selection_screen.dart';
void main() async {
  // Preserve splash screen on boot
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // Keep splash for 2 seconds then remove
  await Future.delayed(const Duration(seconds: 2));
  FlutterNativeSplash.remove();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override 
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Removes the red debug banner on top right
      title: "Litera",
      theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFF9F9F9)),
            fontFamily: 'Urbanist',
            useMaterial3: true,
            appBarTheme: const AppBarTheme(
              titleTextStyle: TextStyle(
                fontFamily: 'Urbanist',
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Color(0xFF0F172A),
              ),
              centerTitle: true,
            ),
      ),

      home: const TopicSelection(),
    );
  }
}
