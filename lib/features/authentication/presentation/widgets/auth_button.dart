import 'package:dial_my_fable/configurations/configurations.dart';
import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({super.key, required this.text, required this.onClick});

  final String text;
  final VoidCallback? onClick;

  @override
  Widget build(BuildContext context) => TextButton(
        onPressed: onClick,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(kPadding * 2),
          alignment: Alignment.center,
          child: Text(
            text,
          ),
        ),
      );
}
