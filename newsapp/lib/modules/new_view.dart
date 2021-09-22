import 'package:flutter/material.dart';
import 'package:newscloud/models/article_model.dart';

class NewView extends StatefulWidget {
  final Article? article;
  const NewView({Key? key, this.article}) : super(key: key);

  @override
  _NewViewState createState() => _NewViewState();
}

class _NewViewState extends State<NewView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 240,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(widget.article!.imageUrl!),
                    fit: BoxFit.cover
                  )
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(widget.article!.description!,style: TextStyle(fontSize: 20, color: Color.fromRGBO(0, 0, 77, 1)),

                textAlign: TextAlign.right,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
