import 'package:flutter/material.dart';

class CardNext extends StatelessWidget {
  final String text;
  final String targetRoute;

  CardNext(this.text, this.targetRoute);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, targetRoute);
      },
      child: Card(
        color: Colors.teal,
        child: Padding(
          padding: EdgeInsets.all(0),
          child: Card(
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Text(
                      text,
                      style: TextStyle(color: Colors.teal, fontSize: 18),
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    size: 30,
                    color: Colors.teal,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
