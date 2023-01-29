import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/firebase_options.dart';
import 'package:flutter_learn/screens/calling/calling_screen.dart';
import 'package:flutter_learn/screens/description/description.dart';
import 'package:flutter_learn/screens/homepage/homepage.dart';
import 'package:flutter_learn/utils/app_utils.dart';
import 'package:flutter_learn/utils/auth_service.dart';
import 'package:flutter_learn/utils/notification_service.dart';
import 'models/card_info_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final _notificationService = NotificationService();
  final _authService = AuthService();
  if (!kIsWeb) {
    await _notificationService.initialize();
  }
  await _authService.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Learn Flutter',
      navigatorKey: AppUtils.navigatorKey,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: AppUtils.initialRoute,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case Homepage.routeName:
            return MaterialPageRoute(
              builder: (context) => const Homepage(),
            );
          case Description.routeName:
            return MaterialPageRoute(
              builder: (context) => Description(
                cardInfo: settings.arguments as CardInfo,
              ),
            );
          case CallLockScreen.routeName:
            return MaterialPageRoute(
              builder: (context) => const CallLockScreen(),
            );
          default:
            return MaterialPageRoute(
              builder: (context) => const Center(
                child: Text("No route found"),
              ),
            );
        }
      },
      home: const Homepage(),
    );
  }
}
