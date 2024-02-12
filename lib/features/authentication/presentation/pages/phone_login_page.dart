import 'package:dial_my_fable/configurations/configurations.dart';
import 'package:dial_my_fable/features/app/presentation/widgets/primary_text_field.dart';
import 'package:dial_my_fable/features/authentication/authentication.dart';
import 'package:dial_my_fable/features/authentication/presentation/widgets/auth_button.dart';
import 'package:djangoflow_app/djangoflow_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:progress_builder/progress_builder.dart';
import 'package:reactive_forms/reactive_forms.dart';

@RoutePage()
class PhoneLoginPage extends StatelessWidget {
  const PhoneLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authCubit = context.read<AuthCubit>();
    final textTheme = Theme.of(context).textTheme;
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state.phoneNumber != null) {
          DjangoflowAppSnackbar.showInfo(
            'OTP sent to +91${state.phoneNumber}',
          );
          context.router.navigate(
            const PhoneVerifyRoute(),
          );
        }
      },
      listenWhen: (previous, current) => previous.phoneNumber != current.phoneNumber,
      child: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: kPadding * 2,
          vertical: kPadding * 3,
        ),
        shrinkWrap: true,
        children: [
          Text(
            'Authenticate',
            style: textTheme.headlineMedium,
          ),
          const SizedBox(
            height: kPadding * 4,
          ),
          ReactiveFormBuilder(
            form: authCubit.formBuilder,
            builder: (context, form, child) => AutofillGroup(
              child: Column(
                children: [
                  PrimaryTextField(
                    autoFocus: true,
                    inputFormatter: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    maxLength: 10,
                    onSubmitted: (_) {
                      form.markAllAsTouched();
                      if (form.valid) {
                        DefaultActionController.of(context)?.add(ActionType.start);
                      }
                    },
                    formControlName: 'phone',
                    label: 'Phone number',
                    keyboardType: TextInputType.phone,
                  ),
                  const SizedBox(
                    height: kPadding * 6,
                  ),
                  BlocBuilder<AuthCubit, AuthState>(
                    builder: (context, state) {
                      if (state.isOtpRequested) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return AuthButton(
                        text: 'Login',
                        onClick: (ReactiveForm.of(context)?.valid ?? false)
                            ? () async {
                                final phoneControl = form.control('phone');
                                await authCubit.loginWithPhone(phoneControl.value);
                              }
                            : null,
                      );
                    },
                  ),
                  const SizedBox(
                    height: kPadding * 6,
                  ),
                  Text(
                    'Made with ❤️ by Shatanik Mahanty',
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: AppColors.onSurface,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
