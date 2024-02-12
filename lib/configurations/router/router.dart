import 'package:dial_my_fable/configurations/router/auth_guard.dart';
import 'package:flutter/material.dart';

import '../../features/authentication/presentation/pages/auth_routes.dart';
import '../configurations.dart';

export 'package:auto_route/auto_route.dart';

export 'route_parser.dart';
export 'router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Page,Route',
  deferredLoading: true,
)
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  final List<AutoRoute> routes = [
    RedirectRoute(path: '/', redirectTo: '/home'),
    AutoRoute(
      path: '/home',
      page: HomeRoute.page,
      guards: [AuthGuard()],
    ),
    AutoRoute(
      path: '/auth',
      page: AuthRouter.page,
      children: authRoutes,
    ),
  ];
}

Route<T> modalSheetBuilder<T>(BuildContext context, Widget child, AutoRoutePage<T> page) => ModalBottomSheetRoute(
      settings: page,
      isScrollControlled: true,
      constraints: BoxConstraints(
        maxHeight: (MediaQuery.of(context).size.height / 10) * 7,
      ),
      builder: (context) => child,
    );

Route<T> dialogRouteBuilder<T>(BuildContext context, Widget child, AutoRoutePage<T> page) => DialogRoute(
      settings: page,
      barrierDismissible: true,
      builder: (context) => child,
      context: context,
      useSafeArea: true,
      barrierColor: AppColors.surfaceVariantDark.withOpacity(.1),
    );
