import 'package:dial_my_fable/configurations/configurations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 28,
            child: Assets.images.logoHor.image(
              fit: BoxFit.cover,
            ),
          ),
          Text(
            'Welcome to Dial My Fable',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: colorScheme.primaryContainer,
                  fontWeight: FontWeight.w600,
                ),
          ),
          Expanded(
            flex: 44,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  opacity: 0.1,
                  image: Assets.images.loginDoodle.provider(),
                  fit: BoxFit.cover,
                ),
              ),
              child: const AutoRouter(),
            ),
          ),
        ],
      ),
    );
  }
}
