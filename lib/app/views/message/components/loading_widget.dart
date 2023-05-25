import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../shared/shared.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LottieBuilder.asset(
          AppAssets.loading,
          height: 60,
        ),
        const SizedBox(
          width: double.infinity,
          child: Text(
            'Carregando sua mensagem',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
