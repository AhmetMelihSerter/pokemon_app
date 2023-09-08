import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class CustomFlushbar {
  CustomFlushbar({
    this.title,
    required this.message,
    this.isFlushBarTop = false,
  });

  final bool isFlushBarTop;
  final String? title;
  final String message;

  void show(BuildContext context) {
    Flushbar<void>(
      title: title,
      message: message,
      duration: const Duration(seconds: 3),
      borderRadius: isFlushBarTop ? BorderRadius.circular(10) : null,
      flushbarPosition:
          isFlushBarTop ? FlushbarPosition.TOP : FlushbarPosition.BOTTOM,
    ).show(context);
  }
}
