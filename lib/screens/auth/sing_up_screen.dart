import 'package:flutter/material.dart';
import 'package:evently/common/theme/app_assets.dart';
import 'package:evently/common/theme/app_colors.dart';
import 'package:evently/common/widgets/coustom_main_button.dart';
import 'package:evently/common/widgets/coustom_outlined_button.dart';
import 'package:evently/common/widgets/coustom_text_field.dart';

class SingUpScreen extends StatelessWidget {
  const SingUpScreen({super.key});
  static const String routeName = "/singUpScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Register"), leading: Icon(Icons.arrow_back)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            //crossAxisAlignment: CrossAxisAlignment.end,
            spacing: 16,

            children: [
              Image.asset(AppAssets.appLogo, width: 140, height: 190),
              SizedBox(height: 8),
              CoustomTextField(
                hintText: "Name",
                prefixIconPath: AppAssets.personIconSvg,
              ),
              CoustomTextField(
                hintText: "Email",
                prefixIconPath: AppAssets.emailIconSvg,
              ),
              CoustomTextField(
                hintText: "Password",
                prefixIconPath: AppAssets.passIconSvg,
              ),
              CoustomTextField(
                hintText: "Re Password",
                prefixIconPath: AppAssets.passIconSvg,
              ),

              CoustomMainButton(title: "Create Account", onPressed: () {}),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "Already Have Account?",
                      style: TextStyle(color: Theme.of(context).hoverColor),
                    ),
                    TextSpan(
                      text: "Login",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        color: AppColors.mainColor,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.mainColor,
                        decorationThickness: 2,
                      ),
                    ),
                  ],
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),

              CoustomOutlinedButton(
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
