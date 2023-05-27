import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repositories/quote_repository.dart';
import 'message_state.dart';

class MessageController extends Cubit<MessageState> {
  MessageController(this.repository) : super(MessageInitial());

  final QuoteRepository repository;

  Future<void> getMessage() async {
    emit(MessageLoading());
    await getRandomMessage();
  }

  Future<void> getRandomMessage() async {
    final id = Random().nextInt(await getCount());
    try {
      final response = await repository.fetchQuote(id);
      emit(MessageSuccess(response));
    } on DioError catch (_) {
      emit(MessageError('Erro ao buscar sua mensagem!'));
    }
  }

  Future<int> getCount() async {
    try {
      final response = await repository.getCount();
      return response;
    } on DioError catch (_) {
      return 1;
    }
  }
}
