import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key key}) : super(key: key);
  static String nameRoute = 'splash';
  static TextStyle font = GoogleFonts.getFont('Montserrat');

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    obternerPos();
  }

  bool acces = false;

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
                  _btnLog(context, acces),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // cambiar estilo del texto
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

  // texto de la pagina
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

  Widget _btnLog(BuildContext context, bool acces) {
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
              acces ? () => Navigator.pushNamed(context, 'log') : null,
        ),
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

  Future<Position> obternerPos() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Los servicios de ubicación no están habilitados, no continúen
      // acceder al puesto y solicitar usuarios del
      // Aplicación para habilitar los servicios de ubicación.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Los permisos están denegados, la próxima vez que lo intentes
        // solicitando permisos nuevamente (aquí también es donde
        // Android shouldShowRequestPermissionRationale
        // devolvió verdadero. Según las pautas de Android
        // su aplicación debería mostrar una interfaz de usuario explicativa ahora.
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Los permisos se niegan para siempre, maneje apropiadamente.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // Cuando llegamos aquí, se otorgan permisos y podemos
    // seguir accediendo a la posición del dispositivo.
    setState(() {
      acces = true;
    });
    return await Geolocator.getCurrentPosition();
  }
}
