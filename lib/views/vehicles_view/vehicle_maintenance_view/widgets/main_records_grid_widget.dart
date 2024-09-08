import 'package:flutter/material.dart';
import 'package:moto_maintanix/models/repo/car_table_model/car_table_model.dart';
import 'package:moto_maintanix/models/repo/maintenances_tables/maint_table/maint_table.dart';
import 'package:moto_maintanix/views/add_edit_maint_view/add_edit_maint.dart';
import 'package:moto_maintanix/views/vehicles_view/vehicle_maint_record_view/vehicle_maint_record_view.dart';

import '../../../../conf/flutter_conf.dart';
import '../../../../conf/navigator_x.dart';

class MaintRecordsGridWidget extends StatelessWidget {
  const MaintRecordsGridWidget({
    super.key,
    required this.carItemModel,
    required this.state,
  });

  final CarTableModel carItemModel;
  final List<MaintTable> state;

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
      itemCount: state.length,
      itemBuilder: (context, index) {
        final maint = state[index];
        return Stack(
          children: [
            InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () {
                NavigatorX.push(context, const VehicleMaintRecordView());
                context.read<CarMaintBloc>().setState(context, maint);
              },
              child: Card(
                // margin: const EdgeInsets.all(10),
                elevation: 15,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          maint.maintType,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          'Date: ${maint.maintDate}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          'Next maintenance date: ${maint.nextMaintDate.isEmpty ? 'N/A' : maint.nextMaintDate}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color.fromARGB(255, 148, 10, 0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.red.withOpacity(0.8),
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: IconButton(
                  color: Colors.white,
                  icon: const Icon(Icons.edit_document),
                  onPressed: () {
                    NavigatorX.push(
                        context,
                        AddEditMaint(
                          car: carItemModel,
                          maint: maint,
                        ));
                    context.read<CarMaintBloc>().clearAll(context);
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
