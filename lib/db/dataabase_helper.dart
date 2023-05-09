import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:task3/models/employee.dart';

class DatabaseHelper {
  //Database
  //Table
  DatabaseHelper._privateConstructor(); // Name constructor to create instance of database
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  // getter for database

  Future<Database> get database async {
    _database ??= await initializeDatabase();
    return _database!;
  }

  Future<Database> initializeDatabase() async {
    // Get the directory path for both Android and iOS
    // to store database

    Directory directory = await getApplicationDocumentsDirectory();
    String path = '${directory.path}/employee2.db';

    // open/ create database at a given path
    var employee2Database = await openDatabase(
      path,
      version: 1,
      onCreate: _createDb,
    );

    return employee2Database;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute('''Create TABLE tbl_employee2 (
                  id INTEGER PRIMARY KEY AUTOINCREMENT,
                  name TEXT,
                  EmpId INTEGER,
                  DEPARTMENT TEXT, 
                  ContactNo INTEGER, 
                  Salary INTEGER )
    
    ''');
  }

  // insert
  Future<int> insertEmployee(Employee e) async {
    // add student to table

    Database db = await instance.database;
    /*int result = await db.rawInsert(
        'INSERT INTO tbl_employee2 (name, EmpId, DEPARTMENT, ContactNo, Salary.) VALUES (?, ?, ?, ?, ?)',
        [e.name, e.EmpId, e.Department, e.ContactNo, e.Salary]);*/
    int result = await db.insert('tbl_employee2', e.toMap());

    return result;
  }

  // read

  Future<List<Employee>> getAllEmployees() async {
    List<Employee> employees = [];
    //var employee2 = <Employee>[];
    // read data from table
    Database db = await instance.database;
    //db.rawQuery('SELECT * from tbl_student');

    List<Map<String, dynamic>> listMap = await db.query('tbl_employee2');

    for (var employeeMap in listMap) {
      Employee e = Employee.fromMap(employeeMap);
      employees.add(e);
    }

    await Future.delayed(const Duration(seconds: 3));
    return employees;
  }

  // update
  Future<int> updateEmployee(Employee e) async {
    Database db = await instance.database;
    /*
    int result = await db.rawUpdate(
        'UPDATE tbl_student set name=?, course=?, mobile=?, totalFee=?, feePaid=? where id=?',
        [s.name, s.course, s.mobile, s.totalFee, s.feePaid, s.id]);
  */
    int result = await db
        .update('tbl_employee2', e.toMap(), where: 'id=?', whereArgs: [e.id]);
    return result;
  }

  // delete

  Future<int> deleteStudent(int id) async {
    Database db = await instance.database;
    //int result = await db.rawDelete('DELETE from tbl_student where id=?', [id] );

    int result =
        await db.delete('tbl_employee2', where: 'id=?', whereArgs: [id]);
    return result;
  }

  //Insert

  //Read
  //Update
  //Delete
}
