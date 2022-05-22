import 'package:flutter/cupertino.dart';
import 'package:mechine_test/utils/base_provider.dart';

class EmployeeDeatailsProvider extends BaseProvider {
  bool isLoading = true;
  setLoading(bool status) {
    isLoading = status;
    notifyListeners();
  }
}
