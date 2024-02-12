import 'package:flutter/material.dart';

import '../../../../configurations/configurations.dart';

class FilePickerButtonContainer extends StatelessWidget {
  const FilePickerButtonContainer(
      {super.key, required this.text, this.cancel = false, required this.onPressed, required this.label});

  final String text;
  final bool cancel;
  final String label;


  final void Function() onPressed;


  @override
  Widget build(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        label,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w500),
      ),
      const SizedBox(width: kPadding * 1.25),
      GestureDetector(
        onTap: onPressed,
        child: Container(
              padding: const EdgeInsets.symmetric(
                  vertical: kPadding, horizontal: kPadding * 1.25),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(kPadding * 0.5),
                  border: Border.all(color: Theme.of(context).primaryColor)),
              child: Row(
                children: [
                  Text(
                    text,
                    overflow: TextOverflow.clip,
                    softWrap: true,
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.2,
                        color: Theme.of(context).primaryColor),
                  ),
                  const SizedBox(width: kPadding * 0.5),
                  Icon(
                      cancel
                          ? Icons.cancel_outlined
                          : Icons.keyboard_arrow_down_rounded,
                      color: Theme.of(context).primaryColor,
                      size: 18,
                      fill: 1),
                ],
              ),
            ),
      ),
    ],
  );
}
