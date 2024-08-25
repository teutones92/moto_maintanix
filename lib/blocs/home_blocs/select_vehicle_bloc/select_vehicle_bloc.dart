import 'package:flutter/material.dart';
import 'package:moto_maintanix/conf/flutter_conf.dart';

class SelectVehicleBloc extends Cubit<int> {
  SelectVehicleBloc() : super(0);

  void selectVehicle(BuildContext context, int index, int carId) {
    context.read<SoonestMaintCubit>().getSoonestMaintFromDB(carId);
    emit(index);
  }
}
