import 'package:flutter/material.dart';

class CustomDialogBody extends StatelessWidget {

  final Widget child;

  const CustomDialogBody({
    required this.child,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(
            color: Color.fromARGB(255, 209, 213, 218)
        )),
      ),
      child: child
    );
  }
}
