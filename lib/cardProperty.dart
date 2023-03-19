import 'package:flutter/material.dart';
class CardProperty extends StatelessWidget {
  CardProperty({required this.sex, required this.text});
  final IconData sex;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(sex, size: 80,color: Colors.white),
        SizedBox(height: 15),
        Text(text,style: TextStyle(color: Color(0xFF8D8E98,), fontSize: 18),)
      ],
    );
  }
}