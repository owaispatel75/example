import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gcg_ec/model/contact.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../api/All_get_api.dart';
import '../model/Oshipment.dart';
import '../model/user.dart';
import 'detailPages/shipmentdetails.dart';

class CompanyData extends StatefulWidget {
  const CompanyData({Key? key}) : super(key: key);

  @override
  State<CompanyData> createState() => _CompanyDataState();
}

class _CompanyDataState extends State<CompanyData> {
  @override
  Widget build(BuildContext context) {
    var data = "http://172.29.1.208:2016/api/CustomerDetails/121";
    var api = getData();
    var apiData = api.fetchUsers(data);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        appBar: AppBar(
          backgroundColor: Colors.amber,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    // borderRadius: BorderRadius.circular(0),
                    color: Colors.white, //Theme.of(context).primaryColor,
                    border: Border.all(color: Colors.black26)),
                margin: const EdgeInsets.only(
                    top: 20, left: 10, right: 10, bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 20),
                      child: Text(
                        "Contacts",
                        // textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            color: Color.fromARGB(199, 26, 26, 26)),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border(
                              top: BorderSide(
                                  width: 1.0, color: Colors.black26))),
                      child: FutureBuilder<List<User>>(
                          future: apiData,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return DataTable2(
                                  dataRowHeight: 60,
                                  columnSpacing: 20,
                                  horizontalMargin: 20,
                                  minWidth: 650,
                                  smRatio: 0.40,
                                  lmRatio: 2.8,
                                  columns: const [
                                    DataColumn2(
                                      label: Text(
                                        'SR\nNO.',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(
                                                199, 26, 26, 26)),
                                      ),
                                      size: ColumnSize.S,
                                    ),
                                    DataColumn2(
                                      label: Text(
                                        'FIRST\nName',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(
                                                199, 26, 26, 26)),
                                      ),
                                      size: ColumnSize.M,
                                    ),
                                    DataColumn2(
                                      label: Text(
                                        'LAST\nNAME',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(
                                                199, 26, 26, 26)),
                                      ),
                                      size: ColumnSize.M,
                                      // numeric: true,
                                    ),
                                    DataColumn2(
                                      label: Text(
                                        'PHONE\nNUMBER',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(
                                                199, 26, 26, 26)),
                                      ),
                                      size: ColumnSize.M,
                                      // numeric: true,
                                    ),
                                    DataColumn2(
                                      label: Text(
                                        'EMAIL',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(
                                                199, 26, 26, 26)),
                                      ),
                                      size: ColumnSize.L,
                                      // numeric: true,
                                    ),
                                  ],
                                  rows: List<DataRow>.generate(
                                      snapshot.data![0].userContact!.contacts!
                                          .length, (index) {
                                    var user = (snapshot.data as List<User>)[0];

                                    final userShipment = user.userContact!
                                        .contacts as List<Contacts>;

                                    return DataRow(
                                        color:
                                            MaterialStateProperty.resolveWith(
                                                (states) => states.contains(
                                                        MaterialState.hovered)
                                                    ? Colors.amber
                                                    : index % 2 == 0
                                                        ? Color.fromARGB(
                                                            255, 252, 252, 252)
                                                        : Color.fromARGB(255,
                                                            228, 228, 228)),
                                        cells: [
                                          DataCell(
                                            Text(
                                              '1',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500,
                                                  color: Color.fromARGB(
                                                      202, 38, 38, 38)),
                                            ),
                                          ),
                                          DataCell(Text(
                                            '${userShipment[index].firstName}'
                                                .toString(),
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                                color: Color.fromARGB(
                                                    202, 38, 38, 38)),
                                          )),
                                          DataCell(Text(
                                            '${userShipment[index].lastName}',
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                                color: Color.fromARGB(
                                                    202, 38, 38, 38)),
                                          )),
                                          DataCell(Text(
                                            '${userShipment[index].sITECONTACTPERSONPHONE}',
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                                color: Color.fromARGB(
                                                    202, 38, 38, 38)),
                                          )),
                                          DataCell(Text(
                                            '${userShipment[index].sITECONTACTPERSONEMAIL}',
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                                color: Color.fromARGB(
                                                    202, 38, 38, 38)),
                                          )),
                                        ]);
                                  }));
                            }
                            return const Center(
                              child: CircularProgressIndicator(
                                backgroundColor: Colors.red,
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black26)),
                margin: const EdgeInsets.only(
                    top: 5, left: 10, right: 10, bottom: 20),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      MaterialButton(
                        elevation: 0.2,
                        onPressed: () {},
                        child: Text(
                          'Shipping Address',
                          style: TextStyle(fontSize: 10),
                        ),
                        color: Colors.grey[200],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10, left: 20),
                            child: Text(
                              "United Arab Emirates Dubai",

                              // "${this.widget.itemIndex.userOrderlist.ordername}",

                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: const Color.fromARGB(199, 26, 26, 26)),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                              "Phone Number : ",
                              // "${this.widget.itemIndex.userOrderlist.ordername}",

                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(198, 45, 45, 45)),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 20, bottom: 20),
                            child: Text(
                              "Email Address : ",
                              // "${this.widget.itemIndex.userOrderlist.ordername}",

                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(198, 45, 45, 45)),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: FlatButton(
                              onPressed: () {},
                              child: Text(
                                'View',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(201, 63, 81, 181)),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ]),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black26)),
                margin: const EdgeInsets.only(
                    top: 5, left: 10, right: 10, bottom: 20),
                child: Column(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          MaterialButton(
                            elevation: 0.2,
                            onPressed: () {},
                            child: Text(
                              'Billing Address',
                              style: TextStyle(fontSize: 10),
                            ),
                            color: Colors.grey[200],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 10, left: 20),
                                child: Text(
                                  "United Arab Emirates Dubai",

                                  // "${this.widget.itemIndex.userOrderlist.ordername}",

                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: const Color.fromARGB(
                                          199, 26, 26, 26)),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Text(
                                  "Phone Number : ",
                                  // "${this.widget.itemIndex.userOrderlist.ordername}",

                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromARGB(198, 45, 45, 45)),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, bottom: 20),
                                child: Text(
                                  "Email Address : ",
                                  // "${this.widget.itemIndex.userOrderlist.ordername}",

                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromARGB(198, 45, 45, 45)),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 15),
                                child: FlatButton(
                                  onPressed: () {},
                                  child: Text(
                                    'View',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color:
                                            Color.fromARGB(201, 63, 81, 181)),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
