import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/app_message.dart';
import '../../shared/utils/user_logged.dart';
import 'message_state.dart';

class MessageController extends Cubit<MessageState> {
  MessageController() : super(MessageInitial());

  UserLogged user = UserLogged();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference collection =
      FirebaseFirestore.instance.collection('motivational');

  Future<void> getMessage() async {
    emit(MessageLoading());
    if (user.isLoggedIn) {
      await getRandomMessage();
    }
  }

  Future<void> getRandomMessage() async {
    final querySnapshot = await collection.get();
    final documents = querySnapshot.docs;
    final randomIndex = Random().nextInt(documents.length);
    final randomDocument = documents[randomIndex];
    final data = randomDocument.data();
    if (data != null) {
      final map = data as Map<String, dynamic>;
      final appMessage = AppMessage.fromJson(map);
      emit(MessageSuccess(appMessage));
    }
  }
}
