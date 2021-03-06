import 'package:book_search/bookSearchModel.dart';
import 'package:flutter/material.dart';
import 'package:book_search/bookCard.dart';
import 'package:book_search/searchBar.dart';
import 'package:scoped_model/scoped_model.dart';

class MainPageBoot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ScopedModel<BookSearchModel>(
        model: bookSearchModel,
        child: ScopedModelDescendant<BookSearchModel>(
          builder: (ctx, w, m) {
            return Scaffold(
              body: Column(
                children: [
                  SearchBar(),
                  bookSearchModel.isLoading
                      ? Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CircularProgressIndicator(),
                      )
                      : (bookSearchModel.bookList.isEmpty
                          ? Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text("No books"),
                            )
                          : Expanded(
                              child: ListView.builder(
                                itemCount: bookSearchModel.bookList.length,
                                itemBuilder: (ctx, idx) {
                                  return BookCard(
                                    book: bookSearchModel.bookList[idx],
                                  );
                                },
                              ),
                            )),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
