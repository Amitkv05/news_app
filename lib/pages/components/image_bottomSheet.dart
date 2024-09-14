import 'package:flutter/material.dart';

class BottomSheetImage extends StatelessWidget {
  const BottomSheetImage(
      {super.key, required this.imageUrl, required this.title});
  final String imageUrl, title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Stack(
        children: [
          Container(
            foregroundDecoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black, Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              image: DecorationImage(
                  image: NetworkImage(imageUrl), fit: BoxFit.cover),
            ),
          ),
          Positioned(
              bottom: 10,
              child: Container(
                padding: EdgeInsets.all(10),
                width: 300,
                child: Text(
                  title,
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ))
        ],
      ),
    );
  }
}
