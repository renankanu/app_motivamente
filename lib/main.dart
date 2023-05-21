import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'app/bloc/message/message_controller.dart';
import 'app/routes/app_routes.dart';
import 'app/shared/theme/app_theme.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MessageController(),
        ),
      ],
      child: MaterialApp.router(
        title: 'Motivamente',
        theme: AppTheme.theme,
        debugShowCheckedModeBanner: false,
        routerConfig: AppRoutes.router,
      ),
    );
  }
}
