import 'package:flutter/material.dart';

class CardFAQ extends StatelessWidget {
  final String text;
  final String targetRoute;

  CardFAQ(this.text, this.targetRoute);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, targetRoute);
      },
      child: Card(
        color: Colors.blue,
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Text(
                  text,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
              Icon(
                Icons.arrow_forward,
                size: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
