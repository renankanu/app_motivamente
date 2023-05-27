import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'app/bloc/message/message_controller.dart';
import 'app/routes/app_routes.dart';
import 'app/shared/theme/app_theme.dart';
import 'firebase_options.dart';
import 'injection.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://oymrnlprnkwhxeajawuk.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im95bXJubHBybmt3aHhlYWphd3VrIiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODUxNDM1MzEsImV4cCI6MjAwMDcxOTUzMX0.MXrwCAqQwsMZ78gRM5QviikjSGXr3yjdZEOAtx572UQ',
  );
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  di.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di.locator<MessageController>(),
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
