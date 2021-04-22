import 'package:flutter/material.dart';
import 'package:work/block/providerBlock.dart';
import 'package:work/models/prefUser.dart';
import 'package:work/src/pages/homePage.dart';
import 'package:work/src/pages/logPage.dart';
import 'package:work/src/pages/regPage.dart';
import 'package:work/src/pages/splashPage.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() async {
  final prefs = new PreferenciasUsuario();
  WidgetsFlutterBinding.ensureInitialized();
  await prefs.initPrefs();
  await initHiveForFlutter();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        initialRoute: LogPage.nameRoute,
        routes: {
          HomePage.nameRoute: (_) => HomePage(),
          SplashPage.nameRoute: (_) => SplashPage(),
          LogPage.nameRoute: (_) => LogPage(),
          RegPage.nameRoute: (_) => RegPage(),
        },
        theme: ThemeData(
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              // backgroundColor: Color.fromRGBO(254, 221, 124, 1),
              unselectedItemColor: Colors.black,
            ),
            selectedRowColor: Color.fromRGBO(254, 221, 124, 1)),
      ),
    );
  }
}
