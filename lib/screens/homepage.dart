import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo/constants/colors.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final Color bg = Color.fromARGB(255, 235, 235, 235),
        dark = const Color.fromARGB(255, 78, 85, 90);
    return Scaffold(
      backgroundColor: bg,
      appBar: _buildAppBar(bg),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(children: [
          searchBox(),
        ]),
      ),
    );
  }

  Widget searchBox() {
    final Color bg = Color.fromARGB(255, 116, 88, 88),
        dark = const Color.fromARGB(255, 78, 85, 90);
    return Container(
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(6),
          prefixIcon: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Icon(
              Icons.search_rounded,
              color: dark,
              size: 20,
            ),
          ),
          prefixIconConstraints: BoxConstraints(
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

  AppBar _buildAppBar(Color bg) {
    const Color dark = Color.fromARGB(255, 78, 85, 90);
    return AppBar(
      backgroundColor: bg,
      elevation: 0,
      title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Icon(
              Icons.menu,
              color: tdBlack,
              size: 32,
            ),
            Text(
              'Ab Kya Karna Hai ?',
              style: TextStyle(
                fontSize: 25,
                color: dark,
              ),
            ),
            Icon(
              Icons.delete_forever,
              color: Colors.red,
              size: 35,
            ),
          ]),
    );
  }
}
