import 'package:evently/common/theme/app_assets.dart';
import 'package:evently/common/theme/app_colors.dart';
import 'package:evently/common/widgets/coustom_main_button.dart';
import 'package:evently/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';

class OnboardingIntro extends StatefulWidget {
  const OnboardingIntro({super.key});
  static const String routeName = '/onboardingItro';

  @override
  State<OnboardingIntro> createState() => _OnboardingIntroState();
}

class _OnboardingIntroState extends State<OnboardingIntro> {
  bool isEnglish = true;
  bool isLight = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100),
                child: Image.asset(
                  AppAssets.headerImage,
                  width: 160,
                  height: 50,
                ),
              ),
              SizedBox(height: 40),
              Image.asset(AppAssets.onboardingIntro),
              SizedBox(height: 40),
              Text(
                "Effortless Event Planning",
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: AppColors.mainColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 28),
              Text(
                "Choose your preferred theme and language to get started with a comfortable, "
                "tailored experience that suits your style.",
                style: TextStyle(
                  fontSize: 16,
                  height: 1.6,
                  color: Theme.of(context).hoverColor,
                ),
                textAlign: TextAlign.start,
                softWrap: true,
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Languge",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: AppColors.mainColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Switch(
                    value: isEnglish,
                    onChanged: (value) {
                      setState(() {
                        isEnglish = value;
                      });
                    },
                    inactiveThumbImage: AssetImage(AppAssets.arIcon),
                    activeThumbImage: AssetImage(AppAssets.enIcon),
                    activeColor: AppColors.mainColor,
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Theme",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: AppColors.mainColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Switch(
                    value: isLight,
                    onChanged: (value) {
                      setState(() {
                        isLight = value;
                      });
                    },
                    inactiveThumbImage: AssetImage(AppAssets.moonIcon),
                    activeThumbImage: AssetImage(AppAssets.lightIcon),
                    activeColor: AppColors.mainColor,
                  ),
                ],
              ),
              //SizedBox(height: 16),
              CustomMainButton(
                title: "Let's Start",
                onPressed: () {
                  Navigator.pushNamed(context, OnboardingScreen.routeName);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
