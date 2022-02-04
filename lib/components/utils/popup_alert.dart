import 'package:flutter/material.dart';

class AlertDanger extends StatelessWidget {
  final String text;

  AlertDanger({@required this.text = "Erro!"});
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1, color: Colors.red)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon( Icons.error, color: Colors.red),
              SizedBox(width: 20),
              SizedBox(
                width: (MediaQuery.of(context).size.width) - 128,
                child: Text(
                  text,
                  style: TextStyle(color: Colors.red, fontSize: 18),
                ),
              )
            ]),
      ),
    );
  }
}
