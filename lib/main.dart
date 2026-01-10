import 'package:evently/common/theme/app_theme.dart';
import 'package:evently/firebase_options.dart';
import 'package:evently/onboarding_intro.dart';
import 'package:evently/screens/auth/login_screen.dart';
import 'package:evently/screens/auth/sing_up_screen.dart';
import 'package:evently/screens/home/main_layer_screen.dart';
import 'package:evently/screens/onboarding_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final bool onboardingDone = prefs.getBool('onboarding_done') ?? false;
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp(onboardingDone: onboardingDone));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.onboardingDone});
  final bool onboardingDone;
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
        OnboardingIntro.routeName: (_) => OnboardingIntro(),
        OnboardingScreen.routeName: (_) => OnboardingScreen(),
        SignUpScreen.routeName: (_) => SignUpScreen(),
      },
      initialRoute: onboardingDone
          ? LoginScreen.routeName
          : OnboardingIntro.routeName,
    );
  }
}
