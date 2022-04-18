import 'package:flutter/material.dart';

class contactpage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[50],
        appBar: AppBar(
          backgroundColor: Colors.amber,
          elevation: 0,
          title: const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              ' ',
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
          ),
        ),
        body: Container(child: contactpage()),
      ),
    );
  }
}

class contactpage extends StatelessWidget {
  const contactpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              top: BorderSide(
        color: Color.fromARGB(255, 197, 197, 197),
        width: 1.0,
        style: BorderStyle.solid,
      ))),
      child: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                'Contact Us',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Gulf Commercial Group Enterprise Solutions',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      wordSpacing: 1.0,
                      fontSize: 15,
                    )),
                SizedBox(
                  height: 05,
                ),
                Text(
                  'Established in 1982, The Digital Imaging & Office Services Solutions of Gulf Commercial Group was created to lead the Office Automation Solutions sector in the thriving UAE market. Today, GCG Enterprise Solutions delights an enviable list of distinguished clients with the most comprehensive portfolio of business information management technology in the region.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    wordSpacing: 1.0,
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '+971 4 5281000  ',
                      style: TextStyle(
                          fontSize: 16, color: Color.fromARGB(237, 54, 54, 54)),
                    ),
                    Text(
                      '(MONDAY - FRIDAY)',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.home_work_rounded,
                              size: 28,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'DUBAI OFFICE',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          'phone: +971 4 5281000',
                          style: TextStyle(
                            fontSize: 15.5,
                          ),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          'Fax: +971 4 239 4566',
                          style: TextStyle(
                            fontSize: 15.5,
                          ),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          'P.O. Box 25940,',
                          style: TextStyle(
                            fontSize: 15.5,
                          ),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          'Makeen Building, Airport',
                          style: TextStyle(
                            fontSize: 15.5,
                          ),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          'Road, Deira, Dubai',
                          style: TextStyle(
                            fontSize: 15.5,
                          ),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.email_sharp,
                              size: 18,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'info@gcg.ae',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.home_work_rounded,
                              size: 28,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'ABU DHABI OFFICE',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'phone: +971 2 2014 999',
                          style: TextStyle(
                            fontSize: 15.5,
                          ),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          'Fax: +971 2 645 6483',
                          style: TextStyle(
                            fontSize: 15.5,
                          ),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          'P.O. Box 47257,',
                          style: TextStyle(
                            fontSize: 15.5,
                          ),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          'Shaheen Tower Building,',
                          style: TextStyle(
                            fontSize: 15.5,
                          ),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          'Abu Dubai',
                          style: TextStyle(
                            fontSize: 15.5,
                          ),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.email_sharp,
                              size: 18,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'info@mps-uae.com',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
