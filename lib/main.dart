import 'package:flutter/material.dart';
import 'package:flutter_animation/screens/flight_booking_page/flight_booking_page.dart';
import 'package:flutter_animation/screens/flight_booking_page/s5.dart';
import 'package:flutter_animation/screens/login/login_screen.dart';
import 'package:flutter_animation/theme.dart';
import 'Aplication/theme_service.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeService(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(builder: (context, themeService, child) {
      return MaterialApp(
        themeMode: themeService.isDarkModeOn ? ThemeMode.dark : ThemeMode.light,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home:  StretchableSliverAppBar(),
      );
    });
  }
}
