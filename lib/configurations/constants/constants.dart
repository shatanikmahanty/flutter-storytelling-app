// Global APP - specific constants
// import 'package:dial_my_fable/configurations/constants/fonts.gen.dart';
///Generate by running ```fluttergen``` in the terminal
export 'assets.gen.dart'; //Uncomment if assets are needed
export 'fonts.gen.dart';

///App related constants
const appName = 'Dial My Fable';
// const kFontFamily = FontFamily.montserrat;

///File Names
const envFileName = 'env';

///API related constants
const cronJobApiUrl = 'https://api.cron-job.org';
const createCronJobUrl = '$cronJobApiUrl/jobs';
const callChimpApiUrl = 'https://api.callchimp.ai/v1';
const callChimpCallsUrl = '$callChimpApiUrl/calls';
const callChimpSubscribersUrl = '$callChimpApiUrl/subscribers';

///Environment related constants
const cronApiKeyEnv = 'CRON_JOB_ORG_API_KEY';
const callChimpApiKeyEnv = 'CALL_CHIMP_API_KEY';
