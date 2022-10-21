import 'package:flutter/material.dart';

class DangerButton extends StatelessWidget {

  final String text;
  final double? width;
  final double? height;
  final PressedCallBack? onPressed;

  const DangerButton({
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
          backgroundColor: Colors.red,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(color: Colors.white10),
        ),
      ),
    );
  }
}

typedef PressedCallBack = void Function();