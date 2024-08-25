import 'package:flutter/material.dart';
import 'package:moto_maintanix/conf/flutter_conf.dart';

class HomeCarListControllerBloc extends Cubit<bool> {
  HomeCarListControllerBloc() : super(false);
  ScrollController carListController = ScrollController();

  void controllerListener() {
    carListController.addListener(() {
      // if (carListController.position.atEdge) {
      if (carListController.position.pixels >= 10) {
        emit(true);
      } else {
        emit(false);
        // }
      }
    });
  }
}
