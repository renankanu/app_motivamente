import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/message/message_controller.dart';
import '../../bloc/message/message_state.dart';
import '../../shared/shared.dart';
import 'components/loading_widget.dart';
import 'components/success_widget.dart';

class MessageView extends StatefulWidget {
  const MessageView({super.key});

  @override
  State<MessageView> createState() => _MessageViewState();
}

class _MessageViewState extends State<MessageView> {
  @override
  void initState() {
    _getMessage();
    super.initState();
  }

  Future<void> _getMessage() async {
    context.read<MessageController>().getMessage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        backgroundColor: AppColors.sidecar,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: BlocConsumer<MessageController, MessageState>(
        listener: (context, state) {},
        builder: (context, state) => switch (state) {
          MessageLoading() => const LoadingWidget(),
          MessageSuccess() => SuccessWidget(quote: state.message),
          MessageError() => Center(
              child: Text(
                state.errorMessage,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          _ => const SizedBox.shrink(),
        },
      ),
    );
  }
}
