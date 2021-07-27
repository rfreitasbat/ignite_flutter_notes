import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  var description;

  ButtonWidget(this.description);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 250,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context, description);
            },
            child: Text("Salvar"),
          ),
        ),
      ],
    );
  }
}
