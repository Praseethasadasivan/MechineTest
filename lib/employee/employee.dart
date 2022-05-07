import 'package:flutter/material.dart';
import 'package:mechine_test/employee/employee_provider.dart';
import 'package:mechine_test/employee/ui/employee_ui.dart';
import 'package:provider/provider.dart';

class EmployeeScreen extends StatefulWidget {
  const EmployeeScreen({Key? key}) : super(key: key);

  @override
  State<EmployeeScreen> createState() => _EmployeeScreenState();
}

class _EmployeeScreenState extends State<EmployeeScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => EmployeeDeatailsProvider(),
      child: const EmployeeDetailsScreen(),
    );
  }
}
