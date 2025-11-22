import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseHelper {
  // ADD TASK
  Future addtask(Map<String, dynamic> taskinfomap, String id) async {
    return await FirebaseFirestore.instance
        .collection("Task")
        .doc(id)
        .set(taskinfomap);
  }

  // GET ALL TASK
  Stream<QuerySnapshot> getalltask() {
    return FirebaseFirestore.instance.collection("Task").snapshots();
  }

  // UPDATE TASK
  Future updatetask(Map<String, dynamic> updatetask, String id) async {
    await FirebaseFirestore.instance
        .collection("Task")
        .doc(id)
        .update(updatetask);
  }

  // DELETE TASK
  Future deletetask(String id) async {
    await FirebaseFirestore.instance.collection("Task").doc(id).delete();
  }
}
