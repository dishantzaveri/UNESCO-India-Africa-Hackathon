import 'dart:convert';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:http/http.dart' as http;
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ResDetails extends StatefulWidget {
  final String title;
  const ResDetails({Key? key, required this.title}) : super(key: key);

  @override
  State<ResDetails> createState() => _ResDetailsState();
}

class _ResDetailsState extends State<ResDetails> {
  List<String> ytLinks = [
    "https://www.youtube.com/watch?v=hTh5MJFzgPY",
    "https://www.youtube.com/watch?v=tOKlP4ISIR4",
    "https://www.youtube.com/watch?v=F-Zw97WiSxA"
  ];
  List<String> ytTitles = [];
  List<String> ytDuration = [];
  List<String> ytThumbnails = [];
  getData(url) async {
    String embedUrl = "https://www.youtube.com/oembed?url=$url&format=json";
    var response = await http.get(Uri.parse(embedUrl));
    try {
      if (response.statusCode == 200) {
        // print(response.body);
        return jsonDecode(response.body);
      } else {
        return null;
      }
    } on FormatException catch (e) {
      print('invalid JSON' + e.toString());
      return null;
    }
  }

  getTitles() async {
    int i;
    for (i = 0; i < ytLinks.length; i++) {
      dynamic jsonData = await getData(ytLinks[i]);
      String title = jsonData["title"];
      String thumbnail = jsonData["thumbnail_url"];
      ytTitles.add(title);
      ytThumbnails.add(thumbnail);
    }
  }

  @override
  Widget build(BuildContext context) {
    getData(ytLinks);

    List<YoutubePlayerController> _controllersList = ytThumbnails
        .map((e) => YoutubePlayerController(initialVideoId: e))
        .toList();

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              backgroundColor: Colors.black,
              expandedHeight: 120,
              flexibleSpace: Container(
                decoration: const BoxDecoration(gradient: MY_GRADIENT),
                child: FlexibleSpaceBar(
                  centerTitle: false,
                  title: Text(
                    widget.title,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: const [
                  TabBar(
                    tabs: [
                      Tab(
                        icon: Icon(
                          Icons.video_collection,
                          color: Colors.black,
                        ),
                      ),
                      Tab(
                        icon: Icon(
                          Icons.document_scanner,
                          color: Colors.black,
                        ),
                      )
                    ],
                    indicatorColor: Colors.black,
                  ),
                ],
              ),
            ),
            SliverFillRemaining(
              child: TabBarView(children: [
                FutureBuilder(
                    future: getTitles(),
                    builder: (context, snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting:
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        case ConnectionState.done:
                          return ListView.builder(
                              itemCount: ytLinks.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Card(
                                  margin: const EdgeInsets.only(
                                      bottom: 20, left: 20, right: 20),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Row(
                                    children: [
                                      Container(
                                          margin: EdgeInsets.only(
                                              left: 15,
                                              right: 15,
                                              top: 15,
                                              bottom: 15),
                                          width: 100,
                                          height: 100,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              image: DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: NetworkImage(
                                                      ytThumbnails[index])))),
                                      Expanded(
                                          child: Text(
                                        ytTitles[index],
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ))
                                    ],
                                  ),
                                );
                              });
                        default:
                          return Container();
                      }
                    }),
                ListView.builder(
                    itemCount: 2,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: const EdgeInsets.only(
                            bottom: 20, left: 20, right: 20),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        child: Row(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(12)),
                              child: Icon(Icons.picture_as_pdf),
                              margin: const EdgeInsets.all(10),
                            ),
                            Expanded(
                                child: Text(
                              "Document title",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w800),
                            )),
                            Icon(Icons.download_rounded),
                            SizedBox(
                              width: 20,
                            )
                          ],
                        ),
                      );
                    })
              ]),
            )
          ],
        ),
      ),
    );
  }
}
