import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';


import '../../api/All_get_api.dart';
import '../../model/orders.dart';
import '../../model/user.dart';

class DetailsPage extends StatefulWidget {
  final itemIndex;

  const DetailsPage({
    Key? key,
    required this.itemIndex,
  }) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    var value = widget.itemIndex;

    var data = "http://172.29.1.208:2016/api/CustomerDetails/47";
    var api = getData();
    var apiData = api.fetchUsers(data);

    var _screenheight = MediaQuery.of(context).size.height;
    var _screenwidth = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          /*title: Text(
              "Enquiry Detail Page",
              textScaleFactor: 1.2,
            )*/
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black26)),
                margin: const EdgeInsets.only(
                    top: 20, left: 10, right: 10, bottom: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        MaterialButton(
                          elevation: 0.2,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Back to Enquiry list',
                            style: TextStyle(fontSize: 10),
                          ),
                          color: Colors.grey[200],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10, left: 15, bottom: 10),
                          child: Text(
                            "Enquiry",
                            // "${this.widget.itemIndex.userOrderlist.ordername}",

                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                                color: const Color.fromARGB(199, 26, 26, 26)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 15, right: 15, bottom: 10),
                          child: Row(
                            children: [
                              Text(
                                "On Date :",
                                // textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromARGB(197, 73, 73, 73)),
                              ),
                              Text(
                                " 27/-03-2022",
                                // textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                    color:
                                        const Color.fromARGB(199, 26, 26, 26)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                          border: const Border(
                              top: const BorderSide(
                                  width: 1.0, color: Colors.black26))),
                      child: FutureBuilder<List<User>>(
                          future: apiData,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return DataTable2(
                                  columnSpacing: 15,
                                  horizontalMargin: 20,
                                  minWidth: 580,
                                  dataRowHeight: 70,
                                  columns: const [
                                    DataColumn2(
                                      label: Text(
                                        'Product',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(
                                                199, 26, 26, 26)),
                                      ),
                                      size: ColumnSize.L,
                                    ),
                                    DataColumn2(
                                      label: Text(
                                        'Description',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(
                                                199, 26, 26, 26)),
                                      ),
                                      size: ColumnSize.L,
                                    ),
                                    DataColumn2(
                                      label: Text(
                                        'Quantity',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(
                                                199, 26, 26, 26)),
                                      ),
                                      size: ColumnSize.M,
                                      //numeric: true,
                                    ),
                                    /*  DataColumn2(
                                      label: Text(
                                        'index Value',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(
                                                199, 26, 26, 26)),
                                      ),
                                      size: ColumnSize.S,
                                      //numeric: true,
                                    ),*/
                                  ],
                                  rows: List<DataRow>.generate(
                                      snapshot
                                          .data![0]
                                          .userOrder!
                                          .orders![value]
                                          .items!
                                          .length, (index) {
                                    var user = (snapshot.data as List<User>)[0];
                                    final userOrderlist = user.userOrder!
                                        .orders![index].items as List<Items>;

                                    return DataRow2(
                                        color:
                                            MaterialStateProperty.resolveWith(
                                                (states) => states.contains(
                                                        MaterialState.hovered)
                                                    ? Colors.amber
                                                    : index % 2 == 0
                                                        ? const Color.fromARGB(
                                                            255, 252, 252, 252)
                                                        : const Color.fromARGB(
                                                            255,
                                                            228,
                                                            228,
                                                            228)),
                                        cells: [
                                          DataCell(
                                            Text('${userOrderlist[index].name}',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                )),
                                          ),
                                          DataCell(Text(
                                              '${userOrderlist[index].oDESCRIPTION}',
                                              style: TextStyle(
                                                fontSize: 14,
                                              ))),
                                          DataCell(Text(
                                              '${userOrderlist[index].total}-items',
                                              style: TextStyle(
                                                fontSize: 14,
                                              ))),
                                          // DataCell(Text('${index}')),
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
                            padding: const EdgeInsets.only(top: 10, left: 10),
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
                            padding: const EdgeInsets.only(left: 10),
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
                                const EdgeInsets.only(left: 10, bottom: 20),
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
                child: Column(children: [
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
                            padding: const EdgeInsets.only(top: 10, left: 10),
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
                            padding: const EdgeInsets.only(left: 10),
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
                                const EdgeInsets.only(left: 10, bottom: 20),
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
