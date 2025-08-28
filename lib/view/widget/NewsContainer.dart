import 'package:flutter/material.dart';
import 'package:news_app/view/detail_view.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsContainer extends StatelessWidget {
  final String imgUrl;
  final String newsHead;
  final String newsDes;
  final String newsUrl;
  final String newsCnt;

  const NewsContainer({
    super.key,
    required this.imgUrl,
    required this.newsDes,
    required this.newsCnt,
    required this.newsHead,
    required this.newsUrl,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ✅ Image with placeholder & error handling
          FadeInImage.assetNetwork(
            placeholder: "assets/images/sssa.png",
            image: imgUrl,
            height: MediaQuery.of(context).size.height * 0.35,
            width: double.infinity,
            fit: BoxFit.cover,
            imageErrorBuilder: (context, error, stackTrace) {
              return Image.asset(
                "assets/images/sssa.png",
                height: MediaQuery.of(context).size.height * 0.35,
                width: double.infinity,
                fit: BoxFit.cover,
              );
            },
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ✅ Headline
                Text(
                  newsHead.isNotEmpty
                      ? (newsHead.length > 100
                          ? "${newsHead.substring(0, 100)}..."
                          : newsHead)
                      : "No Title",
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),

                // ✅ Description
                if (newsDes.isNotEmpty)
                  Text(
                    newsDes,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black54,
                    ),
                  ),

                const SizedBox(height: 15),

                // ✅ Content (safe substring)
                Text(
                  (newsCnt != "--" && newsCnt.isNotEmpty)
                      ? (newsCnt.length > 250
                          ? "${newsCnt.substring(0, 250)}..."
                          : newsCnt)
                      : "No Content Available",
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),

          // ✅ Read More Button
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailViewScreen(newsUrl: newsUrl),
                    ),
                  );
                },
                child: const Text("Read More"),
              ),
            ),
          ),

          const SizedBox(height: 20),
          

          // ✅ NewsAPI credit
          Center(
            
            child: ElevatedButton(
              onPressed: () async {
                final uri = Uri.parse("https://newsapi.org/");
                if (await canLaunchUrl(uri)) {
                  await launchUrl(uri);
                }
              },
              child: const Text(
                "News Provided By NewsAPI.org",
                style: TextStyle(fontSize: 12),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
