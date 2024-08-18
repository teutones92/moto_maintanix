import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class CarDataService {
  static Future<void> getCarData() async {
    try {
      Dio dio = Dio();
      Response response = await dio.get(
          'https://raw.githubusercontent.com/teutones92/car_logos_data/main/logos/car-models.json');
      print(response.data);
    } on DioException catch (e) {
      debugPrint(e.message);
    }
  }
}
