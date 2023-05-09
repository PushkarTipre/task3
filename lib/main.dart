import 'package:flutter/material.dart';
import 'package:task3/screens/add_employee_list.dart';

void main() {
  runApp(const mainScreen());
}

class mainScreen extends StatelessWidget {
  const mainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: AddEmployeeScreen());
  }
}
