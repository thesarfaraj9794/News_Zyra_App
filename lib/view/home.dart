import 'package:flutter/material.dart';
import 'package:news_app/controller/fetchNews.dart';
import 'package:news_app/view/widget/NewsContainer.dart';

// Ensure NewsContainer.dart exports a widget class named NewsContainer



import 'package:news_app/model/newsArt.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = true;

  late NewsArt newsArt;

  GetNews() async {
    newsArt = await FetchNews.fetchNews();

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    GetNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    
      body: PageView.builder(
          controller: PageController(initialPage: 0),
          scrollDirection: Axis.vertical,
          onPageChanged: (value) {
            setState(() {
              isLoading = true;
            });
            GetNews();
          },
          itemBuilder: (context, index) {
            return isLoading ? Center(child: CircularProgressIndicator(),) :  NewsContainer(
                imgUrl: newsArt.imgUrl,
                newsCnt: newsArt.newsCnt,
                
                newsHead: newsArt.newsHead,
                newsDes: newsArt.newsDes,
                newsUrl: newsArt.newsUrl);
          }),
    );
  }
}