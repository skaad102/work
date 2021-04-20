import 'package:flutter/material.dart';
import 'package:work/block/providerBlock.dart';
import 'package:work/src/pages/homePage.dart';

class FormWidget extends StatefulWidget {
  FormWidget({Key key}) : super(key: key);

  @override
  _FormWidgetState createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: _inpusForm(),
    );
  }

  List<Widget> _inpusForm() {
    final blockProvider = Provider.of(context);
    print(blockProvider);

    final cgColor = Color.fromRGBO(254, 211, 124, 1);
    final size = MediaQuery.of(context).size;

    return [
      SizedBox(height: size.height * 0.04),
      // ******
      // input correo
      // ******
      StreamBuilder<Object>(
          stream: blockProvider.recEmail,
          builder: (context, snapshot) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.person_outline,
                    color: cgColor,
                  ),
                  labelText: 'Username',
                  errorText: snapshot.error,
                ),
                onChanged: blockProvider.inserEmail,
              ),
            );
          }),

      // ******
      // input password
      // ******
      StreamBuilder<Object>(
          stream: blockProvider.recPass,
          builder: (context, snapshot) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                    icon: Icon(
                      Icons.lock_outline_rounded,
                      color: cgColor,
                    ),
                    labelText: 'Password',
                    errorText: snapshot.error),
                onChanged: blockProvider.inserPass,
              ),
            );
          }),

      // ******
      // input submit
      // ******
      StreamBuilder<Object>(
          stream: blockProvider.formValid,
          builder: (context, snapshot) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: SizedBox(
                width: 200,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                    primary: cgColor,
                  ),
                  child: Text(
                    'SIGN IN',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: snapshot.hasData ? () => _nexPage(context) : null,
                ),
              ),
            );
          }),
      SizedBox(height: size.height * 0.04),
    ];
  }

  _nexPage(BuildContext context) {
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (_) => HomePage()), (route) => false);
  }
}
