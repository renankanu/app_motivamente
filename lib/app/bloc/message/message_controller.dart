import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:translator/translator.dart';

import '../../model/quotable_message.dart';
import '../../repositories/quote_repository.dart';
import 'message_state.dart';

class MessageController extends Cubit<MessageState> {
  MessageController(this.repository) : super(MessageInitial());

  final QuoteRepository repository;
  final translator = GoogleTranslator();

  Future<void> getMessage() async {
    emit(MessageLoading());
    await getRandomMessage();
  }

  Future<void> getRandomMessage() async {
    try {
      final response = await repository.fetchQuote();
      final (message, translated) = await _translateMessage(response.content);
      if (translated) {
        final quoteMessage = QuotableMessage(
          content: message,
          author: response.author,
        );
        emit(MessageSuccess(quoteMessage));
        return;
      }
      emit(MessageSuccess(response));
    } on DioError catch (_) {
      emit(MessageError('Erro ao buscar sua mensagem!'));
    }
  }

  Future<(String, bool)> _translateMessage(String? message) async {
    if (message == null) {
      return ('', false);
    }

    try {
      final translation = await translator.translate(message, to: 'pt');
      return (translation.text, true);
    } catch (e) {
      return (message, false);
    }
  }
}
