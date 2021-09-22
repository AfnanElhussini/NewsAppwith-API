import 'package:flutter/material.dart';
import 'package:newscloud/models/article_model.dart';
import 'package:newscloud/shared/component.dart';
import 'package:newscloud/view_models/listofArticlesviewmodel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  NewsApi newsApi = NewsApi();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
            child:FutureBuilder<List<Article>>(
              future: newsApi.fetchArticlesByCategory('health'),
              initialData: [],
              builder: (context,snapshot){
                return Column(children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 8.0, right: 20.0, top: 30, bottom: 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Walk with Trend',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 29,
                              color: Color.fromRGBO(0, 0, 77, 1)),
                        ),
                        Text(
                          'Don\'t stay behind, read the trend',
                          style: TextStyle(fontSize: 25),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 23.0),
                          child: Text(
                            'Top reads of the day',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                color: Color.fromRGBO(0, 0, 77, 1)),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Column(
                    children: snapshot.data!.map((e) => defultCard(context,article: e)).toList(),
                  )

                ]);
              },
            )
        ),
      ),
    );
  }
}
