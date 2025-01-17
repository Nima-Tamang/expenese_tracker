import 'package:expenses_tracker/screens/home/views/home_screen.dart';
import 'package:flutter/material.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    title: "Expenses Tracker",
    theme:ThemeData(
      colorScheme: ColorScheme.light(
        surface: Colors.grey.shade100,
        onSurface: Colors.black,
        // primary:Color(0xFF00B2E7),
        // secondary: Color(0xFFE064F7),
        // tertiary: Color(0xFFFF8D6C),
        primary: const Color(0xFF755690),  // Adjusted opacity (fully opaque)
          secondary: const Color(0xFFCDD5BF),
          tertiary: const Color(0xFFCBCBD7),
        outline: Colors.grey,
      )
    ),
    home:HomeScreen(),
    );
  }
}