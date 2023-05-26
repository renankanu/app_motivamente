import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:translator/translator.dart';

import '../../routes/app_routes.dart';
import '../../shared/shared.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final translator = GoogleTranslator();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 24),
                child: Center(
                  child: LottieBuilder.asset(
                    AppAssets.fortuneCookie,
                    repeat: false,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => context.push(AppRoutes.message),
                style: ElevatedButton.styleFrom(
                  elevation: 10,
                  backgroundColor: AppColors.energyYellow,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Pegar a mensagem',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.tundora,
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
