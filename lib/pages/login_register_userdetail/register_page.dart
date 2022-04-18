// ignore_for_file: deprecated_member_use, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../ProgressHUD.dart';
import '../../api/Register_api_services.dart';
import '../../model/login_model.dart';
import '../../model/register_model.dart';

class register extends StatefulWidget {
  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  bool hidePassword = false;
  bool isApiCallProcess = false;
  GlobalKey<FormState> globalFormKey1 = GlobalKey<FormState>();
  late RegisterRequestModel registerRequestModel;
  late LoginRequestModel login;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    registerRequestModel = RegisterRequestModel();
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
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 35),
                    margin: EdgeInsets.symmetric(vertical: 80, horizontal: 30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white, //Theme.of(context).primaryColor,
                      boxShadow: [
                        BoxShadow(
                            color: Theme.of(context).hintColor.withOpacity(0.2),
                            offset: Offset(0, 10),
                            blurRadius: 20)
                      ],
                    ),
                    child: Form(
                      key: globalFormKey1,
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 35),
                          Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: Text(
                              "Register",
                              style: TextStyle(
                                fontSize: 36,
                                color: Color.fromARGB(255, 100, 100, 100),
                                fontWeight: FontWeight.bold,
                              ), //Theme.of(context).textTheme.headline2,
                            ),
                          ),
                          SizedBox(height: 35),
                          new TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            onSaved: (input) =>
                                registerRequestModel.FirstName = input,
                            // validator: (input) => !input.contains('@')
                            //     ? "Email Id should be valid"
                            //     : null,
                            decoration: new InputDecoration(
                              hintText: "First Name",
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
                              prefixIcon: Icon(Icons.person,
                                  color: Color.fromARGB(255, 180, 180,
                                      180) //Theme.of(context).colorScheme.secondary,
                                  ),
                            ),
                          ),
                          SizedBox(height: 25),
                          new TextFormField(
                            style: TextStyle(
                                //color: Theme.of(context).colorScheme.secondary
                                ),
                            keyboardType: TextInputType.text,
                            onSaved: (input) =>
                                registerRequestModel.LastName = input,
                            // validator: (input) => input.length < 3
                            //     ? "Password should be more than 3 characters"
                            //     : null,
                            obscureText: hidePassword,
                            decoration: new InputDecoration(
                              hintText: "Last name",
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
                              prefixIcon: Icon(Icons.person,
                                  color: Color.fromARGB(255, 180, 180,
                                      180) //Theme.of(context).colorScheme.secondary,
                                  ),
                            ),
                          ),
                          SizedBox(height: 25),
                          new TextFormField(
                            style: TextStyle(
                                // color: Theme.of(context).colorScheme.secondary
                                ),
                            keyboardType: TextInputType.number,
                            // onSaved: (input) =>
                            //   registerRequestModel.LastName = input,
                            // validator: (input) => input.length < 3
                            //     ? "Password should be more than 3 characters"
                            //     : null,
                            // obscureText: hidePassword,
                            decoration: new InputDecoration(
                              hintText: "Phone Number",
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
                              prefixIcon: Icon(Icons.phone,
                                  color: Color.fromARGB(255, 180, 180,
                                      180) //Theme.of(context).colorScheme.secondary,
                                  ),
                            ),
                          ),
                          SizedBox(height: 25),
                          new TextFormField(
                            style: TextStyle(
                                // color: Theme.of(context).colorScheme.secondary
                                ),
                            keyboardType: TextInputType.text,
                            // onSaved: (input) =>
                            //   registerRequestModel.companyName = input,
                            // validator: (input) => input.length < 3
                            //     ? "Password should be more than 3 characters"
                            //     : null,
                            // obscureText: hidePassword,
                            decoration: new InputDecoration(
                              hintText: "Company Name",
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
                              prefixIcon: Icon(Icons.group,
                                  color: Color.fromARGB(255, 180, 180,
                                      180) //Theme.of(context).colorScheme.secondary,
                                  ),
                            ),
                          ),
                          SizedBox(height: 25),
                          new TextFormField(
                            style: TextStyle(
                                // color: Theme.of(context).colorScheme.secondary
                                ),
                            keyboardType: TextInputType.text,
                            onSaved: (input) =>
                                registerRequestModel.email = input,
                            validator: (input) =>
                                input!.contains('@') ? "Wrong Email" : null,
                            //  obscureText: hidePassword,
                            decoration: new InputDecoration(
                              hintText: "Email Address",
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                color: Color.fromARGB(255, 170, 170,
                                    170), //Theme.of(context).colorScheme.secondary.withOpacity(0.2)
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
                          SizedBox(height: 25),
                          new TextFormField(
                            style: TextStyle(
                                // color: Theme.of(context).colorScheme.secondary
                                ),
                            keyboardType: TextInputType.text,
                            onSaved: (input) =>
                                registerRequestModel.password = input,
                            // validator: (input) => input.length < 3
                            //     ? "Password should be more than 3 characters"
                            //     : null,
                            obscureText: hidePassword,
                            decoration: new InputDecoration(
                              hintText: "Password",
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                color: Color.fromARGB(255, 170, 170,
                                    170), // Theme.of(context).colorScheme.secondary.withOpacity(0.2)
                              )),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors
                                          .black54 //Theme.of(context).colorScheme.secondary
                                      )),
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Color.fromARGB(255, 180, 180,
                                    180), //Theme.of(context).colorScheme.secondary,
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
                          SizedBox(height: 25),
                          new TextFormField(
                            style: TextStyle(
                                //  color: Theme.of(context).colorScheme.secondary
                                ),
                            keyboardType: TextInputType.text,
                            onSaved: (input) =>
                                registerRequestModel.confirmPassword = input,
                            // validator: (input) => input.length < 3
                            //     ? "Password should be more than 3 characters"
                            //     : null,
                            obscureText: hidePassword,
                            decoration: new InputDecoration(
                              hintText: "Confirm Password",
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                color: Color.fromARGB(255, 170, 170,
                                    170), //Theme.of(context).colorScheme.secondary.withOpacity(0.2)
                              )),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                color: Colors
                                    .black54, //Theme.of(context).colorScheme.secondary
                              )),
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Color.fromARGB(255, 180, 180,
                                    180), //Theme.of(context).colorScheme.secondary,
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
                          SizedBox(height: 35),
                          MaterialButton(
                            padding: EdgeInsets.symmetric(
                                vertical: 18, horizontal: 70),
                            color: Colors.amberAccent,
                            onPressed: () {
                              print("register page");
                              if (true) {
                                print(validateAndSave2());
                                print(registerRequestModel.toJson());
                                setState(() {
                                  isApiCallProcess = true;
                                });

                                APIService apiService = new APIService();
                                apiService
                                    .register(registerRequestModel)
                                    .then((value) {
                                  print("-----");
                                  print(value);
                                  if (value != null) {
                                    setState(() {
                                      isApiCallProcess = false;
                                    });

                                    if (value) {
                                      // ignore: prefer_const_constructors
                                      final snackBar = SnackBar(
                                          content: const Text(
                                              "register Successful"));
                                      scaffoldKey.currentState
                                          ?.showSnackBar(snackBar);
                                    } else {
                                      final snackBar = SnackBar(
                                          content: Text("unable to register"));
                                      scaffoldKey.currentState
                                          ?.showSnackBar(snackBar);
                                    }
                                  }
                                });
                              }
                            },

                            // ================
                            child: Text(
                              "Register",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          SizedBox(height: 35),
                        ],
                      ),
                    ),

                    /* Form(
                      key: globalFormKey1,
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 15),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              "Register",
                              style: TextStyle(
                                fontSize: 36,
                                color: Color.fromARGB(255, 100, 100, 100),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: 35),
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            onSaved: (input) =>
                                registerRequestModel.FirstName = input,
                            // validator: (input) => !input.contains('@')
                            //     ? "Email Id should be valid"
                            //     : null,
                            decoration: InputDecoration(
                              hintText: "First Name",
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
                              prefixIcon: Icon(Icons.person,
                                  color: Color.fromARGB(255, 180, 180,
                                      180) //Theme.of(context).colorScheme.secondary,
                                  ),
                            ),
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary),
                            keyboardType: TextInputType.text,
                            onSaved: (input) =>
                                registerRequestModel.LastName = input,
                            // validator: (input) => input.length < 3
                            //     ? "Password should be more than 3 characters"
                            //     : null,
                            obscureText: hidePassword,
                            decoration: InputDecoration(
                              hintText: "Last name",
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary
                                          .withOpacity(0.2))),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary)),
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    hidePassword = !hidePassword;
                                  });
                                },
                                color: Theme.of(context)
                                    .colorScheme
                                    .secondary
                                    .withOpacity(0.4),
                                icon: Icon(hidePassword
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                              ),
                            ),
                          ),
                          SizedBox(height: 30),
                          TextFormField(
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary),
                            keyboardType: TextInputType.text,
                            onSaved: (input) =>
                                registerRequestModel.phoneNumber = input,
                            validator: (input) => input!.contains('@')
                                ? "Password should be more than 3 characters"
                                : null,
                            obscureText: hidePassword,
                            decoration: InputDecoration(
                              hintText: "Phone number",
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary
                                          .withOpacity(0.2))),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary)),
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    hidePassword = !hidePassword;
                                  });
                                },
                                color: Theme.of(context)
                                    .colorScheme
                                    .secondary
                                    .withOpacity(0.4),
                                icon: Icon(hidePassword
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                              ),
                            ),
                          ),
                          SizedBox(height: 30),
                          TextFormField(
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary),
                            keyboardType: TextInputType.text,
                            onSaved: (input) =>
                                registerRequestModel.companyName = input,
                            // validator: (input) => input.length < 3
                            //     ? "Password should be more than 3 characters"
                            //     : null,
                            obscureText: hidePassword,
                            decoration: InputDecoration(
                              hintText: "Company name",
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary
                                          .withOpacity(0.2))),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary)),
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    hidePassword = !hidePassword;
                                  });
                                },
                                color: Theme.of(context)
                                    .colorScheme
                                    .secondary
                                    .withOpacity(0.4),
                                icon: Icon(hidePassword
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                              ),
                            ),
                          ),
                          SizedBox(height: 30),
                          TextFormField(
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary),
                            keyboardType: TextInputType.text,
                            onSaved: (input) =>
                                registerRequestModel.email = input,
                            validator: (input) => input!.contains('@')
                                ? null
                                : "email should cotain the required symbol",
                            obscureText: hidePassword,
                            decoration: InputDecoration(
                              hintText: "email",
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary
                                          .withOpacity(0.2))),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary)),
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    hidePassword = !hidePassword;
                                  });
                                },
                                color: Theme.of(context)
                                    .colorScheme
                                    .secondary
                                    .withOpacity(0.4),
                                icon: Icon(hidePassword
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                              ),
                            ),
                          ),
                          SizedBox(height: 30),
                          TextFormField(
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary),
                            keyboardType: TextInputType.text,
                            onSaved: (input) =>
                                registerRequestModel.password = input,
                            // validator: (input) => input.length < 3
                            //     ? "Password should be more than 3 characters"
                            //     : null,
                            obscureText: hidePassword,
                            decoration: InputDecoration(
                              hintText: "password",
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary
                                          .withOpacity(0.2))),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary)),
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    hidePassword = !hidePassword;
                                  });
                                },
                                color: Theme.of(context)
                                    .colorScheme
                                    .secondary
                                    .withOpacity(0.4),
                                icon: Icon(hidePassword
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                              ),
                            ),
                          ),
                          SizedBox(height: 30),
                          TextFormField(
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary),
                            keyboardType: TextInputType.text,
                            onSaved: (input) =>
                                registerRequestModel.confirmPassword = input,
                            // validator: (input) => input.length < 3
                            //     ? "Password should be more than 3 characters"
                            //     : null,
                            obscureText: hidePassword,
                            decoration: InputDecoration(
                              hintText: "confirm password",
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary
                                          .withOpacity(0.2))),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary)),
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    hidePassword = !hidePassword;
                                  });
                                },
                                color: Theme.of(context)
                                    .colorScheme
                                    .secondary
                                    .withOpacity(0.4),
                                icon: Icon(hidePassword
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                              ),
                            ),
                          ),
                          SizedBox(height: 30),
                          FlatButton(
                            padding: EdgeInsets.symmetric(
                                vertical: 12, horizontal: 80),
                            onPressed: () {
                              print("register page");
                              if (true) {
                                print(validateAndSave2());
                                print(registerRequestModel.toJson());
                                setState(() {
                                  isApiCallProcess = true;
                                });

                                APIService apiService = APIService();
                                apiService
                                    .register(registerRequestModel)
                                    .then((value) {
                                  print("-----");
                                  print(value);
                                  if (value != null) {
                                    setState(() {
                                      isApiCallProcess = false;
                                    });

                                    if (value) {
                                      final snackBar = SnackBar(
                                          content: const Text(
                                              "register Successful"));
                                      scaffoldKey.currentState
                                          ?.showSnackBar(snackBar);
                                    } else {
                                      final snackBar = SnackBar(
                                          content: Text("unable to register"));
                                      scaffoldKey.currentState
                                          ?.showSnackBar(snackBar);
                                    }
                                  }
                                });
                              }
                            },

                            // ================
                            child: Text(
                              "register",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          SizedBox(height: 15),
                        ],
                      ),
                    ),  */
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool validateAndSave2() {
    final form1 = globalFormKey1.currentState;
    print("register validate");
    print(form1);
    if (form1!.validate()) {
      form1.save();
      return true;
    }
    return false;
  }
}
