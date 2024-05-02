
import 'package:flutter/cupertino.dart';

import '../models/menus.dart';
import '../services/apiservice.dart';

class Menuprovider extends ChangeNotifier{
  final ApiService dataService = ApiService();


  List<Menus> dataList = [];

  List<Menus> get dataModels => dataList;

  Future<void> fetchData() async {
  try {
  dataList =(await dataService.getProducts())! ;
  notifyListeners();
  }
  catch (e) {
  print("Error:$e");
  }
  }

  Future<void> addData(Menus dataList) async {
  try {
  await dataService.addData(dataList);
  // dataService.fetchData();
  }
  catch (e) {
  print("Error data : $e");
    }
    }

}