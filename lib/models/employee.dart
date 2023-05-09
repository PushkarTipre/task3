class Employee {
  late int? id;
  late String name;
  late int EmpId;
  late String Department;
  late int Salary;
  late int ContactNo;

  Employee({
    this.id,
    required this.name,
    required this.EmpId,
    required this.Department,
    required this.Salary,
    required this.ContactNo,
  });

  //Function to convert object to map
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};

    map['id'] = id;
    map['name'] = name;
    map['empId'] = EmpId;
    map['department'] = Department;
    map['contactno'] = ContactNo;
    map['salary'] = Salary;

    return map;
  }

  //Function to convert map to object
//named constructor

  Employee.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    EmpId = map['empId'];
    Department = map['department'];
    ContactNo = map['contactno'];
    Salary = map['salary'];
  }
}
