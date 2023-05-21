import 'package:flutter_bloc/flutter_bloc.dart';

import 'message_state.dart';

class MessageController extends Cubit<MessageState> {
  MessageController() : super(MessageInitial());
  Future<void> getMessage() async {
    emit(MessageLoading());
    emit(MessageSuccess('Hello World'));
  }
}
