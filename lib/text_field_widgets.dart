/// Create a screen (with scafold) and it should have the following widgets:
/// 1. AppBar with it's title "Testing textfields". Use the widget Textfield or TextFormField
/// 2. body: Should have 2 textfield vertically which ask for Email and password.
/// 3. Button which says "Sign In"
/// 4.When button is pressed user has to be navigated to a new screen which has title "Home"
///

import 'package:android_and_ios/utils/shared_pref.dart';
import 'package:flutter/material.dart';

class LoginnScreen extends StatefulWidget {
  const LoginnScreen({Key? key}) : super(key: key);

  @override
  _LoginnScreenState createState() => _LoginnScreenState();
}

class _LoginnScreenState extends State<LoginnScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  void dispose() {
    super.dispose();

    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Text field"),
        ),
        body: Form(
          // autovalidateMode: AutovalidateMode.always,
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: emailController,
                textInputAction: TextInputAction.search,
                keyboardType: TextInputType.emailAddress,
                onChanged: (val) {
                  print(val);
                },
                validator: (value) {
                  if (value == null) {
                    return "this is an email";
                  }

                  if (value.isEmpty) {
                    return "this is an email";
                  }

                  return null;
                },
              ),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                validator: (value) {
                  print(value);
                  if (value == null) {
                    return "Password must not be empty";
                  }
                  if (value.isEmpty) {
                    return "Password must not be empty";
                  }
                  if (value.length < 6) {
                    return "Password must be greater than 6 characters.";
                  }

                  return null;
                },
                decoration: InputDecoration(),
              ),
              MaterialButton(
                minWidth: 200,
                color: Colors.green,
                onPressed: () async {
                  var email = emailController.text;
                  var password = passwordController.text;

                  print(email);
                  print(password);

                  if (formKey.currentState != null) {
                    formKey.currentState!.validate();
                  }

                  SharedPref.setUserHasLoggedIn(true);
                },
                child: Text(
                  "login",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ));
  }
}
