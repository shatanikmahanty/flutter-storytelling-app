import 'package:dial_my_fable/configurations/configurations.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

/// Custom interceptor to add the authorization header to the request
/// Currently handles auth for
/// 1. Cron Jobs
/// 2. Call Chimp
/// 3. User Auth
class DMFAuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final user = FirebaseAuth.instance.currentUser;
    final isCronJob = options.extra['isCronJob'];
    final isAuthTokenRequired = options.extra['isAuthorized'];
    final isCallChimp = options.extra['isCallChimp'];
    if (isCronJob ?? false) {
      options.headers['Authorization'] = 'Bearer ${dotenv.env[cronApiKeyEnv]}';
    }
    if (isCallChimp ?? false) {
      options.headers['x-api-key'] = dotenv.env[callChimpApiKeyEnv]!;
    }
    if ((isAuthTokenRequired ?? false) && user != null) {
      options.headers['Authorization'] = 'Bearer ${user.uid}';
    }
    return handler.next(options);
  }
}
