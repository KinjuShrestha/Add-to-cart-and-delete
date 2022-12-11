import 'package:flutter/material.dart';
import 'package:mobgrocery/Post/request/post.dart';

Widget richText(String title, String textBody) {
  return RichText(
      text: TextSpan(
          text: title,
          style: TextStyle(color: Colors.pink, fontWeight: FontWeight.bold),
          children: [
        TextSpan(
            text: textBody,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w200))
      ]));
}

class CollectCustomizedCard extends StatelessWidget {
  CollectCustomizedCard(
      {Key? key, required this.postData, this.deletebutton, this.editbutton});
  final Post postData;
  final Function()? deletebutton;
  final Function()? editbutton;

  @override
  Widget build(BuildContext context) {
    return customizedCard();
  }

  Widget customizedCard() {
    return Card(
      color: Colors.white,
      shadowColor: Colors.purple,
      surfaceTintColor: Colors.purple,
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            richText("ID ", postData.title.toString()),
            //Divider( ),
            richText("Title ", postData.title.toString()),
            Divider(),
            richText("Content ", postData.body.toString()),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: deletebutton,
                  icon: Icon(Icons.delete),
                  iconSize: 20,
                  color: Colors.pink,
                ),
                IconButton(
                  icon: Icon(Icons.edit),
                  iconSize: 20,
                  color: Colors.pink,
                  onPressed: editbutton,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
}
