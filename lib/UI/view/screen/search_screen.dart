// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(16, 24, 8, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Find an exercise',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'With Filter (Coming Soon)',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              SizedBox(height: 24),
              buildSearch(),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSearch() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        controller: searchController,
        decoration: InputDecoration(
          prefixIcon: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: Colors.blue,
            ),
          ),
          hintText: 'Search...',
          suffixIcon: IconButton(
            onPressed: () {
              searchController.clear();
            },
            icon: Icon(
              Icons.clear,
              color: Colors.blue,
            ),
          ),
          border: styleBorder(),
          enabledBorder: styleBorder(),
          focusedBorder: styleBorder(),
          disabledBorder: styleBorder(),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          fillColor: Colors.blueGrey[100],
          filled: true,
        ),
      ),
    );
  }

  styleBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide(
        width: 2,
        color: Colors.black,
      ),
    );
  }
}
