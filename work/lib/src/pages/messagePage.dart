// ******
// Home()-> message()
// Vista donde el usuario verá los mensajes
// ******
import 'package:flutter/material.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text('Mensajes'),
      ),
    );
  }
}
