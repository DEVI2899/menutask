
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import '../models/menus.dart';
import '../services/apiservice.dart';

class Menuprovider extends ChangeNotifier{
  final ApiService apiService = ApiService();
  List<Menus> dataList = [];

  List<Menus> get dataMenus => dataList;

  Future<void> fetchData() async {
  try {
  dataList =(await apiService.getProducts())! ;
  notifyListeners();
  }
  catch (e) {
  if (kDebugMode) {
    print("Error:$e");
  }
  }
  }

  Future<void> addData(Menus dataList) async {
  try {
  await apiService.addData(dataList);
  // dataService.fetchData();
  }
  catch (e) {
  if (kDebugMode) {
    print("Error data : $e");
  }
    }
    }

}