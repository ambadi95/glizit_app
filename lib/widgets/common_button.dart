import 'package:flutter/material.dart';


// ignore: must_be_immutable
class CommonButton extends StatelessWidget {
  final String label;
  Function()? onTap;
   CommonButton({super.key, this.label = "CLick Here", this.onTap});


  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: onTap,
      child: Container(
        width: 200,
        decoration:  BoxDecoration(
          color: Colors.greenAccent,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(child:
          Text(label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20
            ),
          )),
        ),
      ),
    );
  }
}
