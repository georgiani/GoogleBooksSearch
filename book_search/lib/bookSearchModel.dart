import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Book {
  final String title, author;
  Book({this.title, this.author});
}

class BookSearchModel extends Model {
  List<Book> bookList = [];

  void fetchBooks(String searchBarText) async{
    bookList.clear();

    List<String> formattedSearchList = searchBarText.split(" ");
    String formattedSearch = "";

    for (String word in formattedSearchList) { 
      if (word != null) {
        formattedSearch += word;
        formattedSearch += " ";
      }
    }

    final resp = await http.get('https://www.googleapis.com/books/v1/volumes?q=' + formattedSearch.substring(0, formattedSearch.length - 1));

    if (resp.statusCode == 200) {
      Map<String, dynamic> mapResp = jsonDecode(resp.body);
      for (Map<String, dynamic> item in mapResp['items']) {
        String title = "";
        if (item.containsKey('volumeInfo')) {
          if (item['volumeInfo'].containsKey('title')) {
            title = item['volumeInfo']['title'].toString();
          }
        }

        String author = "";
        if (item.containsKey('volumeInfo')) {
          if (item['volumeInfo'].containsKey('authors')) {
            author = item['volumeInfo']['authors'][0].toString();
          }
        }

        bookList.add(Book(title: title, author: author));
      }
    }

    notifyListeners();
  }

}

BookSearchModel bookSearchModel = BookSearchModel();