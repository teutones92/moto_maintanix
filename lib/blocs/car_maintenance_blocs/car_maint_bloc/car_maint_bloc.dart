import 'package:flutter/material.dart';

import 'package:moto_maintanix/models/repo/maintenances_tables/maint_table/maint_table.dart';
import 'package:moto_maintanix/service/car_maint_service.dart';

import '../../../conf/flutter_conf.dart';

class CarMaintBloc extends Cubit<MaintTable?> {
  CarMaintBloc() : super(null);

  // This is the controller for the swap text field to wrap
  final ValueNotifier<bool> swapTextFieldToWrap = ValueNotifier<bool>(false);

  // This is the controller for the maintenance type
  final TextEditingController maintTypeController = TextEditingController();

  // This is the controller for the maintenance details
  final TextEditingController maintDetailsController = TextEditingController();

  // This is the controller for the maintenance date
  final ValueNotifier<String> maintDateController = ValueNotifier<String>('');

  // This is the controller for the next maintenance date
  final ValueNotifier<String> nextMaintDate = ValueNotifier<String>('');

  // This is the controller for the maintenance car odometer
  final TextEditingController maintCarOdoController = TextEditingController();

  // This is the controller for the other notes maintenance car field
  final TextEditingController maintOtherNotes = TextEditingController();

  // This is the controller for the maintenance estimated time
  final TextEditingController maintEstimatedTime = TextEditingController();

  void setState(BuildContext context, MaintTable maintTable) {
    context.read<CarMaintPartCostBloc>().getMaintCostList(
        vehicleId: maintTable.vehicleId, maintId: maintTable.id!);
    context
        .read<CarMaintFilesBloc>()
        .getFiles(maintTable.vehicleId, maintTable.id!);
    emit(maintTable);
  }

  void saveMaint(BuildContext context, int vehicleId) {
    if (maintTypeController.text.isEmpty ||
        maintDetailsController.text.isEmpty ||
        maintDateController.value.isEmpty ||
        nextMaintDate.value.isEmpty ||
        maintCarOdoController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill all the required fields'),
        ),
      );
      return;
    }
    final maintTable = MaintTable(
      vehicleId: vehicleId,
      maintType: maintTypeController.text,
      maintDescription: maintDetailsController.text,
      maintDate: maintDateController.value,
      nextMaintDate: nextMaintDate.value,
      carOdometer: int.parse(maintCarOdoController.text),
      otherNotes: maintOtherNotes.text,
      finishedTime: maintEstimatedTime.text,
    );
    final maintId = CarMaintService.addMaintRecord(maintTable);
    context.read<CarMaintPartCostBloc>().saveMaintCost(vehicleId, maintId);
    context.read<CarMaintFilesBloc>().saveMaintFile(vehicleId, maintId);
    clearAll(context);
    context.read<CarListMaintBloc>().getMaintList(vehicleId);
    Navigator.of(context).pop();
  }

  void clearAll(BuildContext context) {
    maintTypeController.clear();
    maintDetailsController.clear();
    maintDateController.value = '';
    maintCarOdoController.clear();
    maintOtherNotes.clear();
    maintEstimatedTime.clear();
    context.read<CarMaintPartCostBloc>().resetNotifierValue();
    context.read<CarMaintFilesBloc>().clearAll();
  }

  void resetState() => emit(null);
}
