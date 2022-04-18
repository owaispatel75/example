// ignore_for_file: prefer_typing_uninitialized_variables, unused_local_variable

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import '../../api/All_get_api.dart';
import '../../model/invoices.dart';
import '../../model/orders.dart';
import '../../model/user.dart';

class InvoiceClosedDetail extends StatefulWidget {
  final int itemIndex;

  const InvoiceClosedDetail({
    Key? key,
    required this.itemIndex,
  }) : super(key: key);

  @override
  State<InvoiceClosedDetail> createState() => _InvoiceClosedDetailState();
}

class _InvoiceClosedDetailState extends State<InvoiceClosedDetail> {
  @override
  Widget build(BuildContext context) {
    var value = widget.itemIndex;

    var data = "http://172.29.1.208:2016/api/CustomerDetails/121";
    var api = getData();
    var apiData = api.fetchUsers(data);

    var _screenheight = MediaQuery.of(context).size.height;
    var _screenwidth = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MaterialButton(
                          elevation: 0.2,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Back to Invoices',
                            style: TextStyle(fontSize: 10),
                          ),
                          color: Colors.grey[200],
                        ),
                        MaterialButton(
                          elevation: 0.2,
                          onPressed: () {},
                          child: Text(
                            'Print Invoice',
                            style: TextStyle(fontSize: 10),
                          ),
                          color: Colors.grey[200],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 15.0, bottom: 10, right: 20, left: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Invoice Number Payment Term : ',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: const Color.fromARGB(199, 26, 26, 26)),
                          ),
                          Text('30 : 6521066011 24 DAYS FROM INVOICE DATE'),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Invoice Date : ',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: const Color.fromARGB(
                                            199, 26, 26, 26)),
                                  ),
                                  Text('28/06/2021'),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Invoice Due Date : ',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: const Color.fromARGB(
                                            199, 26, 26, 26)),
                                  ),
                                  Text('28/06/2021'),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Sales Order/Contract No : ',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: const Color.fromARGB(
                                            199, 26, 26, 26)),
                                  ),
                                  Text('41122954'),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Tax Rate : ',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: const Color.fromARGB(
                                            199, 26, 26, 26)),
                                  ),
                                  Text('5%'),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
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
                              var user = (snapshot.data as List<User>)[0];
                              final userInvoice =
                                  user.userinvoices!.invoices as List<Invoices>;
                              List<Invoices> closedlist = [];
                              for (var k in userInvoice) {
                                if (k.amountDueRemaining != 0) {
                                  closedlist.add(k);
                                }
                              }
                              return DataTable2(
                                  columnSpacing: 15,
                                  horizontalMargin: 20,
                                  minWidth: 1200,
                                  dataRowHeight: 40,
                                  headingRowHeight: 75,
                                  smRatio: 0.47,
                                  lmRatio: 2.8,
                                  columns: const [
                                    DataColumn2(
                                      label: Text('SR\nNO.',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromARGB(
                                                  199, 26, 26, 26))),
                                      size: ColumnSize.S,
                                    ),
                                    DataColumn2(
                                      label: Text('DESCRIPTION',
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color:
                                                Color.fromARGB(199, 26, 26, 26),
                                          )),
                                      size: ColumnSize.L,
                                    ),
                                    DataColumn2(
                                      label: Text('QTY',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromARGB(
                                                  199, 26, 26, 26))),
                                      size: ColumnSize.S,
                                    ),
                                    DataColumn2(
                                      label: Text('UNIT \nSELLING \nPRICE',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromARGB(
                                                  199, 26, 26, 26))),
                                      size: ColumnSize.S,
                                    ),
                                    DataColumn2(
                                      label: Text('TAX \n RATE',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromARGB(
                                                  199, 26, 26, 26))),
                                      size: ColumnSize.S,
                                    ),
                                    DataColumn2(
                                      label: Text('AMOUNT',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromARGB(
                                                  199, 26, 26, 26))),
                                      size: ColumnSize.S,
                                    ),
                                    DataColumn2(
                                      label: Text('TAX \nAMOUNT',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromARGB(
                                                  199, 26, 26, 26))),
                                      size: ColumnSize.S,
                                    ),
                                    DataColumn2(
                                      label: Text('TOTAL',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromARGB(
                                                  199, 26, 26, 26))),
                                      size: ColumnSize.S,
                                    ),
                                    DataColumn2(
                                      label: Text('SALES\nORDER',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromARGB(
                                                  199, 26, 26, 26))),
                                      size: ColumnSize.S,
                                    ),
                                  ],
                                  rows: List<DataRow>.generate(
                                      closedlist[value].lines!.length, (index) {
                                    var user = (snapshot.data as List<User>)[0];
                                    final userInvoicelist = user.userinvoices!
                                        .invoices![index].lines as List<Lines>;

                                    return DataRow(cells: [
                                      DataCell(
                                        Text('01',
                                            style: TextStyle(
                                              fontSize: 14,
                                            )),
                                      ),
                                      DataCell(Text(
                                          '${closedlist[value].lines![index].oDESCRIPTION}',
                                          style: TextStyle(
                                            fontSize: 14,
                                          ))),
                                      DataCell(Text(
                                          '${closedlist[value].lines![index].quantity}',
                                          style: TextStyle(
                                            fontSize: 14,
                                          ))),
                                      DataCell(Text(
                                          '${closedlist[value].lines![index].unitSellingPrice}',
                                          style: TextStyle(
                                            fontSize: 14,
                                          ))),
                                      DataCell(Text(
                                          '${closedlist[value].lines![index].taxRate}',
                                          style: TextStyle(
                                            fontSize: 14,
                                          ))),
                                      DataCell(Text(
                                          '${closedlist[value].lines![index].amount}',
                                          style: TextStyle(
                                            fontSize: 14,
                                          ))),
                                      DataCell(Text(
                                          '${closedlist[value].lines![index].taxAmount}',
                                          style: TextStyle(
                                            fontSize: 14,
                                          ))),
                                      DataCell(Text(
                                          '${closedlist[value].lines![index].total}',
                                          style: TextStyle(
                                            fontSize: 14,
                                          ))),
                                      DataCell(Text(
                                          '${closedlist[value].lines![index].salesOrder}',
                                          style: TextStyle(
                                            fontSize: 14,
                                          ))),
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
            ],
          ),
        ),
      ),
    );
  }
}
