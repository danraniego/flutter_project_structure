import 'package:flutter/material.dart';

class ProgressContainer extends StatelessWidget {

  final double? strokeWidth;
  final double? width;
  final double? height;

  const ProgressContainer({
    this.strokeWidth,
    this.width,
    this.height,
    Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: width ?? 100,
        height: height ?? 100,
        margin: const EdgeInsets.only(top: 50, bottom: 50),
        padding: const EdgeInsets.all(30),
        color: Colors.transparent,
        child: CircularProgressIndicator(strokeWidth: strokeWidth ?? 3),
      ),
    );
  }
}