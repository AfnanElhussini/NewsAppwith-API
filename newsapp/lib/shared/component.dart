import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newscloud/models/article_model.dart';
import 'package:newscloud/modules/new_view.dart';

Widget defultCard(context,
    {double width = double.infinity,
    double height = 180,
    Color background = Colors.blueGrey,
    required Article article}) {
  return Padding(

    padding: const EdgeInsets.all(20.0),
    child: GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => NewView( article: article,)));
      },
      child: Container(
        child: GestureDetector(
          child: Row(
            children: [
              //image
              Container(
                margin: EdgeInsets.only(left: 8),
                height: 120,
                width: 90,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    article.imageUrl!,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                  width: 290,
                  child: Text(
                    article.title!,
                    style: TextStyle(
                        color: Color.fromRGBO(0, 0, 77, 1), fontSize: 20),
                    textAlign: TextAlign.right,
                  )),
            ],
          ),
        ),
        width: width,
        height: height,
        //color: background,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    ),
  );
}
