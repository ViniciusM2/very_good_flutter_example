// Import the firebase_core and cloud_firestore plugin
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:oop_class_flutter_template/two_numbers/models/two_numbers_model.dart';

class TwoNumbersRepository {
  Future<DocumentReference<Map<String, dynamic>>> save(
      TwoNumbersModel model) async {
    return FirebaseFirestore.instance.collection('two_numbers').add(
          model.toMap(),
        );
  }

  Future<List<TwoNumbersModel>> loadAll() async {
    final querySnapshot =
        await FirebaseFirestore.instance.collection('two_numbers').get();
    return querySnapshot.docs
        .map((doc) => TwoNumbersModel.fromMap(doc.data()))
        .toList();
  }
}
