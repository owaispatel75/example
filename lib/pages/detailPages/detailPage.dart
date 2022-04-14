import 'package:flutter/material.dart';
import 'package:gcg_ec/model/product.dart';
import '../../model/user.dart';



class DetailsPage extends StatefulWidget {
  final productApi item;

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
            // Text(
            //   widget.item.userProfile.lastName,
            //   style: const TextStyle(color: Colors.black),
            // ),
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
                style: TextStyle(color: Colors.black,fontSize: 18),
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
            //   widget.item.userProfile,
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
