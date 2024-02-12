import 'dart:convert';

import 'package:callchimp_dart/callchimp_dart.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dial_my_fable/configurations/configurations.dart';
import 'package:dial_my_fable/features/app/data/models/cron_job.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class SubscriptionRepo {
  final Dio dio;
  final CallChimpApi callChimpApi;

  SubscriptionRepo({required this.dio, required this.callChimpApi});

  /// Responsible for creating a subscription for a category
  /// If the cron job creation fails, the subscription is not created in firestore
  /// [categoryId] is the id of the category
  Future<void> createSubscription({required String categoryId, required int listId}) async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) {
      throw Exception('User not logged in');
    }

    final vendorLeadCode = userId + categoryId;
    final callChimpSubscriptionResponse = await createSubscriberInCallChimp(vendorLeadCode, listId);

    if (callChimpSubscriptionResponse.statusCode == 200) {
      final createCronJobResponse = await createCronJob(
        categoryId: categoryId,
        cronJob: CronJob(
          url: callChimpCallsUrl,
          requestMethod: 1,
          saveResponses: true,
          schedule: {
            'timezone': 'Asia/Kolkata',
            'minutes': [00],
            'hours': [21],
            'mdays': [-1],
            'months': [-1],
            'wdays': [-1],
            'expiresAt': 0,
          },
          extendedData: {
            'headers': {
              'x-api-key': dotenv.env[callChimpApiKeyEnv],
              'Content-Type': 'application/json',
            },
            'body': json.encode({'vendor_lead_code': vendorLeadCode}),
          },
        ),
      );

      if (createCronJobResponse.statusCode == 200) {
        await _updateSubscriptionDB(
          categoryId,
          true,
          cronJobId: createCronJobResponse.data['jobId'],
          callChimpSubscriberId: callChimpSubscriptionResponse.data?['id'],
        );
      }
    }
  }

  Future<void> deleteSubscription({required String categoryId}) async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) {
      throw Exception('User not logged in');
    }

    await _updateSubscriptionDB(categoryId, false);
  }

  Future<Response<Map<String, dynamic>?>> createSubscriberInCallChimp(String vendorLeadCode, int leadListID) async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    final phone = FirebaseAuth.instance.currentUser?.phoneNumber;
    if (userId == null && phone == null) {
      throw Exception('User not logged in');
    }
    final dioCopy = dio;
    dioCopy.options.extra['isCallChimp'] = true;

    final response = await dioCopy.post<Map<String, dynamic>>(
      callChimpSubscribersUrl,
      data: {
        'first_name': 'User',
        'last_name': '$userId',
        'leadlist': leadListID,
        'vendor_lead_code': vendorLeadCode,
        'phone_code': "91",
        'phone_number': phone?.replaceAll("+91", ""),
      },
    );
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Failed to create subscriber');
    }
  }

  /// Create a cron job to call the user at the specified time
  Future<Response> createCronJob({
    required String categoryId,
    required CronJob cronJob,
  }) async {
    final dioCopy = dio;
    dioCopy.options.extra['isCronJob'] = true;
    try {
      final response = await dioCopy.put(
        createCronJobUrl,
        data: {'job': cronJob.toJson()},
      );
      return response;
    } on DioException catch (e) {
      throw Exception('Failed to create cron job ${e.message}');
    }
  }

  ///Delete the cron job to call the user
  Future<Response> deleteCronJob(int jobId) async {
    final dioCopy = dio;
    dioCopy.options.extra['isCronJob'] = true;
    try {
      final response = await dioCopy.delete(
        '$createCronJobUrl/$jobId',
      );
      return response;
    } on DioException catch (e) {
      throw Exception('Failed to delete cron job ${e.message}');
    }
  }

  /// Update the subscription status of a category in firestore
  /// [categoryId] is the id of the category
  /// [value] is the new subscription status
  Future<void> _updateSubscriptionDB(
    String categoryId,
    bool value, {
    int? cronJobId,
    int? callChimpSubscriberId,
  }) async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    final firestore = FirebaseFirestore.instance;
    final categoriesCollection = firestore.collection('categories');
    final cronJobsCollection = firestore.collection('cronJobs');
    if (uid == null) {
      throw Exception('User not logged in');
    }
    if (value) {
      // Add the user to the subscribers list
      await categoriesCollection.doc(categoryId).update({
        'subscribers': FieldValue.arrayUnion([uid]),
      });
      // Create the document for the cron job
      await cronJobsCollection.doc('$uid$categoryId').set(
        {
          'categoryId': categoryId,
          'userId': uid,
          'enabled': value,
          'cronJobId': cronJobId,
          'callChimpSubscriberId': callChimpSubscriberId,
        },
      );
    } else {
      // Remove the user from the subscribers list
      await categoriesCollection.doc(categoryId).update({
        'subscribers': FieldValue.arrayRemove([uid]),
      });
      final cronJobDoc = await cronJobsCollection.doc('$uid$categoryId').get();
      final data = cronJobDoc.data();
      if (data != null) {
        final callChimpSubscriberId = data['callChimpSubscriberId'];
        final cronJobId = data['cronJobId'];
        // Delete the call chimp subscriber
        if (callChimpSubscriberId != null) {
          await dio.delete(
            '$callChimpSubscribersUrl/$callChimpSubscriberId',
            options: Options(
              extra: {
                'isCallChimp': true,
              },
            ),
          );
        }
        // Delete the cron job
        if (cronJobId != null) {
          await dio.delete(
            '$createCronJobUrl/$cronJobId',
            options: Options(
              extra: {
                'isCronJob': true,
              },
            ),
          );
        }
      }
      // Delete the cron job document
      await cronJobsCollection.doc('$uid$categoryId').delete();
    }
  }
}
