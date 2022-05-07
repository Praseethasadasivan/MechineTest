import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hive/hive.dart';

String boxName = 'settingsBox';

class DBService {
  static late Box _dbBox;
  static void registerDB() {
    _dbBox = Hive.box('dbBox');
  }

  void storeToDb(String key, dynamic value) async {
    try {
      EasyLoading.show();
      await Hive.box(boxName).put(key, value);
      EasyLoading.dismiss();
    } on Exception catch (e) {
      EasyLoading.showError('Something went wrong');
    }
  }

  Future<dynamic> readFromDB(String key) async {
    try {
      EasyLoading.show();
      var _data = await Hive.box(boxName).get(key);
      EasyLoading.dismiss();
      return _data;
    } catch (e) {
      EasyLoading.showError('Something went wrong');
    }
  }
}
