import 'package:bnchinamart/pages/auth/login_page.dart';
import 'package:bnchinamart/utils/assets.dart';
import 'package:bnchinamart/utils/colors.dart';
import 'package:bnchinamart/utils/data.dart';
import 'package:bnchinamart/utils/validators.dart';
import 'package:bnchinamart/widgets/custom_banner.dart';
import 'package:bnchinamart/widgets/custom_button.dart';
import 'package:bnchinamart/widgets/custom_textfileds.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SignUp extends StatelessWidget {
  SignUp({super.key});

  GlobalKey<FormState> formcontroler = GlobalKey<FormState>();
  String? username;
  String? email;
  String? password;
  void register(BuildContext context) {
    final bool isValidate = formcontroler.currentState!.validate();

    if (!isValidate) {
      return;
    }

    formcontroler.currentState!.save();
    accounts.add(
      {
        "username": username!,
        "email": email!,
        "password": password!,
      },
    );
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return LoginPage();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CustomBanner(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Start Ordering !",
                      style: TextStyle(
                        color: textColor,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Create a Free Account",
                      style: TextStyle(
                        color: textColor,
                        fontSize: 27,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Form(
                      key: formcontroler,
                      child: Column(
                        children: [
                          CustomTextField(
                            text: 'Username',
                            iconpath: usernameIcon,
                            onValidate: validatorUsername,
                            onSave: (value) {
                              username = value;
                            },
                            keyboardType: TextInputType.emailAddress,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          CustomTextField(
                            text: 'Email',
                            iconpath: emailIcon,
                            onValidate: validateremail,
                            onSave: (value) {
                              email = value;
                            },
                            keyboardType: TextInputType.emailAddress,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          CustomTextField(
                            text: 'Password',
                            iconpath: passwordIcon,
                            onValidate: validatorPassword,
                            onSave: (value) {
                              password = value;
                            },
                            isObsecureText: true,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          CustomButton(
                            text: 'Sign Up',
                            onTap: () {
                              register(
                                context,
                              );
                            },
                          )
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already Have an Account ?",
                          style: TextStyle(
                              color: textColor,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return LoginPage();
                                },
                              ),
                            );
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(
                                color: primaryColor,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "Or",
                      style: TextStyle(
                          color: textColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: lightBlueColor,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(googleLogo),
                          Text(
                            "Login With Google",
                            style: TextStyle(
                                color: darkBlueColor,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                          Container(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
