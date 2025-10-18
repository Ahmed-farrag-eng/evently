import 'package:evently/common/theme/app_theme.dart';
import 'package:evently/firebase_options.dart';
import 'package:evently/screens/auth/login_screen.dart';
import 'package:evently/screens/auth/sing_up_screen.dart';
import 'package:evently/screens/home/main_layer_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      routes: {
        MainLayerScreen.routeName: (context) => MainLayerScreen(),
        LoginScreen.routeName: (_) => LoginScreen(),
        SingUpScreen.routeName: (_) => SingUpScreen(),
      },
      initialRoute: LoginScreen.routeName,
    );
  }
}
