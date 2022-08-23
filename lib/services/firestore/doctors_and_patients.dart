import 'package:cloud_firestore/cloud_firestore.dart';

class Store {
  final FirebaseFirestore _fireStore;
  const Store(this._fireStore);

  CollectionReference get store => _fireStore.collection("doctor-plus");
}