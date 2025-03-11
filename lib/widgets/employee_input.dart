// TODO Implement this library.
import 'package:flutter/material.dart';

class EmployeeInput extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onUpdate;

  EmployeeInput({required this.controller, required this.onUpdate});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: controller,
            decoration: InputDecoration(),
          ),
        ),
        SizedBox(width: 10),
        ElevatedButton(
          onPressed: onUpdate,
          child: Text("Đổi"),
        ),
      ],
    );
  }
}
