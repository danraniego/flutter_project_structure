import 'package:flutter/material.dart';
import 'package:mvc/core/components/buttons/danger_button.dart';
import 'package:mvc/core/components/buttons/normal_button,dart.dart';
import 'package:mvc/core/components/dialog/customdialog/custom_dialog.dart';

class ConfirmationDialog extends StatelessWidget {
  final String title;
  final String message;
  final String? confirmButtonText;
  final String? cancelButtonText;
  final CancelCallBack? onCancel;
  final ConfirmCallBack? onConfirm;

  const ConfirmationDialog({
    required this.title,
    required this.message,
    this.confirmButtonText,
    this.cancelButtonText,
    this.onCancel,
    this.onConfirm,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double containerWidth = size.width;

    return CustomDialog(
        title: title,
        cancelButton: NormalButton(
          text: cancelButtonText ?? 'Cancel',
          width: containerWidth > 400 ? 100 : (containerWidth / 2) - 65,
          height: 40,
          onPressed: onCancel ?? () {
            Navigator.pop(context, true);
          },
        ),
        confirmButton: DangerButton(
          text: confirmButtonText ?? 'Confirm',
          width: containerWidth > 400 ? 100 : (containerWidth / 2) - 65,
          height: 40,
          onPressed: onConfirm ?? () {
            Navigator.pop(context, true);
          },
        ),
        child: Center(
          child: Text(message),
        )
    );
  }
}

typedef CancelCallBack = void Function();
typedef ConfirmCallBack = void Function();