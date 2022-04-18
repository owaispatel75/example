// ignore_for_file: deprecated_member_use, camel_case_types


import 'package:flutter/material.dart';

import '../api/All_get_api.dart';
import '../model/user.dart';

class Contact_Address extends StatefulWidget {
  const Contact_Address({Key? key}) : super(key: key);

  @override
  State<Contact_Address> createState() => _Contact_AddressState();
}

class _Contact_AddressState extends State<Contact_Address> {
  @override
  Widget build(BuildContext context) {
    var data = "http://172.29.1.208:2016/api/CustomerDetails/47";
    var api = getData();
    var apiData = api.fetchUsers(data);

    return Container(
      margin: const EdgeInsets.all(20),
      child: Column(children: [
         const Text(
          'Contacts',
          style: TextStyle(
            fontSize: 30,
            color: Color.fromARGB(255, 0, 0, 0),
          ), //Textstyle
        ), //Text
        Card(
          clipBehavior: Clip.antiAlias,
          child: FutureBuilder<List<User>>(
              future: apiData,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                 return  Column(
                    children:  [
                      ListTile(
                        title: Text('SR.NO : ${snapshot.data![0].userProfile.storeId}'),
                        
                      ),
                      ListTile(
                        title: Text('FIRST NAME : ${snapshot.data![0].userProfile.firstName}'),
                      ),
                      ListTile(
                        title:  Text('LAST NAME : ${snapshot.data![0].userProfile.lastName}'),
                      ),
                      ListTile(
                        title:  Text('PHONE NUMBER : ${snapshot.data![0].userProfile.phone}'),
                      ),
                      ListTile(
                        title:  Text('EMAIL : ${snapshot.data![0].userProfile.email}'),
                      ),
                    ],
                  );
                }

                  return const Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.red,
                  ),
                );
              }),
        ),
      ]),
    );
  }
}
