import 'package:flutter/material.dart';

class NormalButton extends StatelessWidget {

  final String text;
  final double? width;
  final double? height;
  final PressedCallBack? onPressed;

  const NormalButton({
    required this.text,
    this.width,
    this.height,
    this.onPressed,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}

typedef PressedCallBack = void Function();