class NewsArt{
  String imgUrl;
  String newsHead;
  String newsDes;
  String newsUrl;
  String newsCnt;


  NewsArt({
    required this.imgUrl,
    required this.newsCnt,
    required this.newsHead,
    required this.newsDes,
    required this.newsUrl,

  });


  static   NewsArt   fromAPItoApp(Map<String,dynamic>article){
    return NewsArt(imgUrl: article["urlToImage"] ??"https://www.shutterstock.com/image-vector/lower-news-live-streaming-breaking-headline-2535984111?irclickid=RfN2%3AnSNhxyKUh43A6wTL24SUkp2HP2FqUk%3AWI0&irgwc=1&pl=38919-1636534&utm_medium=Affiliate&utm_campaign=Eezy%2C%20LLC&utm_source=38919&utm_term=direct&utm_content=1636534&dd_referrer=https%3A%2F%2Fwww.vecteezy.com%2F",
     newsCnt: article["content"] ?? "--",
     newsHead: article["title"] ??"--"
     , newsDes: article["description"] ??"--", 
     newsUrl: article["url"] ??"https://news.google.com/home?hl=en-IN&gl=IN&ceid=IN:en"
     );
  }
}