import 'package:flutter/material.dart';
import 'package:news_api_flutter/api/api_call.dart';
import 'package:news_api_flutter/api/news_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<NewsModel> _newsModel;

  @override
  void initState() {
    _newsModel = NewsApi().getapi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News From Api'),
        centerTitle: true,
      ),
      body: Container(
          child: FutureBuilder<NewsModel>(
        future: _newsModel,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.articles.length,
                itemBuilder: (context, index) {
                  var article= snapshot.data!.articles[index];
                  return Container(
                    height: 100,
                    width: 100,
                    child: Row(
                      children: [
                        Image.network(article.urlToImage,fit: BoxFit.cover,),
                        
                        Flexible(child: Text(article.author)),
                      ],
                    ),
                  );
                });
          } else
            return Center(
              child: CircularProgressIndicator(),
            );
        },
      )),
    );
  }
}
