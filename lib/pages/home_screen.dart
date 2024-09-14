import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:news_app/pages/components/bottomSheet.dart';
import 'package:news_app/pages/components/search_bar.dart';
import 'package:news_app/provider/theme_provider.dart';
import 'package:news_app/server/news_api.dart';
import 'package:news_app/utils/colors.dart';
import 'package:news_app/utils/constants.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static TextEditingController searchController =
      TextEditingController(text: '');

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Dio dio = Dio();
  late Future<List> articles;
  @override
  void initState() {
    articles = fetchnews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: false);
    return Scaffold(
      // backgroundColor: AppColors.black,
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  themeProvider.toggleTheme();
                });
              },
              icon: (themeProvider.themeMode == ThemeMode.light)
                  ? const Icon(
                      Icons.dark_mode,
                      color: Colors.black,
                    )
                  : const Icon(
                      Icons.light_mode,
                      color: Colors.white,
                    )),
        ],
        // backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        title: Container(
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Latest',
                style: TextStyle(
                  fontSize: 22,
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Update',
                style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).secondaryHeaderColor,
                ),
              ),
            ],
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Search(searchController: HomeScreen.searchController),
          Container(
            child: FutureBuilder<List>(
              future: fetchnews(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Expanded(
                    child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          var newsData = snapshot.data![index];
                          return Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  showMyBottomSheet(
                                      context,
                                      newsData['title'],
                                      newsData['description'],
                                      newsData['urlToImage'],
                                      newsData['url']);
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(20),
                                  margin: const EdgeInsets.only(
                                      left: 5, right: 5, top: 5),
                                  // color: AppColors.black,
                                  child: Row(
                                    children: [
                                      CachedNetworkImage(
                                        imageUrl: newsData['urlToImage'] != null
                                            ? newsData['urlToImage']
                                            : Constants.imageUrl,
                                        imageBuilder: (context, imageProvider) {
                                          return Container(
                                            width: 60,
                                            height: 60,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: imageProvider,
                                                  fit: BoxFit.cover),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Colors.yellow,
                                            ),
                                          );
                                        },
                                        placeholder: (context, url) =>
                                            Container(
                                          width: 60,
                                          height: 60,
                                          child: const Center(
                                            child: CircularProgressIndicator(
                                                // color: AppColors.primary,
                                                ),
                                          ),
                                        ),
                                        errorWidget: (context, url, error) =>
                                            const Icon(Icons.error),
                                      ),
                                      const SizedBox(width: 8),
                                      Expanded(
                                          child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            newsData['title'],
                                            style: const TextStyle(
                                                // color: AppColors.white,
                                                fontSize: 16),
                                          ),
                                          const SizedBox(height: 5),
                                          Text(
                                            newsData['publishedAt'],
                                            style: const TextStyle(
                                                // color: AppColors.lightwhite,
                                                fontSize: 12),
                                          )
                                        ],
                                      ))
                                    ],
                                  ),
                                ),
                              )
                            ],
                          );
                        }),
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }

                // by default, show a loading spinner..
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
