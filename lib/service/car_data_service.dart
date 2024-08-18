import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:moto_maintanix/models/repo/cars_data_model/cars_data_model.dart';

class CarDataService {
  static Future<List<CarsDataModel>> getCarsData() async {
    List<CarsDataModel> carsDataModel = [];
    Dio dio = Dio();
    await Future.delayed(const Duration(milliseconds: 500));
    try {
      Response response = await dio.get(
          'https://raw.githubusercontent.com/teutones92/car_logos_data/main/logos/car-models.json');
      final data = jsonDecode(response.data.toString()) as List;

      carsDataModel = data.map((e) => CarsDataModel.fromJson(e)).toList();
      // for (var element in data) {
      //   print(element);
      //   carsDataModel.add(CarsDataModel.fromJson(element));
      // }
    } on DioException catch (e) {
      debugPrint(e.message);
    }
    return carsDataModel;
  }
}
