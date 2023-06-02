import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:lottie/lottie.dart';

import '../../routes/app_routes.dart';
import '../../shared/shared.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late BannerAd _bannerAd;
  bool _isLoaded = false;

  final adUnitId =
      Platform.isAndroid ? 'ca-app-pub-4031327619307152/9838917608' : '';

  @override
  void initState() {
    loadBanner();
    super.initState();
  }

  void loadBanner() {
    _bannerAd = BannerAd(
      adUnitId: adUnitId,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (_) {
          setState(() {
            _isLoaded = true;
          });
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
        },
      ),
    )..load();
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
          ),
          if (_isLoaded)
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: _bannerAd.size.width.toDouble(),
                height: _bannerAd.size.height.toDouble(),
                child: AdWidget(ad: _bannerAd),
              ),
            ),
        ],
      ),
    );
  }
}
