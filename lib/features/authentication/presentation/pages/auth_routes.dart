import 'package:dial_my_fable/configurations/configurations.dart';
import 'package:dial_my_fable/utils/custom_tranisitions_route.dart';

final authRoutes = [
  AutoRoute(
    initial: true,
    path: 'login',
    page: LoginRoute.page,
    children: [
      AutoRoute(
        path: 'phone',
        page: PhoneLoginRoute.page,
        initial: true,
      ),
      slideTransitionCustomRoute(
        path: 'phone_verify',
        page: PhoneVerifyRoute.page,
      ),
    ],
  ),
];
