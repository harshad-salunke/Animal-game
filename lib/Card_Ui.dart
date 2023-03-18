import 'package:flutter/material.dart';
class Card_Ui extends StatelessWidget {
  Card_Ui({required this.iconsContents,required this.card_color});
final Widget iconsContents;
final Color card_color;

  @override
  Widget build(BuildContext context) {
    return Container(
      child:iconsContents,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          color: Color(0xFFCECECE),
          borderRadius: BorderRadius.circular(10.0)),
    );
  }
}
