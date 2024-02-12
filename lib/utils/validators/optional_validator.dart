import 'package:reactive_forms/reactive_forms.dart';

/// Validator that validates the control's value only if entered.
class OptionalValidator<T> extends Validator<T> {
  const OptionalValidator({this.validator}) : super();

  final Map<String, bool>? Function(T value)? validator;

  @override
  Map<String, dynamic>? validate(AbstractControl<T> control) {
    final value = control.value;
    return value == null ? null : validator?.call(value);
  }
}
