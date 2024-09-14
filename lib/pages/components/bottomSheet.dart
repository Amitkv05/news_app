// ignore_for_file: deprecated_member_use

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/pages/components/image_bottomSheet.dart';
import 'package:url_launcher/url_launcher.dart';

void showMyBottomSheet(
    BuildContext context, String title, String description, imageUrl, url) {
  showBottomSheet(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      elevation: 20,
      context: context,
      builder: (context) {
        return MyBottomSheetLayout(
          description: description,
          imageUrl: imageUrl,
          title: title,
          url: url,
        );
      });
}

_launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

//bottom sheet widget class
//put your things here, like buttons, callbacks and layout
class MyBottomSheetLayout extends StatelessWidget {
  const MyBottomSheetLayout(
      {super.key,
      required this.description,
      required this.imageUrl,
      required this.title,
      required this.url});
  final String description, title, imageUrl, url;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 480,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Column(
        children: <Widget>[
          BottomSheetImage(imageUrl: imageUrl, title: title),
          Container(
            padding: const EdgeInsets.all(19),
            child: Text(
              description,
              style: TextStyle(fontSize: 16),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                      text: 'Read Full Article',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          _launchURL(url);
                        },
                      style: GoogleFonts.lato(color: Colors.blue.shade400)),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
