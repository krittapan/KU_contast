import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';

class FireStoreDataBase {
  late final String bibid;
  String? downloadURL;
  FireStoreDataBase({required this.bibid});

  Future getData() async {
    try {
      await downloadURLExample(bibid);
      return downloadURL;
    } catch (e) {
      debugPrint("Error - $e");
      return null;
    }
  }

  Future<void> downloadURLExample(bibid) async {
    downloadURL = await FirebaseStorage.instance
        .refFromURL('gs://ku-contest.appspot.com')
        .child(bibid + ".jpg")
        .getDownloadURL();
    debugPrint(downloadURL.toString());
  }
}
