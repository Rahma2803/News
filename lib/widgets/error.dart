import 'package:flutter/material.dart';
import 'package:news/utitis/app_styles.dart';

class ErrorCustom extends StatelessWidget {
  final String message;
  final String buttonText;
  final Function onPressed;

  const ErrorCustom({
    super.key,
    required this.message,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          message,
          style: textTheme.labelMedium,
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: onPressed(),
          child: Text(
            buttonText,
            style: AppStyles.medium20Black,
          ),
        ),
      ],
    );
  }
}
