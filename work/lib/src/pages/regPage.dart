import 'package:flutter/material.dart';
import 'package:work/widgets/formRegWidget.dart';

class RegPage extends StatefulWidget {
  RegPage({Key key}) : super(key: key);
  static String nameRoute = 'registro';

  @override
  _RegPageState createState() => _RegPageState();
}

class _RegPageState extends State<RegPage> {
  final cgColor = Color.fromRGBO(254, 211, 124, 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          // width: double.infinity,
          height: double.infinity,
          color: cgColor,
          child: SingleChildScrollView(
            child: Stack(
              children: [_caja(), _robot(context)],
            ),
          ),
        ),
      ),
    );
  }

  Widget _caja() {
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: size.height * 0.5),

          padding: EdgeInsets.symmetric(vertical: 30),
          // width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(70)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 3,
                offset: Offset(0, 5),
                spreadRadius: 3,
              )
            ],
          ),
          // padding: EdgeInsets.only(top: 50),

          child: Container(child: FormRegWidget()),
        ),
      ],
    );
  }

  Widget _robot(
    BuildContext context,
  ) {
    return Positioned(
      child: Hero(
        tag: 'robotKey',
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 60),
            child: Image(
              image: AssetImage('assets/robot.png'),
              height: 300,
            ),
          ),
        ),
      ),
    );
  }
}
