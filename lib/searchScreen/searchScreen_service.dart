import 'dart:convert';

import 'package:mechine_test/employee/model/employee_model.dart';
import 'package:mechine_test/utils/apiService.dart';
import 'package:mechine_test/utils/dbService.dart';

class SearchScreenService {
  Future<dynamic> downloadFromApiRequest() async {
    var data = await ApiService()
        .get('http://www.mocky.io/v2/5d565297300000680030a986');
    print("$data");
    return data
        .map<EmployeeModel>((entry) => EmployeeModel.fromJson(entry))
        .toList();
  }

  Future<dynamic> loadFromDbRequest() async {
    var data = await DBService().readFromDB('userdata');
    data = jsonDecode(data);
    print("$data");
    return data != null
        ? data
            .map<EmployeeModel>((entry) => EmployeeModel.fromJson(entry))
            .toList()
        : '';
  }

  Future<void> writeToDbRequest(dynamic value) async {
    DBService().storeToDb('userdata', value);
  }
}
