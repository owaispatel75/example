// ignore_for_file: deprecated_member_use, prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

import '../../ProgressHUD.dart';
import '../../api/All_get_api.dart';
import '../../api/userDetail.dart';
import '../../model/user.dart';
import '../../model/userDetail.dart';

class UserDetailPage extends StatefulWidget {
  const UserDetailPage({Key? key}) : super(key: key);

  @override
  State<UserDetailPage> createState() => _UserDetailPageState();
}

class _UserDetailPageState extends State<UserDetailPage> {
  var firstName, lastName, email, password;

  bool hidePassword = false;
  bool isApiCallProcess = false;
  // GlobalKey<FormState> globalFormKey1 = GlobalKey<FormState>();
  late UserDetails registerRequestModel;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    registerRequestModel = UserDetails();
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
    // registerRequestModel.id = ;

    var data = "http://172.29.1.208:2016/api/CustomerDetails/2";
    var api = getData();
    var apiData = api.fetchUsers(data);
    late Future<List<User>> listUsers;
    listUsers = apiData;

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: Text("hello")),
          body: FutureBuilder<List<User>>(
            future: listUsers,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.separated(
                    itemBuilder: (context, index) {
                      var user = (snapshot.data as List<User>)[index];
                      return Container(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //    Text("${user.userProfile.eAUTOCUSTOMERID}"),
                              //    Text("${user.userProfile.eAUTOCUSTOMERNAME}"),

                              Stack(
                                children: <Widget>[
                                  Container(
                                    width: double.infinity,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 30, horizontal: 20),
                                    margin: EdgeInsets.symmetric(
                                        vertical: 85, horizontal: 20),
                                    decoration: BoxDecoration(
                                      // borderRadius: BorderRadius.circular(20),
                                      // color: Theme.of(context).primaryColor,
                                      boxShadow: [
                                        BoxShadow(
                                            color: Theme.of(context)
                                                .hintColor
                                                .withOpacity(0.2),
                                            offset: Offset(0, 10),
                                            blurRadius: 20)
                                      ],
                                    ),
                                    child: Form(
                                      child: Column(
                                        children: <Widget>[
                                          SizedBox(height: 25),
                                          Text(
                                            "User Detail",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline2,
                                          ),
                                          const SizedBox(height: 20),
                                          TextFormField(
                                            initialValue:
                                                user.userProfile.firstName,
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            onSaved: (input) =>
                                                registerRequestModel.FirstName =
                                                    input,
                                            decoration: InputDecoration(
                                              // labelText: "${user.userProfile.firstName}",
                                              hintText: "First Name",
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color:
                                                              Theme.of(context)
                                                                  .colorScheme
                                                                  .secondary
                                                                  .withOpacity(
                                                                      0.2))),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color:
                                                              Theme.of(context)
                                                                  .colorScheme
                                                                  .secondary)),
                                              prefixIcon: Icon(
                                                Icons.no_meals,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .secondary,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 20),
                                          TextFormField(
                                            initialValue:
                                                user.userProfile.lastName,
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .secondary),
                                            keyboardType: TextInputType.text,
                                            onSaved: (input) =>
                                                registerRequestModel.LastName =
                                                    input,
                                            // validator: (input) => input.length < 3
                                            //     ? "Password should be more than 3 characters"
                                            //     : null,
                                            obscureText: hidePassword,
                                            decoration: InputDecoration(
                                              hintText: "Last name",
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color:
                                                              Theme.of(context)
                                                                  .colorScheme
                                                                  .secondary
                                                                  .withOpacity(
                                                                      0.2))),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color:
                                                              Theme.of(context)
                                                                  .colorScheme
                                                                  .secondary)),
                                              prefixIcon: Icon(
                                                Icons.lock,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .secondary,
                                              ),
                                              suffixIcon: IconButton(
                                                onPressed: () {
                                                  setState(() {
                                                    hidePassword =
                                                        !hidePassword;
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
                                          const SizedBox(height: 30),
                                          TextFormField(
                                            initialValue:
                                                user.userProfile.email,
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .secondary),
                                            keyboardType: TextInputType.text,
                                            onSaved: (input) =>
                                                registerRequestModel.email =
                                                    input,
                                            validator: (input) => input!
                                                    .contains('@')
                                                ? "Password should be more than 3 characters"
                                                : null,
                                            obscureText: hidePassword,
                                            decoration: InputDecoration(
                                              hintText: "email",
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color:
                                                              Theme.of(context)
                                                                  .colorScheme
                                                                  .secondary
                                                                  .withOpacity(
                                                                      0.2))),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color:
                                                              Theme.of(context)
                                                                  .colorScheme
                                                                  .secondary)),
                                              prefixIcon: Icon(
                                                Icons.lock,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .secondary,
                                              ),
                                              suffixIcon: IconButton(
                                                onPressed: () {
                                                  setState(() {
                                                    hidePassword =
                                                        !hidePassword;
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
                                          const SizedBox(height: 30),
                                          TextFormField(
                                            initialValue:
                                                user.userProfile.password,
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .secondary),
                                            keyboardType: TextInputType.text,
                                            onSaved: (input) =>
                                                registerRequestModel.password =
                                                    input,
                                            // validator: (input) => input.length < 3
                                            //     ? "Password should be more than 3 characters"
                                            //     : null,
                                            obscureText: hidePassword,
                                            decoration: InputDecoration(
                                              hintText: "password",
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color:
                                                              Theme.of(context)
                                                                  .colorScheme
                                                                  .secondary
                                                                  .withOpacity(
                                                                      0.2))),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color:
                                                              Theme.of(context)
                                                                  .colorScheme
                                                                  .secondary)),
                                              prefixIcon: Icon(
                                                Icons.lock,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .secondary,
                                              ),
                                              // suffixIcon: IconButton(
                                              //   onPressed: () {
                                              //     setState(() {
                                              //       hidePassword =
                                              //           !hidePassword;
                                              //     });
                                              //   },
                                              //   color: Theme.of(context)
                                              //       .colorScheme
                                              //       .secondary
                                              //       .withOpacity(0.4),
                                              //   icon: Icon(hidePassword
                                              //       ? Icons.visibility_off
                                              //       : Icons.visibility),
                                              // ),
                                            ),
                                          ),
                                          SizedBox(height: 30),
                                          FlatButton(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 12, horizontal: 80),
                                            onPressed: () {
                                              print("user page");
                                              if (true) {
                                                setState(() {
                                                  isApiCallProcess = false;
                                                });

                                                APIService apiService =
                                                    APIService();
                                                apiService
                                                    .user(registerRequestModel)
                                                    .then((value) {
                                                  print(value);
                                                  // if (value != null) {
                                                  //   setState(() {
                                                  //     isApiCallProcess = false;
                                                  //   });

                                                  //   if (value) {
                                                  //     final snackBar = SnackBar(
                                                  //         content: const Text(
                                                  //             "register Successful"));
                                                  //     scaffoldKey.currentState
                                                  //         ?.showSnackBar(
                                                  //             snackBar);
                                                  //   } else {
                                                  //     final snackBar = SnackBar(
                                                  //         content: Text(
                                                  //             "unable to register"));
                                                  //     scaffoldKey.currentState
                                                  //         ?.showSnackBar(
                                                  //             snackBar);
                                                  //   }
                                                  // }
                                                });
                                              }
                                            },
                                            // ================
                                            child: Text(
                                              "Save",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                          SizedBox(height: 15),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ]),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const Divider();
                    },
                    itemCount: (snapshot.data as List<User>).length);
              } else if (snapshot.hasError) {
                return Center(child: Text('${snapshot.error}'));
              }
              return const Center(
                child: CircularProgressIndicator(
                    backgroundColor: Colors.cyanAccent),
              );
            },
          )),
    );
  }
}
