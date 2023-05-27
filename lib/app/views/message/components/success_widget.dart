import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../../model/quote.dart';
import '../../../shared/shared.dart';

class SuccessWidget extends StatelessWidget {
  const SuccessWidget({
    super.key,
    required this.quote,
  });

  final Quote quote;

  void shareMessage(GlobalKey containerKey) async {
    final RenderRepaintBoundary boundary = containerKey.currentContext!
        .findRenderObject() as RenderRepaintBoundary;
    final ui.Image image = await boundary.toImage(pixelRatio: 3.0);
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    if (byteData != null) {
      final appDir = await getTemporaryDirectory();
      final file = File('${appDir.path}/motivamente.png');
      await file.writeAsBytes(byteData.buffer.asUint8List());
      final xFile = XFile(file.path);
      Share.shareXFiles(
        [xFile],
        text: quote.message,
        subject: quote.author,
      );
    }
  }

  double _getSizeString() {
    if (quote.message.length > 260) {
      return 16;
    }
    return 18;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    GlobalKey shareKey = GlobalKey();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RepaintBoundary(
          key: shareKey,
          child: Container(
            height: width,
            width: width,
            color: AppColors.sidecar,
            child: Stack(
              children: [
                Align(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      AppAssets.quoteBg,
                      height: width,
                    ),
                  ),
                ).animate().fadeIn(
                      begin: 0,
                      curve: Curves.fastOutSlowIn,
                      duration: 500.ms,
                    ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 66),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        quote.message,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: _getSizeString(),
                          fontWeight: FontWeight.bold,
                          color: AppColors.tundora,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            '-${quote.author}',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.tundora,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ).animate().moveX(
                      begin: -width,
                      end: 0,
                      curve: Curves.fastOutSlowIn,
                      duration: 500.ms,
                    ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () => shareMessage(shareKey),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.tundora,
            shape: const CircleBorder(),
            alignment: Alignment.center,
            minimumSize: const Size(60, 60),
            elevation: 10,
          ),
          child: const Icon(
            Icons.share,
            color: AppColors.sidecar,
          ),
        ).animate().scale(
              begin: Offset.zero,
              end: const Offset(1, 1),
              curve: Curves.fastOutSlowIn,
              duration: const Duration(milliseconds: 500),
            ),
      ],
    );
  }
}
