import 'package:flutter/material.dart';
import 'package:mvc/core/components/dialog/customdialog/custom_dialog_body.dart';
import 'package:mvc/core/components/dialog/customdialog/custom_dialog_footer.dart';
import 'package:mvc/core/components/dialog/customdialog/custom_dialog_header.dart';

import '../../buttons/normal_button,dart.dart';

class CustomDialog extends StatelessWidget {

  final String title;
  final Widget child;
  final Widget? cancelButton;
  final Widget? confirmButton;

  const CustomDialog({
    required this.title,
    required this.child,
    this.cancelButton,
    this.confirmButton,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomDialogHeader(title: title),
          CustomDialogBody(child: child),
          CustomDialogFooter(
              cancelButton: cancelButton ?? NormalButton(
                text: 'Cancel',
                width: 100,
                height: 40,
                onPressed: () {
                  Navigator.pop(context, true);
                },
              ),
              confirmButton: NormalButton(
                text: 'Confirm',
                width: 100,
                height: 40,
                onPressed: () {
                  Navigator.pop(context, true);
                },
              )
          )
        ],
      ),
    );
  }
}
