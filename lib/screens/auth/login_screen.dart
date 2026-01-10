import 'package:evently/common/theme/app_assets.dart';
import 'package:evently/common/theme/app_colors.dart';
import 'package:evently/common/widgets/coustom_main_button.dart';
import 'package:evently/common/widgets/coustom_outlined_button.dart';
import 'package:evently/common/widgets/custom_text_field.dart';
import 'package:evently/screens/auth/sing_up_screen.dart';
import 'package:evently/screens/home/main_layer_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  static const String routeName = "/loginScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            //crossAxisAlignment: CrossAxisAlignment.end,
            spacing: 16,

            children: [
              Image.asset(AppAssets.appLogo, width: 140, height: 190),
              SizedBox(height: 8),
              CustomTextField(
                hintText: "Email",
                prefixIconPath: AppAssets.emailIconSvg,
              ),
              CustomTextField(
                hintText: "Password",
                prefixIconPath: AppAssets.passIconSvg,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "forget Password?",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.mainColor,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.mainColor,
                        decorationStyle: TextDecorationStyle.solid,
                        decorationThickness: 2,
                      ),
                    ),
                  ),
                ],
              ),
              CustomMainButton(
                title: "Login",
                onPressed: () {
                  Navigator.pushNamed(context, MainLayerScreen.routeName);
                },
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "Don’t Have Account ?",
                      style: TextStyle(color: Theme.of(context).hoverColor),
                    ),
                    TextSpan(
                      text: " Create Account",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        color: AppColors.mainColor,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.mainColor,
                        decorationThickness: 2,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.of(
                            context,
                          ).pushNamed(SignUpScreen.routeName);
                        },
                    ),
                  ],
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
              Row(
                spacing: 16,
                children: [
                  Expanded(child: Divider(indent: 24)),
                  Text(
                    "Or",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: AppColors.mainColor,
                    ),
                  ),
                  Expanded(child: Divider(endIndent: 24)),
                ],
              ),
              CustomOutlinedButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 8,
                  children: [
                    Image.asset(AppAssets.googleIcon, width: 26, height: 26),
                    Text(
                      "Login With Google",
                      style: TextStyle(
                        color: AppColors.mainColor,
                        fontSize: 20,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Switch(
                value: true,
                onChanged: (value) {},
                inactiveThumbImage: AssetImage(AppAssets.arIcon),
                activeThumbImage: AssetImage(AppAssets.enIcon),
                activeColor: AppColors.mainColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
