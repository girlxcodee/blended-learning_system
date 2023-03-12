import 'package:blended_learning_system/screens/login_page.dart';
import 'package:blended_learning_system/theme.dart';
import 'package:flutter/material.dart';
import '../helper/user_helper.dart';
import '../widgets/primary_button.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
  static String routeName = 'Register';
}

class _RegisterState extends State<Register> {
  _RegisterState();

  bool visible = false;

  final formKey = GlobalKey<FormState>();

  late TextEditingController firstNameController = new TextEditingController();
  late TextEditingController lastNameController = new TextEditingController();
  late TextEditingController emailController = new TextEditingController();
  late TextEditingController passwordController = new TextEditingController();
  late TextEditingController confirmPasswordController =
      new TextEditingController();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    super.dispose();
  }

  bool _isObscure = true;
  bool _isObscure2 = true;

  var options = [
    'Student',
    'Teacher',
  ];

  var _currentItemSelected = "Student";
  var role = "Student";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: 70,
            ),
            Padding(
              padding: kDefaultPadding,
              child: Text(
                'Create Account',
                style: titleText,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: kDefaultPadding,
              child: Row(
                children: [
                  Text(
                    'Already Enrolled?',
                    style: subTitle,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignIn()));
                    },
                    child: Text(
                      'Sign In',
                      style: textButton.copyWith(
                          decoration: TextDecoration.underline,
                          decorationThickness: 1),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: TextFormField(
                controller: firstNameController,
                decoration: InputDecoration(
                    labelText: 'First Name',
                    labelStyle: TextStyle(color: kTextFieldColor),
                    prefixIcon: Icon(
                      Icons.person,
                      color: kPrimaryColor,
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: kPrimaryColor),
                    )),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: TextFormField(
                controller: lastNameController,
                decoration: InputDecoration(
                    hintText: 'Last Name',
                    hintStyle: TextStyle(color: kTextFieldColor),
                    prefixIcon: Icon(
                      Icons.person,
                      color: kPrimaryColor,
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: kPrimaryColor),
                    )),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: "Email",
                  hintStyle: TextStyle(color: kTextFieldColor),
                  prefixIcon: Icon(
                    Icons.email,
                    color: kPrimaryColor,
                  ),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: kPrimaryColor)),
                ),
                validator: (value) {
                  if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                      .hasMatch(value!)) {
                    return ("Please enter a valid email");
                  } else {
                    return null;
                  }
                },
                onChanged: (value) {},
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: TextFormField(
                obscureText: _isObscure,
                controller: passwordController,
                decoration: InputDecoration(
                    hintText: "Password",
                    hintStyle: TextStyle(color: kTextFieldColor),
                    prefixIcon: Icon(
                      Icons.lock,
                      color: kPrimaryColor,
                    ),
                    suffixIcon: IconButton(
                        icon: Icon(
                          _isObscure ? Icons.visibility_off : Icons.visibility,
                          color: kPrimaryColor,
                        ),
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
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
                onChanged: (value) {},
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: TextFormField(
                obscureText: _isObscure2,
                controller: confirmPasswordController,
                decoration: InputDecoration(
                    hintText: "Confirm Password",
                    hintStyle: TextStyle(color: kTextFieldColor),
                    prefixIcon: Icon(
                      Icons.lock,
                      color: kPrimaryColor,
                    ),
                    suffixIcon: IconButton(
                        icon: Icon(
                          _isObscure2 ? Icons.visibility_off : Icons.visibility,
                          color: kPrimaryColor,
                        ),
                        onPressed: () {
                          setState(() {
                            _isObscure2 = !_isObscure2;
                          });
                        }),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                      color: kPrimaryColor,
                    ))),
                validator: (value) {
                  if (confirmPasswordController.text !=
                      passwordController.text) {
                    return "Password did not match";
                  } else {
                    return null;
                  }
                },
                onChanged: (value) {},
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Role : ",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: kDarkGreyColor,
                  ),
                ),
                DropdownButton<String>(
                    dropdownColor: Colors.white,
                    isDense: true,
                    isExpanded: false,
                    iconEnabledColor: kDarkGreyColor,
                    focusColor: kDarkGreyColor,
                    items: options.map((String dropDownStringItem) {
                      return DropdownMenuItem<String>(
                        value: dropDownStringItem,
                        child: Text(
                          dropDownStringItem,
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (newValueSelected) {
                      setState(() {
                        _currentItemSelected = newValueSelected!;
                        role = newValueSelected;
                      });
                    },
                    value: _currentItemSelected),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                final isValid = formKey.currentState!.validate();

                createNewUserInUI(context,
                    email: emailController.text.trim(),
                    password: passwordController.text.trim(),
                    confirmPassword: confirmPasswordController.text.trim(),
                    name: firstNameController.text.trim(),
                    lastName: lastNameController.text.trim()
                    );
              },
              child: Padding(
                padding: kDefaultPadding,
                child: PrimaryButton(buttonText: 'Sign Up'),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
