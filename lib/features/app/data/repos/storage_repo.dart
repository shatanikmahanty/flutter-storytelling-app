import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class StorageRepo {
  Future<String> uploadFile({required File file, required String path}) async {
    final reference = FirebaseStorage.instance.ref(path);
    final res = await reference.putFile(file);
    return res.ref.getDownloadURL();
  }

  static String getHealthWorkerStoragePath(String folder, String uid) => 'health_workers/$folder/$uid';
}
