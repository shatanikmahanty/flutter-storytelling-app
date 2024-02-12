// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:dial_my_fable/features/authentication/presentation/pages/auth_router_page.dart'
    deferred as _i1;
import 'package:dial_my_fable/features/authentication/presentation/pages/login_page.dart'
    deferred as _i3;
import 'package:dial_my_fable/features/authentication/presentation/pages/phone_login_page.dart'
    deferred as _i4;
import 'package:dial_my_fable/features/authentication/presentation/pages/phone_verify_page.dart'
    deferred as _i5;
import 'package:dial_my_fable/features/home/presentation/pages/home_page.dart'
    deferred as _i2;

abstract class $AppRouter extends _i6.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    AuthRouter.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.DeferredWidget(
          _i1.loadLibrary,
          () => _i1.AuthRouterPage(),
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.DeferredWidget(
          _i2.loadLibrary,
          () => _i2.HomePage(),
        ),
      );
    },
    LoginRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.DeferredWidget(
          _i3.loadLibrary,
          () => _i3.LoginPage(),
        ),
      );
    },
    PhoneLoginRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.DeferredWidget(
          _i4.loadLibrary,
          () => _i4.PhoneLoginPage(),
        ),
      );
    },
    PhoneVerifyRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.DeferredWidget(
          _i5.loadLibrary,
          () => _i5.PhoneVerifyPage(),
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.AuthRouterPage]
class AuthRouter extends _i6.PageRouteInfo<void> {
  const AuthRouter({List<_i6.PageRouteInfo>? children})
      : super(
          AuthRouter.name,
          initialChildren: children,
        );

  static const String name = 'AuthRouter';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i2.HomePage]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute({List<_i6.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i3.LoginPage]
class LoginRoute extends _i6.PageRouteInfo<void> {
  const LoginRoute({List<_i6.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i4.PhoneLoginPage]
class PhoneLoginRoute extends _i6.PageRouteInfo<void> {
  const PhoneLoginRoute({List<_i6.PageRouteInfo>? children})
      : super(
          PhoneLoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'PhoneLoginRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i5.PhoneVerifyPage]
class PhoneVerifyRoute extends _i6.PageRouteInfo<void> {
  const PhoneVerifyRoute({List<_i6.PageRouteInfo>? children})
      : super(
          PhoneVerifyRoute.name,
          initialChildren: children,
        );

  static const String name = 'PhoneVerifyRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}
