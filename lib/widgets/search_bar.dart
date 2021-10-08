import 'package:flutter/material.dart';

import 'package:demo/pages/search_page.dart';


class SearchBar extends StatelessWidget{
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String _searchString = '';
    return Material(
      borderRadius: BorderRadius.circular(30.0),
      elevation: 5.0,

      child: TextField(
        onChanged: (value) {
          if(value.isNotEmpty) _searchString = value;
        },
        decoration: InputDecoration(
          hintText: "Search any food",
          suffixIcon: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(30.0),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => SearchPage(_searchString)));
              },
              icon: const Icon(Icons.search),
              color: Colors.black,
              ),
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 32.0,vertical: 12.0),
        ),
      ),
    );
  }

}