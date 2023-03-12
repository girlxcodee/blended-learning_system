import 'package:blended_learning_system/screens/dashboard.dart';
import 'package:blended_learning_system/screens/register_page.dart';
import 'package:blended_learning_system/screens/reset_password.dart';
import 'package:blended_learning_system/theme.dart';
import 'package:blended_learning_system/widgets/primary_button.dart';
import 'package:flutter/material.dart';

import '../helper/user_helper.dart';
import '../routes/routes.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);
  static String routeName = 'SignIn';

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool visible = false;

  final formKey = GlobalKey<FormState>();
  late TextEditingController emailController = new TextEditingController();
  late TextEditingController passwordController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  bool _isObscure3 = true;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Padding(
        padding: kDefaultPadding,
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Container(
                  width: w,
                  height: h * 0.3,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("images/emblem.jpeg"),
                          fit: BoxFit.fitWidth)),
                ),
                Container(
                    margin: const EdgeInsets.only(left: 22, right: 22),
                    width: w,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome Back',
                            style: titleText,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Text(
                                'New Here?',
                                style: subTitle,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Register()));
                                },
                                child: Text(
                                  'Sign Up',
                                  style: textButton.copyWith(
                                      decoration: TextDecoration.underline,
                                      decorationThickness: 1),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: TextFormField(
                              controller: emailController,
                              decoration: InputDecoration(
                                labelText: "Email",
                                labelStyle: TextStyle(color: kTextFieldColor),
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: kPrimaryColor,
                                ),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: kPrimaryColor)),
                              ),
                              validator: (value) {
                                if (!RegExp(
                                        "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                    .hasMatch(value!)) {
                                  return ("Please enter a valid email");
                                } else {
                                  return null;
                                }
                              },
                              onSaved: (value) {
                                emailController.text = value!;
                              },
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            child: TextFormField(
                              obscureText: _isObscure3,
                              controller: passwordController,
                              decoration: InputDecoration(
                                  labelText: "Password",
                                  labelStyle: TextStyle(color: kTextFieldColor),
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    color: kPrimaryColor,
                                  ),
                                  suffixIcon: IconButton(
                                      icon: Icon(
                                        _isObscure3
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                        color: kPrimaryColor,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _isObscure3 = !_isObscure3;
                                        });
                                      }),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                    color: kPrimaryColor,
                                  ))),
                              validator: (value) {
                                RegExp regex = new RegExp(r'^.{6,}$');
                                if (!regex.hasMatch(value!)) {
                                  return ("please enter valid password min. 6 character");
                                } else {
                                  return null;
                                }
                              },
                              onSaved: (value) {
                                passwordController.text = value!;
                              },
                              keyboardType: TextInputType.emailAddress,
                            ),
                          ),
                        ])),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ResetPasswordScreen()));
                  },
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                        color: kZambeziColor,
                        fontSize: 14,
                        decoration: TextDecoration.underline,
                        decorationThickness: 1),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                  
                    final isValid = formKey.currentState!.validate();

                    if (isValid) {
                      Navigator.of(context).pushNamed(RouteManager.dashboard);
                    }

                    loginUserInUI(context,
                        email: emailController.text,
                        password: passwordController.text);
                  },
                  child: PrimaryButton(buttonText: 'Sign In'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
