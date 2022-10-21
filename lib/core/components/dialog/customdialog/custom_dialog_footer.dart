import 'package:flutter/material.dart';

class CustomDialogFooter extends StatelessWidget {

  final Widget cancelButton;
  final Widget confirmButton;

  const CustomDialogFooter({
    required this.cancelButton,
    required this.confirmButton,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          cancelButton,
          const SizedBox(width: 10),
          confirmButton
        ],
      ),
    );
  }
}
