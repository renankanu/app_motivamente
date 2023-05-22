import '../../model/app_message.dart';

sealed class MessageState {}

class MessageInitial extends MessageState {}

class MessageLoading extends MessageState {}

class MessageSuccess extends MessageState {
  MessageSuccess(this.appMessage);
  final AppMessage appMessage;
}
