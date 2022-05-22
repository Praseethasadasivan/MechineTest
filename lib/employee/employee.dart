import 'package:flutter/material.dart';
import 'package:mechine_test/employee/employee_provider.dart';
import 'package:mechine_test/employee/model/employee_model.dart';
import 'package:mechine_test/employee/ui/employee_ui.dart';
import 'package:provider/provider.dart';

class EmployeeScreen extends StatefulWidget {
  EmployeeModel? employeeDetails;
  EmployeeScreen({this.employeeDetails}) : super();

  @override
  State<EmployeeScreen> createState() => _EmployeeScreenState();
}

class _EmployeeScreenState extends State<EmployeeScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => EmployeeDeatailsProvider(),
      child: EmployeeDetailsScreen(
        employeeDetails: widget.employeeDetails,
      ),
    );
  }
}
