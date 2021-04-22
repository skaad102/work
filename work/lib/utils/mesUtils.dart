import 'package:flutter/material.dart';

void mesAlert(BuildContext context, String mes) {
  showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text('Informacion Incorrecta'),
          content: Text(mes),
          actions: [
            TextButton(
                onPressed: () => Navigator.of(context).pop(), child: Text('ok'))
          ],
        );
      });
}
