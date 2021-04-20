import 'package:flutter/material.dart';
import 'package:work/block/providerBlock.dart';
import 'package:work/src/pages/homePage.dart';
import 'package:work/src/pages/logPage.dart';
import 'package:work/src/pages/splashPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        initialRoute: SplashPage.nameRoute,
        routes: {
          HomePage.nameRoute: (_) => HomePage(),
          SplashPage.nameRoute: (_) => SplashPage(),
          LogPage.nameRoute: (_) => LogPage(),
        },
        // theme: ThemeData(
        //   textTheme: GoogleFonts.latoTextTheme(montserrat).copyWith(
        //     bodyText2: GoogleFonts.oswald(textStyle: textTheme.body1),
        //   ),
        // ),
      ),
    );
  }
}
