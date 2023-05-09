import 'package:flutter/material.dart';
import 'package:task3/screens/employee_list_screen.dart';

class AddEmployeeScreen extends StatefulWidget {
  const AddEmployeeScreen({Key? key}) : super(key: key);

  @override
  State<AddEmployeeScreen> createState() => _AddEmployeeScreenState();
}

class _AddEmployeeScreenState extends State<AddEmployeeScreen> {
  var formKey = GlobalKey<FormState>();
  late String name, EmployeeID, Department, Salary, ContactNo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Employee'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Name',
                      labelText: 'Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    validator: (String? text) {
                      if (text == null || text.isEmpty) {
                        return 'Please provide name';
                      }
                      name = text!;
                      return null;
                    }),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Employee ID',
                      labelText: 'Employee ID',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    validator: (String? text) {
                      if (text == null || text.isEmpty) {
                        return 'Please provide Emp ID';
                      }
                      EmployeeID = text!;
                      return null;
                    }),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Department',
                      labelText: 'Department',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    validator: (String? text) {
                      if (text == null || text.isEmpty) {
                        return 'Please provide Department';
                      }
                      Department = text!;
                      return null;
                    }),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Salary',
                      labelText: 'Salary',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    validator: (String? text) {
                      if (text == null || text.isEmpty) {
                        return 'Please provide Salary';
                      }
                      Salary = text!;
                      return null;
                    }),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Contact Number',
                      labelText: 'Contact Number',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    validator: (String? text) {
                      if (text == null || text.isEmpty) {
                        return 'Please provide a Contact Number';
                      }
                      ContactNo = text!;
                      return null;
                    }),
                SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      //Save record in DB table
                    }
                  },
                  child: Text('Save'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return EmployeeListScreen();
                        },
                      ),
                    );
                  },
                  child: Text('View All'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
