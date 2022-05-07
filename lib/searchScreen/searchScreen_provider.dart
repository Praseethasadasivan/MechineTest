import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:mechine_test/employee/model/employee_model.dart';
import 'package:mechine_test/searchScreen/searchScreen_service.dart';
import 'package:mechine_test/utils/base_provider.dart';

class SearchScreenProvider extends BaseProvider {
  List<EmployeeModel> employees = [];
  bool isLoading = false;
  List<EmployeeModel> employeeSearchResult = [];
  TextEditingController searchController = new TextEditingController();
  Future downloadFromApi() async {
    var dataFromDb = await SearchScreenService().loadFromDbRequest();
    if (dataFromDb == '') {
      employees = await SearchScreenService().downloadFromApiRequest();
      employees.forEach((element) {
        print(element.name);
      });
      employeeSearchResult = employees;
      await SearchScreenService()
          .writeToDbRequest(jsonEncode(employees.map<Map>(
        (e) {
          return e.toJson();
        },
      ).toList()));
    } else {
      employeeSearchResult = dataFromDb;
      employees = dataFromDb;
    }
    isLoading = false;
    notifyListeners();
  }

  searchUsingName(String keyWord) {
    if (keyWord == '') {
      employeeSearchResult = employees;
    } else {
      employeeSearchResult = employees
          .where((element) =>
              element.email
                  .toString()
                  .toUpperCase()
                  .contains(keyWord.toUpperCase()) ||
              element.name
                  .toString()
                  .toUpperCase()
                  .contains(keyWord.toUpperCase()))
          .toList();
    }

    notifyListeners();
  }
}
