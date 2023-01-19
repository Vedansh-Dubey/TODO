import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
   SearchBox({super.key});
   Color bg = const Color.fromARGB(255, 116, 88, 88),
        dark = const Color.fromARGB(255, 78, 85, 90);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(6),
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Icon(
              Icons.search_rounded,
              color: dark,
              size: 20,
            ),
          ),
          prefixIconConstraints: const BoxConstraints(
            maxHeight: 20,
            minWidth: 25,
          ),
          border: InputBorder.none,
          hintText: 'Search',
          hintStyle: TextStyle(color: dark),
        ),
      ),
    );
  }
}