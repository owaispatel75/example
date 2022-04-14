// // ignore_for_file: camel_case_types, use_key_in_widget_constructors, prefer_typing_uninitialized_variables, avoid_types_as_parameter_names, avoid_unnecessary_containers, prefer_const_constructors, unused_element

// import 'package:flutter/material.dart';
// import '../api/All_get_api.dart';
// import '../api/Login_api_services.dart';
// import '../model/user.dart';
// import 'package:http/http.dart' as http;

// import 'login_register_userdetail/UserDetail.dart';

// class orderEnquiry extends StatefulWidget {
//   @override
//   State<orderEnquiry> createState() => _orderEnquiryState();
// }

// class _orderEnquiryState extends State<orderEnquiry> {
//   // late Future<List<User>> listUsers;
//   // Future<List<User>> fetchUsers() async {
//   //   // print(newValue);
//   //   // var response_data = APIService.response;
//   //   // var id_Value = APIService.idValue(response_data);
//   //   var url = "http://172.29.1.208:2016/api/CustomerDetails/47";
//   //   var response = await Dio().get(url);
//   //   if (response.statusCode == 200) {
//   //     var getUsersData = response.data as List;
//   //     var listUsers = getUsersData.map((i) {
//   //       return User.fromJson(i);
//   //     }).toList();
//   //     return listUsers;
//   //   } else {
//   //     throw Exception('Failed to load users');
//   //   }
//   // }
//   // @override
//   // void initState() {
//   //   super.initState();
//   //   listUsers = fetchUsers();
//   // }

//   @override
//   Widget build(BuildContext context) {
//     // var newValue = APIService.response;
//     // var maindata = APIService.idValue(newValue);
//     // print(maindata);
//     var data = "http://172.29.1.208:2016/api/CustomerDetails/47";
//     var api = getData();
//     var apiData = api.fetchUsers(data);

//     return MaterialApp(
//       home: Scaffold(
//           appBar: AppBar(title: Text("hello")),
//           drawer: FutureBuilder<List<User>>(
//             future: apiData,
//             builder: (context, snapshot) {
//               if (snapshot.hasData) {
//                 return Drawer(
//                   child: ListView(
//                     padding: EdgeInsets.zero,
//                     children: [
//                       DrawerHeader(
//                         decoration: BoxDecoration(
//                           color: Colors.blue,
//                         ),
//                         child: ListView(children: [
//                           Text("${snapshot.data![0].userProfile.email}"),
//                           Text("${snapshot.data![0].userProfile.firstName +" "+ snapshot.data![0].userProfile.lastName}"),
//                         ]),
//                       ),
//                       ListTile(
//                         title: const Text('User detail udpdate'),
//                         onTap: () {
//                           Navigator.of(context).pushReplacement(
//                               MaterialPageRoute(
//                                   builder: (context) => UserDetailPage()));
//                         },
//                       ),
//                     ],
//                   ),
//                 );
//               }
//               return const Center(
//                 child: CircularProgressIndicator(
//                     backgroundColor: Colors.cyanAccent),
//               );
//             },
//           ),
//           body: FutureBuilder<List>(
//             future: apiData,
//             builder: (context, snapshot) {
//               if (snapshot.hasData) {
//                 return ListView.separated(
//                     itemBuilder: (context, index) {
//                       var user = (snapshot.data as List<User>)[index];
//                       // print("hello");
//                       // print(user);
//                       final userList = user.userAddresses!.addresses as List;
//                       final userOrderlist = user.userOrder!.orders as List;
//                       final Inovicelist = user.userinvoices!.invoices as List;
//                       final userShipment = user.userShipment!.oShipment as List;

//                       return Container(
//                         padding: const EdgeInsets.all(10),
//                         child: Column(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 'User Profile',
//                                 textScaleFactor: 2,
//                               ),
//                               Text("${user.userProfile.customerId}"),
//                               Text("${user.userProfile.firstName}"),
//                               Text("${user.userProfile.lastName}"),
//                               Text("${user.userProfile.password}"),
//                               Text("${user.userProfile.cUSTOMERCREATIONDATE}"),
//                               Text("${user.userProfile.cUSTOMERNAME}"),
//                               Text("${user.userProfile.rEMARKS1}"),
//                               Text("${user.userProfile.storeId}"),
//                               Text("${user.userProfile.cUSTOMERNUMBER}"),
//                               Text("${user.userProfile.eAUTOCUSTOMERID}"),
//                               Text("${user.userProfile.eAUTOCUSTOMERNAME}"),
//                               // ignore: prefer_const_constructors
//                               SizedBox(
//                                 height: 20,
//                               ),
//                               Text(
//                                 'User orders',
//                                 textScaleFactor: 2,
//                               ),
//                               Container(
//                                 child: Column(
//                                     children: userOrderlist.map((e) {
//                                   // print(e != null);
//                                   // if (e != null) {
//                                   //   data = e.map((k, v) {
//                                   //     return MapEntry(k,v);
//                                   //   });
//                                   // }
//                                   return Card(
//                                     child: Column(
//                                       mainAxisSize: MainAxisSize.min,
//                                       children: <Widget>[
//                                         ListTile(
//                                           leading: Text('${e.orderId}'),
//                                           title: Text("${e.orderNumber}"),
//                                           subtitle: Text(
//                                               '${e.paymentMethodSystemName}'),
//                                         ),
//                                         Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.end,
//                                           children: <Widget>[
//                                             TextButton(
//                                               child: Text('${e.paymentStatus}'),
//                                               onPressed: () {/* ... */},
//                                             ),
//                                             const SizedBox(width: 8),
//                                             TextButton(
//                                               child: Text('${e.items}'),
//                                               onPressed: () {/* ... */},
//                                             ),
//                                             const SizedBox(width: 8),
//                                           ],
//                                         ),
//                                       ],
//                                     ),
//                                   );
//                                 }).toList()),
//                               ),
//                               Text(
//                                 'User Addresses',
//                                 textScaleFactor: 2,
//                               ),
//                               Container(
//                                 child: Column(
//                                     children: userList.map((e) {
//                                   // print(e != null);
//                                   // if (e != null) {
//                                   //   data = e.map((k, v) {
//                                   //     return MapEntry(k,v);
//                                   //   });
//                                   // }
//                                   return Card(
//                                     child: Column(
//                                       mainAxisSize: MainAxisSize.min,
//                                       children: <Widget>[
//                                         ListTile(
//                                           leading:
//                                               Text('${e.customerAddressId}'),
//                                           title: Text(
//                                               "${e.cUSTSITEUSESUPDATEDATE}"),
//                                           subtitle: Text('${e.address}'),
//                                         ),
//                                         Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.end,
//                                           children: <Widget>[
//                                             TextButton(
//                                               child: Text('${e.firstName}'),
//                                               onPressed: () {/* ... */},
//                                             ),
//                                             const SizedBox(width: 8),
//                                             TextButton(
//                                               child: Text('${e.email}'),
//                                               onPressed: () {/* ... */},
//                                             ),
//                                             const SizedBox(width: 8),
//                                           ],
//                                         ),
//                                       ],
//                                     ),
//                                   );
//                                 }).toList()),
//                               ),

//                               Text(
//                                 'User invoices',
//                                 textScaleFactor: 2,
//                               ),
//                               Container(
//                                 child: Column(
//                                     children: Inovicelist.map((e) {
//                                   // print(e != null);
//                                   // if (e != null) {
//                                   //   data = e.map((k, v) {
//                                   //     return MapEntry(k,v);
//                                   //   });
//                                   // }
//                                   return Card(
//                                     child: Column(
//                                       mainAxisSize: MainAxisSize.min,
//                                       children: <Widget>[
//                                         ListTile(
//                                           leading: Text('${e.invoiceId}'),
//                                           title: Text("${e.invoiceNumber}"),
//                                           subtitle: Text('${e.invoiceType}'),
//                                         ),
//                                         Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.end,
//                                           children: <Widget>[
//                                             TextButton(
//                                               child: Text('${e.batchSource}'),
//                                               onPressed: () {/* ... */},
//                                             ),
//                                             const SizedBox(width: 8),
//                                             TextButton(
//                                               child: Text('${e.lines}'),
//                                               onPressed: () {/* ... */},
//                                             ),
//                                             const SizedBox(width: 8),
//                                           ],
//                                         ),
//                                       ],
//                                     ),
//                                   );
//                                 }).toList()),
//                               ),

//                               Text(
//                                 'User Shipment',
//                                 textScaleFactor: 2,
//                               ),
//                               Container(
//                                 child: Column(
//                                     children: userShipment.map((e) {
//                                   // print(e != null);
//                                   // if (e != null) {
//                                   //   data = e.map((k, v) {
//                                   //     return MapEntry(k,v);
//                                   //   });
//                                   // }
//                                   return Card(
//                                     child: Column(
//                                       mainAxisSize: MainAxisSize.min,
//                                       children: <Widget>[
//                                         ListTile(
//                                           leading: Text('${e.dELIVERYID}'),
//                                           title: Text("${e.dELIVERYID}"),
//                                           subtitle: Text('${e.cREATIONDATE}'),
//                                         ),
//                                         Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.end,
//                                           children: <Widget>[
//                                             TextButton(
//                                               child: Text('${e.cUSTOMERNAME}'),
//                                               onPressed: () {/* ... */},
//                                             ),
//                                             const SizedBox(width: 8),
//                                             TextButton(
//                                               child: Text('${e.shipToAddress}'),
//                                               onPressed: () {/* ... */},
//                                             ),
//                                             const SizedBox(width: 8),
//                                           ],
//                                         ),
//                                       ],
//                                     ),
//                                   );
//                                 }).toList()),
//                               ),
//                             ]),
//                       );
//                     },
//                     separatorBuilder: (context, index) {
//                       return const Divider();
//                     },
//                     itemCount: (snapshot.data as List<User>).length);
//               } else if (snapshot.hasError) {
//                 return Center(child: Text('${snapshot.error}'));
//               }
//               return const Center(
//                 child: CircularProgressIndicator(
//                     backgroundColor: Colors.cyanAccent),
//               );
//             },
//           )),
//     );
//   }
// }
