// ******
// Esta Vista contiene el fomulario de ingreso
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:work/widgets/formWidget.dart';

class LogPage extends StatefulWidget {
  LogPage({Key key}) : super(key: key);
  static String nameRoute = 'log';

  @override
  _LogPageState createState() => _LogPageState();
}

class _LogPageState extends State<LogPage> {
  final cgColor = Color.fromRGBO(254, 211, 124, 1);

  @override
  Widget build(BuildContext context) {
    timeDilation = 3;
    return Scaffold(
      body: SafeArea(
        child: Container(
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
          child: Container(child: FormWidget()),
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
