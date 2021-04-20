import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key key}) : super(key: key);
  static String nameRoute = 'splash';
  static TextStyle font = GoogleFonts.getFont('Montserrat');

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final heroKey = UniqueKey();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final cgColor = Color.fromRGBO(254, 211, 124, 1);
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: cgColor,
          child: Stack(
            children: [
              _robot(context),
              Column(
                children: [
                  SizedBox(width: double.infinity, height: size.height * 0.05),
                  _titulo(context),
                  _info(context),
                  _btnLog(context),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget fontfuntion(
    BuildContext context,
    String txt,
    Color color,
    double tam,
  ) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Text(
        txt,
        style: GoogleFonts.montserrat(
          textStyle: Theme.of(context).textTheme.headline4,
          fontSize: tam,
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.normal,
          color: color,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _titulo(BuildContext context) {
    return fontfuntion(context, 'USERAPP', Colors.white, 30);
  }

  Widget _info(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: fontfuntion(
          context,
          'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat.',
          Colors.black,
          18),
    );
  }

  Widget _btnLog(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: SizedBox(
        width: 200,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0),
              ),
              primary: Colors.black,
            ),
            child: Text(
              'IR A LOGIN',
              style: TextStyle(fontSize: 20),
            ),
            onPressed:
                // snapshot.hasData ? () => _nexPage(context) : null,
                () =>
                    Navigator.pushNamed(context, 'log', arguments: {heroKey})),
      ),
    );
  }

  Widget _robot(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final alto = size.height;
    final ancho = size.width;

    return Positioned(
      child: Hero(
        tag: 'robotKey',
        child: Image(
          image: AssetImage('assets/robot.png'),
          // height: 1300,
        ),
      ),
      bottom: -alto * 0.59,
      right: -ancho * 0.5,
    );
  }
}
