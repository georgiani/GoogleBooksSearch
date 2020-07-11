import 'package:book_search/bookSearchModel.dart';
import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  final Book book;

  BookCard({this.book});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.book),
      title: Text(book.title),
      subtitle: Text(book.author),
    );
  }
}