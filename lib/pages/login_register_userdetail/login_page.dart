// ignore_for_file: deprecated_member_use, use_key_in_widget_constructors

import 'dart:async';

//import 'package:gcg_version_01/pages/login_register_userdetail/UserDetail.dart';

import 'package:flutter/material.dart';
import 'package:gcg_ec/pages/home.dart';

import '../../ProgressHUD.dart';
import '../../api/Login_api_services.dart';
import '../../model/login_model.dart';
import '../order_page.dart';
import 'register_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool hidePassword = true;
  bool isApiCallProcess = false;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  late LoginRequestModel loginRequestModel;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    loginRequestModel = LoginRequestModel();
  }

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      child: _uiSetup(context),
      inAsyncCall: isApiCallProcess,
      opacity: 0.3,
    );
  }

  Widget _uiSetup(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color.fromARGB(
          255, 219, 219, 219), //Theme.of(context).colorScheme.secondary,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        vertical: 30, horizontal: 20),
                    margin: const EdgeInsets.symmetric(
                        vertical: 85, horizontal: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white, //Theme.of(context).primaryColor,
                      boxShadow: [
                        BoxShadow(
                            color: Theme.of(context).hintColor.withOpacity(0.2),
                            offset: const Offset(0, 25),
                            blurRadius: 20)
                      ],
                    ),
                    child: Form(
                      key: globalFormKey,
                      child: Column(
                        children: <Widget>[
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: Text(
                              "Login",
                              style: TextStyle(
                                fontSize: 36,
                                color: Color.fromARGB(255, 100, 100, 100),
                                fontWeight: FontWeight.bold,
                              ),
                              //Theme.of(context).textTheme.headline3,
                            ),
                          ),
                          const SizedBox(height: 30),
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            onSaved: (input) =>
                                loginRequestModel.email = input!,
                            validator: (input) => input!.contains('@')
                                ? null
                                : "Email Id should be valid",
                            decoration: InputDecoration(
                              hintText: "Email Address",
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      style: BorderStyle.solid,
                                      color: Color.fromARGB(255, 170, 170,
                                          170) //Theme.of(context).colorScheme.secondary.withOpacity(0.2)
                                      )),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors
                                          .black54 //Theme.of(context).colorScheme.secondary
                                      )),
                              prefixIcon: Icon(Icons.email,
                                  color: Color.fromARGB(255, 180, 180,
                                      180) //Theme.of(context).colorScheme.secondary,
                                  ),
                            ),
                          ),
                          const SizedBox(height: 30),
                          TextFormField(
                            style: TextStyle(
                                //color: Theme.of(context).colorScheme.secondary
                                ),
                            keyboardType: TextInputType.text,
                            onSaved: (input) =>
                                loginRequestModel.password = input!,
                            validator: (input) => input!.length < 3
                                ? "Password should be more than 3 characters"
                                : null,
                            obscureText: hidePassword,
                            decoration: InputDecoration(
                              hintText: "Password",
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 170, 170,
                                          170) //Theme.of(context).colorScheme.secondary.withOpacity(0.2)
                                      )),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors
                                          .black54 //Theme.of(context).colorScheme.secondary
                                      )),
                              prefixIcon: Icon(Icons.lock,
                                  color: Color.fromARGB(255, 180, 180,
                                      180) //Theme.of(context).colorScheme.secondary,
                                  ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    hidePassword = !hidePassword;
                                  });
                                },
                                color: Color.fromARGB(255, 180, 180,
                                    180), //Theme.of(context).colorScheme.secondary.withOpacity(0.4),
                                icon: Icon(hidePassword
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 290, top: 2),
                            child: FlatButton(
                                splashColor: Colors.white,
                                hoverColor: Colors.white,
                                onPressed: () {},
                                child: Text(
                                  'Forget Password',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.black54),
                                )),
                          ),
                          const SizedBox(height: 10),
                          MaterialButton(
                            color: Colors.amberAccent,
                            // shape: //const StadiumBorder(),
                            padding: const EdgeInsets.symmetric(
                                vertical: 18, horizontal: 90),
                            onPressed: () {
                              // print("login_page");
                              if (validateAndSave()) {
                                // print(validateAndSave());
                                // print(loginRequestModel.toJson());
                                setState(() {
                                  isApiCallProcess = true;
                                });

                                APIService apiService = APIService();
                                apiService
                                    .login(loginRequestModel)
                                    .then((value) {
                                  // print("login value");
                                  // print(value);
                                  if (value != null) {
                                    setState(() {
                                      isApiCallProcess = false;
                                    });
                                    if (value) {
                                      const snackBar = SnackBar(
                                          content: Text("Login Successful"));
                                      scaffoldKey.currentState
                                          ?.showSnackBar(snackBar);
                                      Timer(
                                          const Duration(seconds: 1),
                                          () => Navigator.of(context)
                                              .pushReplacement(
                                                  MaterialPageRoute(
                                                      builder: (BuildContext
                                                              context) =>
                                                          HomeScreen())));
                                    } else {
                                      const snackBar =
                                          SnackBar(content: Text("not found"));
                                      scaffoldKey.currentState
                                          ?.showSnackBar(snackBar);
                                    }
                                  }
                                });
                              }
                            },

                            // ================
                            child: const Text(
                              "Login",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          const SizedBox(height: 10),
                          FlatButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => register()));
                            },
                            child: const Text(
                              "New User? Register",
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 14),
                            ),
                            color:
                                Colors.white, //Theme.of(context).accentColor,
                            // shape: const StadiumBorder(),
                            padding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 40),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    print("login validate");
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
