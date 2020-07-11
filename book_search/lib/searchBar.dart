import 'package:flutter/material.dart';
import 'package:book_search/bookSearchModel.dart';

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: TextField(
          controller: _controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: "Search books"
          ),
          onEditingComplete: () {
            bookSearchModel.fetchBooks(_controller.text);
          },
        ),
      ),
    );
  }
}
