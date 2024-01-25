import 'package:LibreMedia/screens/search-results.dart';
import 'package:LibreMedia/variables.dart';
import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * .04),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Search',
          filled: true,
          fillColor: const Color(0xFF363636),
          contentPadding: const EdgeInsets.only(
            left: 14.0,
            bottom: 6.0,
            top: 8.0,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10.0),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: const BorderSide(color: Color(0xFF363636)),
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        onSubmitted: (prompt) {
         prompt.isEmpty? null :
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Scaffold(
                backgroundColor: bgColor,
                appBar: AppBar(
                  shadowColor: Colors.transparent,
                  title: const Text("Search results"),
                ),
                body: SearchResultVideoCards(prompt: prompt),
              ),
            ),
          );
        },
      ),
    );
  }
}