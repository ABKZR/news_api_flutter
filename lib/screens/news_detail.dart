import 'package:flutter/material.dart';
import 'package:news_api_flutter/widgets/custom_row.dart';
import 'package:url_launcher/link.dart';

// ignore: must_be_immutable
class NewsDetails extends StatelessWidget {
  var article;
  NewsDetails({required this.article});
  @override
  Widget build(BuildContext context) {
    var controller = ScrollController();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          article.title,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        controller: controller,
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Image.network(
                  article.urlToImage,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              children: [
                CustomRow(
                  title: 'Author',
                  details: article.author,
                  spaceWidth: 45,
                ),
                CustomRow(
                  title: 'Content',
                  details: article.content,
                  spaceWidth: 37,
                ),
                CustomRow(
                  title: 'Description',
                  details: article.description,
                ),
                CustomRow(
                  title: 'Content',
                  details: article.content,
                  spaceWidth: 37,
                ),
                CustomRow(
                  title: 'Published',
                  details: article.publishedAt.toString(),
                  spaceWidth: 15,
                ),
                Center(
                    child: Link(
                        uri: Uri.parse(article.url),
                        target: LinkTarget.self,
                        builder: (context, followLink) {
                          return ElevatedButton(
                            onPressed: followLink,
                            child: Text('Click here for more information'),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent),
                          );
                        }))
              ],
            )
          ],
        ),
      ),
    );
  }
}
