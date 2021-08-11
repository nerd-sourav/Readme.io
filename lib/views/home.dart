import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/helper/data.dart';
import 'package:news/helper/news.dart';
import 'package:news/modals/article_modal.dart';
import 'package:news/modals/category_modal.dart';
import 'package:news/views/articls_view.dart';
import 'package:news/views/category_news.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModal> categories = [];
  List<ArticleModal> article = [];
  bool _loading = true;
  bool isDark = false;

  @override
  void initState() {
    super.initState();
    categories = getCategories();
    getNews();
  }

  //newsClass variable of type News [which is a list]
  //fetching news from newsClass getnews[created in NewsClass]

  getNews() async {
    News newsClass = News();
    await newsClass.getNews();
    article = newsClass.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text("Readme",
                style: TextStyle(
                    color: Colors.black, fontSize: 25.0, fontFamily: 'Avenir')),
            Text(".io",
                style: TextStyle(
                    color: Color(0xff5AC7FF),
                    fontSize: 25.0,
                    fontFamily: 'Avenir'))
          ]),
        ),
        body: Container(
          child: ListView(
            children: [
              //Categories header

              Container(
                height: 80,
                child: ListView.builder(
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return CategoryTile(
                      imageUrl: categories[index].imageUrl,
                      categoryName: categories[index].categoryName,
                    );
                  },
                ),
              ),

              //The main body data inclicluding th image, title, and a bit of content
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
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final String imageUrl;
  final String categoryName;

  const CategoryTile({
    @required this.imageUrl,
    @required this.categoryName,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => //CategoryNews
                    CategoryView(
                      category: categoryName.toLowerCase(),
                    )));
      },
      child: Container(
        padding: EdgeInsets.only(left: 10.0, top: 10.0),
        child: Stack(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                    imageUrl: imageUrl,
                    width: 180,
                    height: 90,
                    fit: BoxFit.cover)),
            Container(
              height: 80,
              width: 180,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.black38,
              ),
              child: Text(
                "#" + categoryName,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 14.0),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CategoryTileModern extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10.0, top: 10.0),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Container(
              width: 180,
              height: 90,
            ),
          ),
          Container(
            height: 80,
            width: 180,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Colors.black38,
            ),
            child: Text(
              "#",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 14.0),
            ),
          )
        ],
      ),
    );
  }
}

class BlogTile extends StatelessWidget {
  final String imageUrl, title, desc;
  final String url;
  BlogTile(
      {@required this.desc,
      @required this.imageUrl,
      @required this.title,
      @required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        Future.delayed(Duration(seconds: 5));
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArticleView(
              blogUrl: url,
              blogTitle: title,
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.all(16.0),
        child: Column(
          children: [
            ClipRRect(
              child: Container(
                width: 500,
                height: 250,
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            SizedBox(height: 8.0),
            Text(title,
                style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w500)),
            SizedBox(height: 8.0),
            Text(desc, style: TextStyle(color: Colors.black54)),
            Divider(
              thickness: 2,
            )
          ],
        ),
      ),
    );
  }
}

class BlogTileModern extends StatelessWidget {
  final String imageUrl, title, desc;
  final String url;
  BlogTileModern(
      {@required this.desc,
      @required this.imageUrl,
      @required this.title,
      @required this.url});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArticleView(
              blogUrl: url,
              blogTitle: title,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            SizedBox(height: 100),
            Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      child: Container(
                        width: 500,
                        height: 250,
                        child: Image.network(
                          imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    SizedBox(height: 10),
                    Text(
                      title,
                      style: TextStyle(
                        fontFamily: 'Avenir',
                        fontSize: 20,
                        color: const Color(0xff47455f),
                        fontWeight: FontWeight.w900,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 10),
                    Text(
                      desc,
                      style: TextStyle(
                        fontFamily: 'Avenir',
                        fontSize: 12,
                        color: const Color(0xff47455f),
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
