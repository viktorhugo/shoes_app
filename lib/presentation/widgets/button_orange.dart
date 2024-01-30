import 'package:flutter/material.dart';

class ButtonOrange extends StatelessWidget {
  
  final String text;
  final double? heightButton;
  final double? widthButton;
  final Color? colorButton;

  const ButtonOrange({
    super.key, 
    required this.text, 
    this.heightButton = 50, 
    this.widthButton = 150, 
    this.colorButton =Colors.orange
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: heightButton,
      width: widthButton,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: colorButton
      ),
      child: Text(text ,style: const TextStyle(color: Colors.white),),
    );
  }
}