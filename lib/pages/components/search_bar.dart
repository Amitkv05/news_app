import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/server/news_api.dart';
import 'package:news_app/utils/colors.dart';

class Search extends StatefulWidget {
  const Search({super.key, required this.searchController});
  final TextEditingController searchController;

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Container(
          height: 50,
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.only(left: 20),
          decoration: BoxDecoration(
            // color: AppColors.darkgrey,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Row(
            children: [
              // const SizedBox(width: 10),
              Expanded(
                  child: TextField(
                controller: widget.searchController,
                decoration: InputDecoration(
                  hintText: 'Search a Keyword or a Phrase',
                  hintStyle: GoogleFonts.lato(),
                  suffixIcon: InkWell(
                    onTap: () {
                      FocusScope.of(context).unfocus();
                      fetchnews();
                    },
                    child: Container(
                      width: 45,
                      height: 45,
                      decoration: const BoxDecoration(
                        // color: AppColors.darkgrey,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.search,
                        color: Colors.blue.shade800,
                      ),
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ))
            ],
          ),
        )),
        const SizedBox(width: 10),
      ],
    );
  }
}
