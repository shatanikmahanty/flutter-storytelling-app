import 'package:flutter/material.dart';

import '../../../../configurations/configurations.dart';

class PinCodeAddressTab extends StatelessWidget {
  const PinCodeAddressTab(this.title, this.value, {super.key});

  final String title;

  final String value;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.labelMedium;
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(kPadding),
          border: Border.all(
            color: Theme.of(context).colorScheme.primary,
            width: 1,
          )),
      padding: const EdgeInsets.symmetric(
          horizontal: kPadding * 1.25, vertical: kPadding * 0.5),
      child: Text.rich(
          TextSpan(text: title, children: [
            TextSpan(
                text: value,
                style:
                    textStyle?.copyWith(fontWeight: FontWeight.w500, height: 2))
          ]),
          style: textStyle?.copyWith(fontWeight: FontWeight.w700, height: 2)),
    );
  }
}
