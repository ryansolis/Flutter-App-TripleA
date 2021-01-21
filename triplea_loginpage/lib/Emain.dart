import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:triplea_loginpage/analytics/mainScreen_Analytics.dart';
import 'package:triplea_loginpage/evacuation/mainScreen_EvacuationMap.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Triple A',
      theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)),
      routes: {
        EvacuationMapScreen.routeName: (_) => EvacuationMapScreen(),
        AnalyticsScreen.routeName: (_) => AnalyticsScreen(),
      },
      home: AnalyticsScreen(),
    );
  }
}
