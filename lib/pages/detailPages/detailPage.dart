import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:gcg_ec/model/cart_model.dart';
import 'package:gcg_ec/model/product.dart';
import 'package:gcg_ec/pages/counter.dart';
import 'package:gcg_ec/pages/mycart.dart';


import 'package:flutter/material.dart';




import '../../model/user.dart';

//import 'package:getwidget/components/button/gf_button.dart';
//import 'package:google_fonts/google_fonts.dart';
//import 'package:shoes_shop_ui/models/cart_model.dart';

//import 'package:shoes_shop_ui/consts.dart';
//import 'package:shoes_shop_ui/models/shoes_model.dart';

//import 'package:shoes_shop_ui/pages/itemcounter.dart';

//import 'my_favorite.dart';


class detailsPage extends StatefulWidget {
  final productApi item;
  
  const detailsPage({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  State<detailsPage> createState() => _detailsPageState();
}

class _detailsPageState extends State<detailsPage> {
  List<CartModel> boughtitems = [];
  int value = 0;
  double total = 0.00;
  //var index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.amber,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            'shop',
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MyCart()));
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 12, right: 20),
              child: Row(
                children: [
                  const Icon(
                    Icons.shopping_cart,
                    color: Colors.black,
                    size: 28,
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                /*  Text(
                    'Pay',
                    style: TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w900, color: Colors.black),
                  ) */
                ],
              ),
            ),
          ),
       /*   GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MyFavorite()));

              // Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 12, right: 40),
              child: favouriteitems.isNotEmpty
                  ? Badge(
                      badgeContent: Text(
                        favouriteitems.length.toString(),
                        style: style.copyWith(
                            fontSize: 10,
                            fontWeight: FontWeight.w900,
                            color: white),
                      ),
                      child: const Icon(
                        Icons.favorite,
                        color: Colors.black,
                        size: 28,
                      ),
                    )
                  : const Icon(
                      Icons.favorite,
                      color: Colors.black,
                      size: 28,
                    ),
            ),
          ), */
        ],
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(children: [
            Column(
              children: [
                Card(
                  // elevation: 10,
                  margin: EdgeInsets.all(30.0),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: const Icon(
                                Icons.chevron_left,
                                color: Colors.white,
                                size: 36,
                              ),
                            ),
                            const Spacer(),
                           /* GestureDetector(
                              onTap: () {
                                setState(() {
                                  widget.item.isselected =
                                      !widget.item.isselected;

                                  widget.item.isselected
                                      ? favouriteitems.add(widget.item)
                                      : favouriteitems.remove(widget.item);
                                });
                              },
                              child: Icon(
                                Icons.favorite_sharp,
                                color:
                                    widget.item.isselected ? Colors.red : white,
                                size: 30,
                              ),
                            ) */
                          ],
                        ),

                         Image.network(
                          widget.item.imagePath.toString(),
                          fit: BoxFit.fill,
                          width: 100,
                          // height: 300,
                        ), 
                        Image.asset(
                          widget.item.imagePath.toString(),
                          //height: 100,
                          width: 250,
                          fit: BoxFit.cover,
                        ), 
                        Container(
                          height: 90,
                          width: 100,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                new BoxShadow(
                                    offset: Offset.zero,
                                    color: Color.fromARGB(99, 61, 61, 61),
                                    blurRadius: 10.0,
                                    blurStyle: BlurStyle.normal),
                              ],
                              border:
                                  Border.all(width: 0.3, color: Colors.grey)),
                          margin: EdgeInsets.only(right: 300),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Image.asset(
                              widget.item.imagePath.toString(),
                              //  height: 50,
                              // width: 50,
                              fit: BoxFit.contain,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              color: Colors.grey[50],
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(widget.item.iTEMCREATIONDATE.toString(),
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        )
                        //style.copyWith(color: Colors.black
                        ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      widget.item.shortDescription.toString(),
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      'Toner Color :' + ' ' + widget.item.bRAND,
                      style: TextStyle(fontSize: 12),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        counteritems(),
                        SizedBox(width: 20),
                        MaterialButton(
                          minWidth: 280.0,
                          color: Colors.amber,
                          padding: EdgeInsets.only(top: 17, bottom: 15),
                          elevation: 10,
                          onPressed: () {
                            if (boughtitems
                                .map((item) => item.name)
                                .contains(widget.item.iTEMDESCRIPTION)) {
                              final snackBar = SnackBar(
                                  backgroundColor: Colors.teal,
                                  duration: const Duration(seconds: 2),
                                  content: Text(
                                    'This Item is already added please go back and change it.',
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.white),
                                  ));
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            } else {
                              boughtitems.add(
                                CartModel(
                                  name: widget.item.iTEMDESCRIPTION.toString(),
                                  price: widget.item.pRODUCTTYPE,
                                  img: widget.item.imagePath.toString(),
                                  // tonercolor: widget.item.tonercolor,
                                  // color: widget.item.color,
                                  items: 1,
                                  //size: sizes[value],
                                ),
                              );
                              //total = total + widget.item;
                              Navigator.pop(context);
                            }
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.shopping_cart,
                                color: Colors.black,
                                size: 24,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text('Add To Cart',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ],
                          ),
                        ),
                        //SizedBox(width: 10),
                        IconButton(
                          icon: Icon(Icons.analytics_sharp),
                          iconSize: 50,
                          color: Colors.black38,
                          splashColor: Colors.white,
                          onPressed: () {},
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            /*    Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  GFButton(
                    onPressed: () {},
                    text: "Like",
                    icon: Icon(
                      Icons.facebook,
                    ),
                  ),
                  GFButton(
                    onPressed: () {},
                    text: "primary",
                    icon: Icon(
                      Icons.whatsapp,
                    ),
                  ),
                  GFButton(
                    onPressed: () {},
                    text: "primary",
                    icon: Icon(
                      Icons.pin,
                    ),
                  ),
                ],
              ),
            ),*/

            DefaultTabController(
              length: 4,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: TabBar(
                    indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.amber),
                    unselectedLabelColor: Colors.grey.shade800,
                    tabs: <Widget>[
                      Tab(
                        text: 'Description',
                      ),
                      Tab(
                        text: 'Specification',
                      ),
                      Tab(
                        text: 'Accesories',
                      ),
                      Tab(
                        text: 'Services',
                      )
                    ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Card(
                elevation: 10,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        alignment: AlignmentDirectional.topStart,
                        child: Text(
                          'Categories',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    ListTile(
                      minLeadingWidth: 0.5,
                      leading: Icon(
                        Icons.arrow_forward_ios_sharp,
                        size: 16,
                      ),
                      title: Text(
                        'Printers',
                        style: TextStyle(fontSize: 14),
                      ),
                      onTap: () {},
                    ),
                    ListTile(
                      minLeadingWidth: 0.5,
                      leading: Icon(Icons.arrow_forward_ios_sharp, size: 14),
                      title: Text('MFP', style: TextStyle(fontSize: 14)),
                      onTap: () {},
                    ),
                    ListTile(
                      minLeadingWidth: 0.5,
                      leading: Icon(Icons.arrow_forward_ios_sharp, size: 14),
                      title: Text('Toners', style: TextStyle(fontSize: 14)),
                      onTap: () {},
                    ),
                    ListTile(
                      minLeadingWidth: 0.5,
                      leading: Icon(Icons.arrow_forward_ios_sharp, size: 14),
                      title: Text('Sevice', style: TextStyle(fontSize: 14)),
                      onTap: () {},
                    ),
                    ExpansionTile(
                      childrenPadding: EdgeInsets.only(left: 25.0),
                      /* leading: Icon(
                        Icons.arrow_forward_ios_sharp,
                        size: 16,
                      ), */
                      tilePadding: EdgeInsets.only(left: 43.0),
                      title: Text('Printing Machine',
                          //textAlign: TextAlign.start,
                          style: TextStyle(fontSize: 14)),
                      children: [
                        ListTile(
                          minLeadingWidth: 0.5,
                          leading: Icon(Icons.circle_outlined, size: 10),
                          title:
                              Text('Printers', style: TextStyle(fontSize: 14)),
                          onTap: () {},
                        ),
                        ListTile(
                          minLeadingWidth: 0.5,
                          leading: Icon(Icons.circle_outlined, size: 10),
                          title: Text('MFP', style: TextStyle(fontSize: 14)),
                          onTap: () {},
                        ),
                        ListTile(
                          minLeadingWidth: 0.5,
                          leading: Icon(Icons.circle_outlined, size: 10),
                          title: Text('Production Printing',
                              style: TextStyle(fontSize: 14)),
                          onTap: () {},
                        ),
                      ],
                    ),
                    ListTile(
                      minLeadingWidth: 0.5,
                      leading: Icon(Icons.arrow_forward_ios_sharp, size: 14),
                      title: Text('Production Printing',
                          style: TextStyle(fontSize: 14)),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}








/*import 'package:flutter/material.dart';
import 'package:gcg_version_01/model/product.dart';
import 'package:gcg_version_01/pages/home.dart';

import '../../model/user.dart';

class DetailsPage extends StatefulWidget {
  final productApi item;
  //final User item;

  const DetailsPage({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  int value = 0;
  @override
  Widget build(BuildContext context) {
    var _screenheight = MediaQuery.of(context).size.height;
    var _screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black.withOpacity(.5),
                Colors.black.withOpacity(.0),
              ],
              begin: Alignment.bottomRight,
            ),
          ),
          child: Column(
            children: [
              _buildupperpart(
                  screenwidth: _screenwidth, screenheight: _screenheight),
              _buildbottompart(_screenheight)
            ],
          )),
    );
  }

  Expanded _buildbottompart(double _screenheight) {
    return Expanded(
        child: Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            /* Text(
              //widget.item.userProfile.lastName,
              style: const TextStyle(color: Colors.black),
            ), */
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Size',
              style: TextStyle(
                  fontWeight: FontWeight.w100,
                  fontSize: 20,
                  color: Colors.black),
            ),
            const SizedBox(
              height: 20,
            ),
            _buildsizes(),
            const SizedBox(
              height: 30,
            ),
            _buildbutton(_screenheight)
          ],
        ),
      ),
    ));
  }

  Flexible _buildbutton(double _screenheight) {
    return Flexible(
      fit: FlexFit.loose,
      child: Container(
        height: _screenheight * .08,
        width: double.maxFinite,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.red),
        child: MaterialButton(
          onPressed: () {
            // if (boughtitems
            //     .map((item) => item.name)
            //     .contains(widget.item.name)) {
            //   final snackBar = SnackBar(
            //       backgroundColor: Colors.teal,
            //       duration: const Duration(seconds: 2),
            //       content: Text(
            //         'This Item is already added please go back and change it.',
            //         style: style.copyWith(fontSize: 14, color: Colors.white),
            //       ));
            //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
            // } else {
            //   boughtitems.add(
            //     CartModel(
            //       name: widget.item.name,
            //       price: widget.item.price,
            //       img: widget.item.img,
            //       items: 1,
            //       size: sizes[value],
            //     ),
            //   );
            //   total = total + widget.item.price;
            //   Navigator.pop(context);
            // }
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.backpack,
                color: Colors.white,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Add To Cart',
                //style.copyWith(fontSize: 18, color: Colors.white)
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildupperpart(
      {required var screenwidth, required var screenheight}) {
    return Container(
      width: screenwidth,
      height: screenheight * .6,
      decoration: const BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 1),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          )),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.chevron_left,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    // setState(() {
                    //   widget.item.isselected = !widget.item.isselected;
                    //   // widget.item.isselected
                    //   //     ? favouriteitems.add(widget.item)
                    //   //     : favouriteitems.remove(widget.item);
                    // });
                  },
                  child: Icon(
                    Icons.favorite_sharp,
                    //  color: widget.item.isselected ? Colors.red : Colors.white,
                    size: 30,
                  ),
                )
              ],
            ),
            // Image.asset(
            //   widget.item.img,
            //   // height: 100,
            //   width: 200,
            //   fit: BoxFit.fill,
            // ),
          ],
        ),
      ),
    );
  }

  Widget _buildsizes() {
    return SizedBox(
        height: 40,
        width: 500,
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          children: [
            // _buildsizesitem(index: 0, title: sizes[0]),
            // _buildsizesitem(index: 1, title: sizes[1]),
            // _buildsizesitem(index: 2, title: sizes[2]),
            // _buildsizesitem(index: 3, title: sizes[3]),
            // _buildsizesitem(index: 4, title: sizes[4]),
          ],
        ));
  }

  Widget _buildsizesitem({required int index, required int title}) {
    return AspectRatio(
      aspectRatio: 1 / 1,
      child: GestureDetector(
        onTap: () {
          setState(() {
            value = index;
          });
        },
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              // color: value == index ? widget.item.color : Colors.transparent,
            ),
            child: Center(
                child: Text(
              title.toString(),
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w900,
                color: value == index ? Colors.white : Colors.black,
              ),
            )),
          ),
        ),
      ),
    );
  }
}
*/