import 'package:callchimp_dart/callchimp_dart.dart';
import 'package:dial_my_fable/features/authentication/authentication.dart';
import 'package:dial_my_fable/features/authentication/data/repo/auth_repo.dart';
import 'package:djangoflow_app/djangoflow_app.dart';
import 'package:djangoflow_app_links/djangoflow_app_links.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'configurations/configurations.dart';
import 'features/app/presentation/builders/app_responsive_layout_builder.dart';

class NBSAppBuilder extends AppBuilder {
  NBSAppBuilder({
    super.key,
    super.onDispose,
    required AppRouter appRouter,
    required AppLinksRepository appLinksRepository,
    final String? initialDeepLink,
  }) : super(
          onInitState: (context) {},
          repositoryProviders: [
            RepositoryProvider<AppLinksRepository>.value(
              value: appLinksRepository,
            ),
            RepositoryProvider<AuthRepo>(
              create: (context) => AuthRepo(FirebaseAuth.instance),
            ),
            RepositoryProvider<CallChimpApi>(
              create: (context) => CallChimpApi()..setApiKey('x-api-key', dotenv.env[callChimpApiKeyEnv]!),
            ),
          ],
          providers: [
            BlocProvider<AppCubit>(
              create: (context) => AppCubit.instance,
            ),
            BlocProvider<AuthCubit>(
              create: (context) => AuthCubit.instance
                ..init(
                  context.read<AuthRepo>(),
                ),
              lazy: false,
            ),
            BlocProvider<AppLinksCubit>(
              create: (context) => AppLinksCubit(
                null,
                context.read<AppLinksRepository>(),
              ),
              lazy: false,
            ),
          ],
          builder: (context) => LoginListenerWrapper(
            initialUser: context.read<AuthCubit>().state.user,
            onLogin: (context, user) {
              ///For performing tasks after login
            },
            onLogout: (context) {
              ///For performing tasks after logout
            },
            child: AppCubitConsumer(
              listenWhen: (previous, current) => previous.environment != current.environment,
              listener: (context, state) async {},
              builder: (context, appState) => MaterialApp.router(
                debugShowCheckedModeBanner: false,
                scaffoldMessengerKey: DjangoflowAppSnackbar.scaffoldMessengerKey,
                title: appName,
                routeInformationParser: RouteParser(
                  appRouter.matcher,
                  includePrefixMatches: true,
                ),
                theme: AppTheme.light,
                darkTheme: AppTheme.dark,
                themeMode: appState.themeMode,
                locale: Locale(appState.locale, ''),
                supportedLocales: const [
                  Locale('en', ''),
                ],
                localizationsDelegates: const [
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                routerDelegate: appRouter.delegate(
                  deepLinkBuilder: (_) => initialDeepLink != null
                      ? DeepLink.path(initialDeepLink)
                      : const DeepLink(
                          [
                            HomeRoute(),
                          ],
                        ),
                  // List of global navigation obsersers here
                  // SentryNavigationObserver
                  // navigatorObservers: () => {RouteObserver()},
                ),
                builder: (context, child) => AppResponsiveLayoutBuilder(
                  child: SandboxBanner(
                    isSandbox: appState.environment == AppEnvironment.sandbox,
                    child: child != null
                        ? kIsWeb
                            ? child
                            : AppLinksCubitListener(
                                listenWhen: (previous, current) => current != null,
                                listener: (context, appLink) {
                                  final path = appLink?.path;
                                  if (path != null) {
                                    appRouter.navigateNamed(
                                      path,
                                      onFailure: (failure) {
                                        appRouter.navigate(
                                          const HomeRoute(),
                                        );
                                      },
                                    );
                                  }
                                },
                                child: child,
                              )
                        : const Offstage(),
                  ),
                ),
              ),
            ),
          ),
        );
}
