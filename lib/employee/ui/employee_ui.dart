import 'package:flutter/material.dart';
import 'package:mechine_test/employee/employee_provider.dart';
import 'package:mechine_test/employee/model/employee_model.dart';
import 'package:provider/provider.dart';

class EmployeeDetailsScreen extends StatefulWidget {
  EmployeeModel? employeeDetails;
  EmployeeDetailsScreen({this.employeeDetails}) : super();

  @override
  State<EmployeeDetailsScreen> createState() => _EmployeeDetailsScreenState();
}

class _EmployeeDetailsScreenState extends State<EmployeeDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    EmployeeDeatailsProvider provider =
        context.watch<EmployeeDeatailsProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Employee Details'),
      ),
      body: _buildBody(provider),
    );
  }

  Widget _buildBody(EmployeeDeatailsProvider provider) {
    return Center(
      child: Card(
        elevation: 30,
        shadowColor: Colors.black,
        color: Colors.white,
        child: SizedBox(
          width: 300,
          height: 500,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Center(
                    child: CircleAvatar(
                      radius: 50.0,
                      backgroundImage: NetworkImage(
                          "${widget.employeeDetails?.profileImage ?? ''}"),
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      "Name :",
                      style: TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    Text("${widget.employeeDetails?.name ?? ''}")
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      "Email :",
                      textAlign: TextAlign.left,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    Text("${widget.employeeDetails?.email ?? ''}")
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      "Address :",
                      textAlign: TextAlign.left,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    SizedBox(
                      width: 160,
                      child: Text(
                        "${widget.employeeDetails?.address?.city ?? ''},${widget.employeeDetails?.address?.street ?? ''},${widget.employeeDetails?.address?.zipcode ?? ''}",
                        overflow: TextOverflow.fade,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      "Phone :",
                      textAlign: TextAlign.left,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 35,
                    ),
                    Text("${widget.employeeDetails?.phone ?? ''}")
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      "Company :",
                      textAlign: TextAlign.left,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text("${widget.employeeDetails?.company?.name}")
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
