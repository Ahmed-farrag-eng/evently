import 'package:evently/common/theme/app_colors.dart';
import 'package:evently/screens/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:evently/common/theme/app_assets.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});
  static const String routeName = "/OnboardingScreen";

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController controller = PageController();
  bool isFirstPage = true;
  bool isLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Stack(
        children: [
          PageView(
            controller: controller,
            onPageChanged: (value) {
              isFirstPage = value == 0;
              isLastPage = value == 2;
              setState(() {});
            },
            children: [
              // الصفحة الأولى
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 100),
                          child: Image.asset(
                            AppAssets.headerImage,
                            width: 160,
                            height: 50,
                          ),
                        ),
                      ),
                      SizedBox(height: 40),
                      Image.asset(
                        AppAssets.onboardingImage1,
                        width: double.infinity,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(height: 40),
                      Text(
                        "Find Events That Inspire You",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: AppColors.mainColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 40),
                      Text(
                        "Dive into a world of events crafted to fit your unique interests. "
                        "Whether you're into live music, art workshops, professional networking, "
                        "or simply discovering new experiences, we have something for everyone. "
                        "Our curated recommendations will help you explore, connect, and make the most "
                        "of every opportunity around you.",
                        style: TextStyle(
                          fontSize: 16,
                          height: 1.6,
                          color: Theme.of(context).hoverColor,
                        ),
                        textAlign: TextAlign.start,
                        softWrap: true,
                      ),
                    ],
                  ),
                ),
              ),

              // الصفحة الثانية
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 100),
                          child: Image.asset(
                            AppAssets.headerImage,
                            width: 160,
                            height: 50,
                          ),
                        ),
                      ),
                      SizedBox(height: 40),
                      Image.asset(
                        AppAssets.onboardingImage2,
                        width: double.infinity,
                        fit: BoxFit.contain,
                      ),
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
                      SizedBox(height: 40),
                      Text(
                        "Take the hassle out of organizing events with our all-in-one planning tools. "
                        "From setting up invites and managing RSVPs to scheduling reminders and coordinating details, "
                        "we’ve got you covered. Plan with ease and focus on what matters – "
                        "creating an unforgettable experience for you and your guests.",
                        style: TextStyle(
                          fontSize: 16,
                          height: 1.6, // تنظيم المسافات بين السطور
                          color: Theme.of(context).hoverColor,
                        ),
                        textAlign: TextAlign.start, // محاذاة طبيعية
                        softWrap: true, // التفاف تلقائي
                      ),
                    ],
                  ),
                ),
              ),

              // الصفحة الثالثة
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 100),
                          child: Image.asset(
                            AppAssets.headerImage,
                            width: 160,
                            height: 50,
                          ),
                        ),
                      ),
                      SizedBox(height: 40),
                      Image.asset(
                        AppAssets.onboardingImage3,
                        width: double.infinity,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(height: 40),
                      Text(
                        "Connect with Friends & Share Moments",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: AppColors.mainColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 40),
                      Text(
                        "Make every event memorable by sharing the experience with others. "
                        "Our platform lets you invite friends, keep everyone in the loop, "
                        "and celebrate moments together. Capture and share the excitement with your network, "
                        "so you can relive the highlights and cherish the memories.",
                        style: TextStyle(
                          fontSize: 16,
                          height: 1.6, // تنظيم المسافات بين السطور
                          color: Theme.of(context).hoverColor,
                        ),
                        textAlign: TextAlign.start, // محاذاة طبيعية
                        softWrap: true, // التفاف تلقائي
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // المؤشر أسفل الشاشة
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  isFirstPage
                      ? SizedBox(width: 48)
                      : IconButton.outlined(
                          onPressed: () {
                            controller.previousPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeIn,
                            );
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            color: AppColors.mainColor,
                          ),
                          style: IconButton.styleFrom(
                            side: BorderSide(color: AppColors.mainColor),
                          ),
                        ),
                  SmoothPageIndicator(
                    controller: controller,
                    count: 3,
                    effect: WormEffect(
                      activeDotColor: AppColors.mainColor,
                      dotHeight: 12,
                      dotWidth: 12,
                    ),
                  ),
                  IconButton.outlined(
                    onPressed: () async {
                      if (isLastPage) {
                        final prefs = await SharedPreferences.getInstance();

                        if (!mounted) return;

                        await prefs.setBool("onboarding_done", true);

                        if (!mounted) return;
                        Navigator.pushNamed(context, LoginScreen.routeName);
                      } else {
                        controller.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                      }
                    },
                    icon: Icon(Icons.arrow_forward, color: AppColors.mainColor),
                    style: IconButton.styleFrom(
                      side: BorderSide(color: AppColors.mainColor),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
