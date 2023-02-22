import 'package:flutter/material.dart';

void showCustomSnackBar(BuildContext context, Widget content) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: content,
    ),
  );
}
