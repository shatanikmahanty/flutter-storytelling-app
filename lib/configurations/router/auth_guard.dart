import 'dart:async';

import '../../features/authentication/authentication.dart';
import '../configurations.dart';

bool get isAuthenticated => AuthCubit.instance.state.user != null;

class AuthGuard extends AutoRedirectGuard {
  late StreamSubscription<AuthState> _subscription;

  AuthGuard() {
    _subscription = AuthCubit.instance.stream.listen(
      (state) {
        //Listener to the auth state to redirect to the appropriate page
        if (state.user != null) {
          reevaluate(
            strategy: const ReevaluationStrategy.removeAllAndPush(
              HomeRoute(),
            ),
          );
        } else if (state.user == null) {
          reevaluate(
            strategy: const ReevaluationStrategy.removeAllAndPush(
              AuthRouter(),
            ),
          );
        }
      },
    );
  }

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    //Used by the auth guard to redirect to the auth page if the user is not authenticated
    if (await canNavigate(resolver.route)) {
      resolver.next();
    } else {
      redirect(const AuthRouter(), resolver: resolver);
    }
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  @override
  Future<bool> canNavigate(RouteMatch route) async => isAuthenticated;
}
