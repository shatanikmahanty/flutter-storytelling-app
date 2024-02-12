import 'dart:async';
import 'dart:developer';

import 'package:dial_my_fable/firebase_options.dart';
import 'package:dial_my_fable/utils/extensions/app_dio_exception.dart';
import 'package:dial_my_fable/utils/extensions/extensions.dart';
import 'package:dio/dio.dart';
import 'package:djangoflow_app/djangoflow_app.dart';
import 'package:djangoflow_app_links/djangoflow_app_links.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'configurations/configurations.dart';
import 'dmf_app_builder.dart';

Future<void> main() async {
  DjangoflowAppRunner.run(
    onException: (exception, stackTrace) {
      if (exception is FirebaseAuthException) {
        DjangoflowAppSnackbar.showError(exception.userFriendlyMessage);
      } else if (exception is DioException) {
        DjangoflowAppSnackbar.showError(exception.userFriendlyMessage);
      } else {
        log(exception.toString(), stackTrace: stackTrace);
      }
    },
    rootWidgetBuilder: (appBuilder) async {
      String? initialDeepLink;
      final appLinksRepository = AppLinksRepository();

      AppCubit.initialState = const AppState(
        themeMode: ThemeMode.light,
      );
      await dotenv.load(fileName: envFileName);
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      //Set play integrity check
      if (kDebugMode) {
        await FirebaseAppCheck.instance.activate(
          androidProvider: AndroidProvider.debug,
          appleProvider: AppleProvider.debug,
        );
      }
      if (!kIsWeb) {
        initialDeepLink = (await appLinksRepository.getInitialLink())?.path;
      }

      final router = AppRouter();

      return appBuilder(
        NBSAppBuilder(
          appRouter: router,
          initialDeepLink: initialDeepLink,
          appLinksRepository: appLinksRepository,
        ),
      );
    },
  );
}
