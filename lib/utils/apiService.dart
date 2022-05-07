import 'package:dio/dio.dart';
import 'package:easy_loader/easy_loader.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class ApiService {
  late Dio _dio;
  ApiService() {
    _dio = Dio();
  }
  Future<dynamic> get(String endPoint) async {
    try {
      EasyLoading.show(status: 'Downloading...');
      Response response = await _dio.get(endPoint);
      EasyLoading.dismiss();
      return response.data;
    } catch (e) {
      print(e);
      EasyLoading.showError('Something went Wrong');
    }
  }
}
