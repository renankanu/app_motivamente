import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'message_state.dart';

class MessageController extends Cubit<MessageState> {
  MessageController() : super(MessageInitial());

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference collection =
      FirebaseFirestore.instance.collection('motivational');

  Future<void> getMessage() async {
    emit(MessageLoading());
    await getRandomMessage();
    emit(MessageSuccess('Hello World'));
  }

  Future<void> getRandomMessage() async {
    QuerySnapshot querySnapshot = await collection.get();
    List<DocumentSnapshot> documents = querySnapshot.docs;
    int randomIndex = Random().nextInt(documents.length);
    DocumentSnapshot randomDocument = documents[randomIndex];
    print(randomDocument.data());
  }
}
