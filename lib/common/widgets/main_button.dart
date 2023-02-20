import 'package:fit_app/common/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  const MainButton({super.key, required this.txt, required this.onPressed});
  final String txt;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: const EdgeInsets.all(0),
      onPressed: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: kPrimaryColor,
          boxShadow: [
            BoxShadow(
              color: defaultTextColor100.withOpacity(0.05),
              blurRadius: 15,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        height: 54,
        width: double.infinity,
        child: Center(
          child: Text(
            txt,
            style: Theme.of(context).textTheme.button,
          ),
        ),
      ),
    );
  }
}
