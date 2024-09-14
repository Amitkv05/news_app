import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Row(
            children: [
              Text(
                'Categories',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          SizedBox(height: myHeight * 0.05),
          Column(
            children: [
              const rowWidget(
                firstImage: 'assets/icons/envato.png',
                firstCategory: 'Envato',
                secondImage: 'assets/icons/artificial-intelligence.gif',
                secondCategory: 'Technology',
                thirdImage: 'assets/icons/Science.gif',
                thirdCategory: 'Science',
              ),
              SizedBox(height: myHeight * 0.04),
              const rowWidget(
                firstImage: 'assets/icons/Religion.gif',
                firstCategory: 'Religion',
                secondImage: 'assets/icons/politics.gif',
                secondCategory: 'Politics',
                thirdImage: 'assets/icons/family.gif',
                thirdCategory: 'Family',
              ),
              SizedBox(height: myHeight * 0.04),
              const rowWidget(
                firstImage: 'assets/icons/car.gif',
                firstCategory: 'Cars',
                secondImage: 'assets/icons/business.gif',
                secondCategory: 'Business',
                thirdImage: 'assets/icons/newspaper.gif',
                thirdCategory: 'Top News',
              ),
              SizedBox(height: myHeight * 0.04),
              const rowWidget(
                firstImage: 'assets/icons/travels.gif',
                firstCategory: 'Travels',
                secondImage: 'assets/icons/sports.gif',
                secondCategory: 'Sports',
                thirdImage: 'assets/icons/emotional-intelligence.gif',
                thirdCategory: 'Health',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class rowWidget extends StatelessWidget {
  const rowWidget({
    super.key,
    required this.firstCategory,
    required this.secondCategory,
    required this.thirdCategory,
    required this.firstImage,
    required this.secondImage,
    required this.thirdImage,
  });
  final String firstCategory,
      secondCategory,
      thirdCategory,
      firstImage,
      secondImage,
      thirdImage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            ClipOval(
              child: CircleAvatar(
                backgroundColor: Theme.of(context).primaryColor,
                radius: 42,
                child: Image.asset(
                  firstImage,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(height: 5),
            Text(firstCategory),
          ],
        ),
        Column(
          children: [
            ClipOval(
              child: CircleAvatar(
                backgroundColor: Theme.of(context).primaryColor,
                radius: 42,
                child: Image.asset(
                  secondImage,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(height: 5),
            Text(secondCategory),
          ],
        ),
        Column(
          children: [
            ClipOval(
              child: CircleAvatar(
                backgroundColor: Theme.of(context).primaryColor,
                radius: 42,
                child: Image.asset(
                  thirdImage,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(height: 5),
            Text(thirdCategory),
          ],
        ),
      ],
    );
  }
}
