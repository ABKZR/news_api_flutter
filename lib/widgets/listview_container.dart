
import 'package:flutter/material.dart';
import 'package:news_api_flutter/model/news_model.dart';
import 'package:news_api_flutter/screens/news_detail.dart';

class CustomListViewContainer extends StatelessWidget {
  const CustomListViewContainer({
    Key? key,
    required this.article,
  }) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => NewsDetails(
                    article: article,
                  )));
        },
        child: Row(
          children: [
            Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24)),
              child: AspectRatio(
                aspectRatio: 1,
                child: Image.network(
                  article.urlToImage,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Flexible(
              child: Column(
                children: [
                  Text(
                    article.title,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    article.description,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
