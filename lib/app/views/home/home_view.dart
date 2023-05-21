import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import '../../routes/app_routes.dart';
import '../../shared/shared.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: LottieBuilder.asset(
                  AppAssets.fortuneCookie,
                  repeat: false,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => context.push(AppRoutes.message),
                style: ElevatedButton.styleFrom(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Pegar a mensagem',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ).animate().scale(
                    begin: Offset.zero,
                    end: const Offset(1, 1),
                    curve: Curves.fastOutSlowIn,
                    duration: 600.ms,
                  )
            ],
          )
        ],
      ),
    );
  }
}
