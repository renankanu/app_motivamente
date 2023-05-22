sealed class MessageState {}

class MessageInitial extends MessageState {}

class MessageLoading extends MessageState {}

class MessageSuccess extends MessageState {
  MessageSuccess(this.appMessage);
  final String appMessage;
}

class MessageError extends MessageState {
  MessageError(this.appMessage);
  final String appMessage;
}
