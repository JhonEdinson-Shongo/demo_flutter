import 'package:flutter/material.dart';
import 'dart:math';

class CustomCreditCardWidget extends StatelessWidget {
  const CustomCreditCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var initRandom = Random();
    int r = initRandom.nextInt(255);
    int g = initRandom.nextInt(255);
    int b = initRandom.nextInt(255);
    var ramdomColorCard = Color.fromRGBO(r, g, b, 1);
    return Padding(
      padding: EdgeInsets.all(15),
      child: Container(
        padding: EdgeInsets.all(15),
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              ramdomColorCard.withOpacity(.4),
              ramdomColorCard,
            ],
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '\$123.231',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            Text(
              '4${g} **** **** 8${b}',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Text(
              'Nombre completo',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
