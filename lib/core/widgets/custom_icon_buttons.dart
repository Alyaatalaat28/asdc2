import 'package:chatapp/constant.dart';
import 'package:flutter/material.dart';

class CustomIconButtons extends StatelessWidget {
  const CustomIconButtons(
      {super.key, required this.text,
      required this.mainColor,
      required this.textColor,
      this.onpress});
      
  final String text;
  final Color mainColor;
  final Color textColor;
  final VoidCallback? onpress;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 264,
      decoration: BoxDecoration(
        color: mainColor,
        border: Border.all(color: kprimaryColor, width: 1.6),
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 12,
            offset: const Offset(2, 1), // changes the position of the shadow
          ),
        ],
      ),
      child: Material(
        borderRadius: BorderRadius.circular(25),
        color: Colors.transparent,
        child: InkWell(
          onTap: onpress,
          splashColor: const Color.fromARGB(57, 255, 255, 255),
          borderRadius: BorderRadius.circular(25),
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
