import 'package:dial_my_fable/configurations/configurations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reactive_forms/reactive_forms.dart';

class PrimaryTextField<T> extends StatelessWidget {
  const PrimaryTextField({
    super.key,
    required this.formControlName,
    this.label,
    this.placeholder,
    this.prefixIcon,
    this.hint,
    this.onSubmitted,
    this.maxLength,
    this.keyboardType,
    this.minLines = 1,
    this.maxLines = 1,
    this.inputFormatter,
    this.autoFocus = false,
    this.padding = const EdgeInsets.all(
      kPadding / 2,
    ),
    this.validationMessages,
    this.focusNode,
    this.autofillHints,
  });

  final String formControlName;
  final String? label;
  final int? maxLength;
  final IconData? prefixIcon;
  final TextInputType? keyboardType;
  final String? hint;
  final int minLines;
  final int maxLines;
  final List<TextInputFormatter>? inputFormatter;
  final bool autoFocus;
  final EdgeInsets padding;
  final Function(FormControl)? onSubmitted;
  final String? placeholder;
  final Map<String, String Function(Object)>? validationMessages;
  final FocusNode? focusNode;
  final List<String>? autofillHints;

  @override
  Widget build(BuildContext context) => Padding(
        padding: padding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (label != null) Text(label!, style: Theme.of(context).textTheme.titleSmall),
            if (label != null)
              const SizedBox(
                height: kPadding,
              ),
            ReactiveTextField<T>(
              formControlName: formControlName,
              autofocus: autoFocus,
              onSubmitted: onSubmitted,
              inputFormatters: inputFormatter,
              autofillHints: autofillHints,
              maxLength: maxLength,
              keyboardType: keyboardType,
              maxLines: minLines > 1 ? (maxLines == 1 ? 3 : maxLines) : 1,
              minLines: minLines,
              validationMessages: {
                ...validationMessages ?? {},
              },
              textAlignVertical: TextAlignVertical.top,
              decoration: InputDecoration(
                hintText: placeholder,
                prefixIcon: prefixIcon == null
                    ? null
                    : Container(
                        margin: const EdgeInsets.symmetric(vertical: kPadding * 1.25).copyWith(
                          right: kPadding / 2,
                        ),
                        decoration: BoxDecoration(
                          border: Border(
                            right: BorderSide(
                              width: 1,
                              color: Theme.of(context).dividerColor,
                            ),
                          ),
                        ),
                        child: Align(
                          alignment: Alignment.topCenter,
                          widthFactor: 1.0,
                          heightFactor: minLines > 1 ? minLines.toDouble() : null,
                          child: Icon(
                            prefixIcon,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
              ),
            )
          ],
        ),
      );
}
