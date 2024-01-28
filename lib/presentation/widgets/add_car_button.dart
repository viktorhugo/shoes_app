import 'package:flutter/material.dart';

class AddCarButton extends StatelessWidget {

  final double amount;

  const AddCarButton({super.key, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.15),
          borderRadius: BorderRadius.circular(100)
        ),
        child: Row(
          children: [ 
            const SizedBox(width: 20,),
            Text('\$$amount', style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold ),)
          ],
        ),
      ),
    );
  }
}