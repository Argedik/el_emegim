import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:el_emegim/models/customer_product.dart';
import 'package:el_emegim/models/el_isleri.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Firebase extends ChangeNotifier {
  String _collectionPath = "books";
  Database _database = Database();

  //Firebase yemekleri listeleme kodu
  Stream<List<Food>> getFoodList() {
    Stream<List<DocumentSnapshot>> streamListDocument = _database
        .getFoodListFromApi(_collectionPath)
        .map((querySnapshot) => querySnapshot.docs);

    Stream<List<Food>> streamListFood = streamListDocument.map(
            (listOfDocSnap) => listOfDocSnap
            .map((docSnap) =>
            Food.fromMap(docSnap.data() as Map<String, dynamic>))
            .toList());
    return streamListFood;
  }

  //Firebase den yemek silme kodu
  Future<void> deleteFood(Food food) async {
    await _database.deleteDocument(referencePath: _collectionPath, id: food.id);
  }

  List<UploadTask> _uploadTask = [];

  Future<UploadTask> uploadFile(PickedFile file) async {
    UploadTask? uploadTask;
    Reference ref =
    FirebaseStorage.instance.ref().child('/Foods').child('/Asure.jpg');
    final metadata = SettableMetadata(
        contentType: 'image/jpeg',
        customMetadata: {'picked-file-path': file.path});
    return Future.value(uploadTask);
  }
}

class Database {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Stream<QuerySnapshot> getFoodListFromApi(String referancePath) {
    return _firestore.collection(referancePath).snapshots();
  }

  Stream<List<CustomerProduct>> getAllProducts(){
    return _firestore.collection("Yemekler").doc("Tuzlu_yemekler").collection("tuzlu_yemekler").snapshots().map((snapshot) {
      return snapshot.docs.map((doc) =>CustomerProduct.fromSnapshot(doc)).toList();
    });
  }

  Future<void> deleteDocument({required String referencePath, required String id}) async {
    await _firestore.collection(referencePath).doc(id).delete();
  }
}


class FirebaseFile {
  final Reference ref;
  final String name;
  final String url;

  const FirebaseFile({
    required this.ref,
    required this.name,
    required this.url,
  });
}

class Storage{
  final firebase_storage.FirebaseStorage storage= firebase_storage.FirebaseStorage.instance;

  Future<void> uploadFile(String filePath, String fileName)async {
    File file=File(filePath);
    try{
      await storage.ref("El_emekleri/Dikis/$fileName").putFile(file);
    } on firebase_core.FirebaseException catch (e){
      print(e);
      print("error");
    }

  }
}

