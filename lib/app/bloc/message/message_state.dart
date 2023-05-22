import '../../model/quotable_message.dart';

sealed class MessageState {}

class MessageInitial extends MessageState {}

class MessageLoading extends MessageState {}

class MessageSuccess extends MessageState {
  MessageSuccess(this.message);
  final QuotableMessage message;
}

class MessageError extends MessageState {
  MessageError(this.errorMessage);
  final String errorMessage;
}
