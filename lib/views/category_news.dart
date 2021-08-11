import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/helper/news.dart';
import 'package:news/modals/article_modal.dart';
import 'package:news/themes.dart';
import 'package:news/views/home.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({this.category, newsCategory});

  @override
  _CategoryViewState createState() => _CategoryViewState();
  final String category;
}

class _CategoryViewState extends State<CategoryView> {
  List<ArticleModal> article = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();

    getCategoriesNews();
  }

  //newsClass variable of type News [which is a list]
  //fetching news from newsClass getnews[created in NewsClass]

  getCategoriesNews() async {
    CategorieNewsClass newsClass = CategorieNewsClass();
    await newsClass.getNews(widget.category);
    article = newsClass.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Row(
          children: [
            Text(
              widget.category.substring(0, (widget.category.length - 2)),
              style: TextStyle(color: Colors.black, fontSize: 25),
            ),
            Text(
              widget.category.substring(
                  (widget.category.length - 2), widget.category.length),
              style: TextStyle(
                  color: Color(0xff5AC7FF), fontSize: 25, fontFamily: 'Avenir'),
            ),
          ],
        ),
        leading: IconButton(
          icon: Icon(CupertinoIcons.back),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.black,
        ),
      ),
      body: _loading
          ? Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            )
          : Container(
              child: ListView(
                children: [
                  Container(
                    child: ListView.builder(
                      physics: ClampingScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: article.length,
                      itemBuilder: (context, index) {
                        return BlogTileModern(
                            url: article[index].url,
                            desc: article[index].description,
                            imageUrl: article[index].urlToImage,
                            title: article[index].title);
                      },
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
