import 'package:cached_network_image/cached_network_image.dart';
import 'package:callchimp_dart/callchimp_dart.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dial_my_fable/configurations/configurations.dart';
import 'package:dial_my_fable/features/authentication/authentication.dart';
import 'package:dial_my_fable/features/home/repo/subscription_repo.dart';
import 'package:dial_my_fable/utils/interceptors/auth_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:djangoflow_app/djangoflow_app.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final categoriesCollection = FirebaseFirestore.instance.collection('categories');

    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;
    final onPrimary = colorScheme.onPrimary;
    final onBackground = colorScheme.onBackground;

    return RepositoryProvider(
      create: (context) => SubscriptionRepo(
        dio: Dio()
          ..interceptors.add(
            DMFAuthInterceptor(),
          )
          ..options.contentType = Headers.jsonContentType,
        callChimpApi: CallChimpApi()..setApiKey('x-api-key', dotenv.env[callChimpApiKeyEnv]!),
      ),
      child: Builder(builder: (context) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(kPadding * 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Hi, User 👋",
                        style: textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {
                          context.read<AuthCubit>().logout();
                        },
                        icon: Icon(
                          FontAwesomeIcons.arrowRightFromBracket,
                          color: colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: kPadding * 2,
                  ),
                  Text(
                    'Available Categories',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  Expanded(
                    child: StreamBuilder<QuerySnapshot>(
                      stream: categoriesCollection.snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Center(child: Text('Error: ${snapshot.error}'));
                        }

                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const Center(child: CircularProgressIndicator());
                        }

                        List<DocumentSnapshot> categories = snapshot.data!.docs;

                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: categories.length,
                          padding: const EdgeInsets.symmetric(vertical: kPadding * 2),
                          itemBuilder: (context, index) {
                            final category = categories[index];
                            final categoryId = category.id;
                            final categoryData = category.data() as Map<String, dynamic>;
                            final categoryName = categoryData['name'];
                            final callChimpListId = categoryData['callChimpListId'];
                            final uid = FirebaseAuth.instance.currentUser?.uid;
                            final subscribedUsers = (categoryData['subscribers'] ?? []) as List<dynamic>;
                            final isSubscribed = uid == null ? false : subscribedUsers.contains(uid);
                            return Container(
                              margin: const EdgeInsets.only(bottom: kPadding * 2),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(kPadding),
                                image: DecorationImage(
                                  image: CachedNetworkImageProvider(categoryData['image']),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: Container(
                                color: onPrimary.withOpacity(0.4),
                                padding: const EdgeInsets.all(kPadding * 2),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          categoryName,
                                          style: textTheme.headlineMedium?.copyWith(
                                            color: onBackground,
                                          ),
                                        ),
                                        const Spacer(),
                                        Switch(
                                          activeTrackColor: colorScheme.onSurface,
                                          value: isSubscribed,
                                          onChanged: (value) async {
                                            final subscriptionRepo = context.read<SubscriptionRepo>();
                                            if (value) {
                                              await subscriptionRepo.createSubscription(
                                                categoryId: categoryId,
                                                listId: callChimpListId,
                                              );
                                              DjangoflowAppSnackbar.showInfo(
                                                'Subscribed to $categoryName. You will receive a call at 21:00 everyday.',
                                              );
                                            } else {
                                              subscriptionRepo.deleteSubscription(categoryId: categoryId);
                                            }
                                          },
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: kPadding * 2,
                                    ),
                                    Text(
                                      categoryData['headline'],
                                      style: textTheme.bodyLarge?.copyWith(
                                        color: onBackground,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
