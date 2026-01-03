import 'package:evently/common/network/auth_services.dart';
import 'package:evently/models/user_modal.dart';
import 'package:flutter/material.dart';
import 'package:evently/common/theme/app_assets.dart';
import 'package:evently/common/theme/app_colors.dart';
import 'package:evently/common/widgets/coustom_main_button.dart';
import 'package:evently/common/widgets/coustom_outlined_button.dart';
import 'package:evently/common/widgets/custom_text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  static const String routeName = "/singUpScreen";

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Register"), leading: Icon(Icons.arrow_back)),
      body: Form(
        key: _formkey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              //crossAxisAlignment: CrossAxisAlignment.end,
              spacing: 16,

              children: [
                Image.asset(AppAssets.appLogo, width: 140, height: 190),
                SizedBox(height: 8),
                CustomTextField(
                  controller: nameController,
                  hintText: "Name",
                  prefixIconPath: AppAssets.personIconSvg,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "the name is required";
                    } else {
                      return null;
                    }
                  },
                ),
                CustomTextField(
                  controller: emailController,
                  hintText: "Email",
                  prefixIconPath: AppAssets.emailIconSvg,
                  validator: (value) {
                    final bool emailValid = RegExp(
                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                    ).hasMatch(value ?? "");
                    if (emailValid == false) {
                      return "email not valid";
                    } else {
                      return null;
                    }
                  },
                ),
                CustomTextField(
                  isPassword: true,
                  controller: passwordController,
                  hintText: "Password",
                  prefixIconPath: AppAssets.passIconSvg,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "the password is required";
                    } else if (value.length < 7) {
                      return "the password at least8 char";
                    } else {
                      return null;
                    }
                  },
                ),
                CustomTextField(
                  isPassword: true,
                  controller: confirmPassController,
                  hintText: "confirm Password",
                  prefixIconPath: AppAssets.passIconSvg,
                  validator: (value) {
                    if (value != passwordController.text) {
                      return "passwords don't match";
                    } else {
                      return null;
                    }
                  },
                ),

                CustomMainButton(
                  title: "Create Account",
                  onPressed: () async {
                    if (_formkey.currentState!.validate()) {
                      await AuthServices.registerNewUser(
                        UserModal(
                          name: nameController.text,
                          email: emailController.text,
                        ),
                        passwordController.text,
                      );
                      Navigator.of(context).pop();
                    }
                  },
                ),
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
      ),
    );
  }
}
