import 'package:flutter/material.dart';

import '../../../../configurations/theme/size_constants.dart';

class FormActionButton extends StatelessWidget {
  const FormActionButton({super.key, this.text = 'Next', this.icon = Icons.arrow_forward, this.onPressed});

  final String text;
  final IconData? icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) => TextButton(
        onPressed: onPressed,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(kPadding * 2),
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontSize: 15, height: 1.06, wordSpacing: 0.2, color: Theme.of(context).colorScheme.onPrimary),
              ),
              if (icon != null) ...[
                const SizedBox(width: kPadding),
                Icon(
                  icon,
                  color: Theme.of(context).colorScheme.onPrimary,
                )
              ]
            ],
          ),
        ),
      );
}
