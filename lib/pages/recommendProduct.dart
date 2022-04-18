import 'package:flutter/material.dart';
import '../constant.dart';
import '../model/product.dart';
import 'productCard.dart';

class RecommandProducts extends StatelessWidget {
  const RecommandProducts({
    Key? key,
    this.products,
  }) : super(key: key);

  final List<productApi>? products;

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize!;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(defaultSize * 2), //20
        child: GridView.builder(
          shrinkWrap: true,
          itemCount: 10,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount:
                SizeConfig.orientation == Orientation.portrait ? 2 : 4,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 0.693,
          ),
          itemBuilder: (context, index) => ProductCard(

              product: products![index],
              press: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => DetailsScreen(
                //         product: products[index],
                //       ),
                //     ));
              }),
        ),
      ),
    );
  }
}
