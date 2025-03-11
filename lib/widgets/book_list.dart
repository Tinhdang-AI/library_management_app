// TODO Implement this library
import 'package:flutter/material.dart';
import '../models/book.dart';

class BookList extends StatelessWidget {
  final List<Book> books;
  final Function(bool?, int) onBookChanged;

  BookList({required this.books, required this.onBookChanged});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          return CheckboxListTile(
            title: Text(books[index].title),
            value: books[index].isSelected,
            onChanged: (value) => onBookChanged(value, index),
          );
        },
      ),
    );
  }
}
