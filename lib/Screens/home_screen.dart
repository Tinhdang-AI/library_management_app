import 'package:flutter/material.dart';
import '../models/book.dart';
import '../widgets/book_list.dart';
import '../widgets/employee_input.dart';

class LibraryHomePage extends StatefulWidget {
  @override
  _LibraryHomePageState createState() => _LibraryHomePageState();
}

class _LibraryHomePageState extends State<LibraryHomePage> {
  TextEditingController employeeController = TextEditingController();
  String employeeName = "Nguyen Van A";
  List<Book> books = [Book("Sách 01"), Book("Sách 02")];
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    employeeController.text = employeeName;
  }

  void _addBook() {
    setState(() {
      books.add(Book("Sách ${books.length + 1}"));
    });
  }

  void _onNavTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _updateEmployeeName() {
    setState(() {
      employeeName = employeeController.text;
    });
  }

  void _onBookChanged(bool? value, int index) {
    setState(() {
      books[index].isSelected = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hệ thống Quản lý Thư viện")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Nhân viên", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            EmployeeInput(controller: employeeController, onUpdate: _updateEmployeeName),
            SizedBox(height: 20),
            Text("Danh sách sách", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            BookList(books: books, onBookChanged: _onBookChanged),
            ElevatedButton(onPressed: _addBook, child: Text("Thêm")),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onNavTapped,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Quản lý"),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: "DS Sách"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Nhân viên"),
        ],
      ),
    );
  }
}
