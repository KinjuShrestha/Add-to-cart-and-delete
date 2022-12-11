import 'package:flutter/material.dart';
import 'package:mobgrocery/Jewlery/Entity/jewlery.dart';

Widget richText(String title, String textBody, double size) {
  return RichText(
      text: TextSpan(
          text: title,
          style: TextStyle(
              color: Colors.pink, fontWeight: FontWeight.bold, fontSize: size),
          children: [
        TextSpan(
            text: textBody,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w200,
                fontSize: size))
      ]));
}

class CollectCustomizedCard extends StatelessWidget {
  CollectCustomizedCard(
      {Key? key,
      required this.jewleryData,
      this.deletebutton,
      this.editbutton,
      this.height,
      this.width});
  final Jewlery jewleryData;
  final Function()? deletebutton;
  final Function()? editbutton;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return customBox();
  }

  Widget customBox() {
    return SizedBox(
      height: double.infinity,
      child: Card(
          elevation: 5,
          shadowColor: Colors.black,
          color: Colors.white,
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Flex(direction: Axis.vertical, children: [
                Image.network(
                  "${jewleryData.image}",
                  width: width,
                  height: height,
                ),
                Divider(),
                Flexible(
                    child:
                        richText("Title ", jewleryData.title.toString(), 10)),
                //Divider( ),

                Flexible(
                    child:
                        richText("Price ", jewleryData.price.toString(), 10)),

                Flexible(
                    child: richText(
                        "Category ", jewleryData.category.toString(), 10)),
                Flexible(
                  flex: 1,
                  child: richText(
                      "Description ", jewleryData.description.toString(), 10),
                ),
                // IconButton(
                //     onPressed: editbutton,
                //     icon: Icon(Icons.shopping_cart_sharp))
              ]))),
    );
  }
}

class CollectCartCard extends StatelessWidget {
  CollectCartCard({Key? key, required this.item, this.height, this.width});
  final Jewlery item;

  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return customBox();
  }

  Widget customBox() {
    return SizedBox(
      height: height,
      //MediaQuery.of(context).size.height * 0.15,
      child: Card(
        color: Colors.white,
        borderOnForeground: true,
        elevation: 5,
        child: Flex(direction: Axis.vertical, children: [
          Image.network(
            item.image.toString(),
            height: 50,
            width: width,
            // width: MediaQuery.of(context).size.width,
          ),

          richText("Title ", item.title.toString(), 10),
          //Divider( ),

          richText("Price ", item.price.toString(), 10),

          richText("Category ", item.category.toString(), 10),
          richText("Quantity ", item.quantity.toString(), 10),
        ]),
      ),
    );
  }
}

showSnackBarr(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
}
