import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:task3/db/dataabase_helper.dart';
import 'package:task3/models/employee.dart';
import 'package:task3/screens/update_employee_screen.dart';

class EmployeeListScreen extends StatefulWidget {
  const EmployeeListScreen({Key? key}) : super(key: key);

  @override
  State<EmployeeListScreen> createState() => _EmployeeListScreenState();
}

class _EmployeeListScreenState extends State<EmployeeListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Employee List'),
      ),
      /*  body: Container(
        child: TextButton(
          onPressed: () async {
            var list = await DatabaseHelper.instance.getAllEmployees();
            for (var employee in list) {
              print(employee.name);
            }
          },
          child: Text('data'),
        ),
      ),*/
      body: FutureBuilder<List<Employee>>(
          future: DatabaseHelper.instance.getAllEmployees(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Employee>> snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            } else {
              if (snapshot.data!.isEmpty) {
                return Center(child: Text('NO records'));
              } else {
                List<Employee> employees = snapshot.data!;
                return ListView.builder(
                    itemCount: employees.length,
                    itemBuilder: (context, index) {
                      Employee e = employees[index];

                      return Container(
                        margin: const EdgeInsets.only(bottom: 16.0),
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Colors.amber[200],
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(16.0),
                                decoration: BoxDecoration(
                                    color: Colors.red[100],
                                    borderRadius: BorderRadius.circular(16.0)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(e.id.toString()),
                                    Text(e.name),
                                    Text(e.Department),
                                    Text(e.ContactNo.toString()),
                                    Text(e.EmpId.toString()),
                                    Text(e.Salary.toString())
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 16.0,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.green[100],
                                  borderRadius: BorderRadius.circular(16.0)),
                              child: Column(
                                children: [
                                  IconButton(
                                      onPressed: () async {
                                        String result =
                                            await Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) {
                                          return UpdateEmployeeScreen(
                                              employee: e);
                                        }));

                                        if (result == 'done') {
                                          setState(() {});
                                        }
                                      },
                                      icon: const Icon(Icons.edit)),
                                  IconButton(
                                      onPressed: () {
                                        showDialog(
                                            barrierDismissible: false,
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                title: const Text(
                                                    'Confirmation!!!'),
                                                content: const Text(
                                                    'Are you sure to delete?'),
                                                actions: [
                                                  TextButton(
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      child: const Text('No')),
                                                  TextButton(
                                                      onPressed: () async {
                                                        Navigator.of(context)
                                                            .pop();

                                                        // delete student

                                                        int result =
                                                            await DatabaseHelper
                                                                .instance
                                                                .deleteStudent(
                                                                    e.id!);

                                                        if (result > 0) {
                                                          Fluttertoast.showToast(
                                                              msg:
                                                                  'RECORD DELETED');
                                                          setState(() {});
                                                          // build function will be called
                                                        }
                                                      },
                                                      child: const Text('Yes')),
                                                ],
                                              );
                                            });
                                      },
                                      icon: const Icon(Icons.delete)),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    });
              }
            }
          }),
    );
  }
}
