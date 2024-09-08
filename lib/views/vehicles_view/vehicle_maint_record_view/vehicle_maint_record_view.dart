import 'package:flutter/material.dart';
import 'package:moto_maintanix/models/repo/files_table_mode/files_table_mode.dart';
import 'package:moto_maintanix/views/vehicles_view/vehicle_maint_record_view/widgets/0.7.maint_attached_files/maint_attached_files.dart';
import 'package:moto_maintanix/views/vehicles_view/vehicle_maint_record_view/widgets/0.4.maint_car_odometer/maint_car_odometer.dart';
import 'package:moto_maintanix/views/vehicles_view/vehicle_maint_record_view/widgets/0.2.maint_dates/maint_dates.dart';
import 'package:moto_maintanix/views/vehicles_view/vehicle_maint_record_view/widgets/0.6.maint_estimated_time/maint_estimated_time.dart';
import 'package:moto_maintanix/views/vehicles_view/vehicle_maint_record_view/widgets/0.3.maint_part_cost/maint_part_cost.dart';
import 'package:moto_maintanix/views/vehicles_view/vehicle_maint_record_view/widgets/0.8.maint_reminder_button/maint_remainder_button.dart';
import 'package:moto_maintanix/views/vehicles_view/vehicle_maint_record_view/widgets/0.1.maint_types_and_descrip/maint_types_descrip.dart';

import '../../../conf/flutter_conf.dart';
import 'widgets/0.5.maint_other_notes/maint_other_notes.dart';

class VehicleMaintRecordView extends StatelessWidget {
  const VehicleMaintRecordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 120.0,
            floating: false,
            pinned: true,
            surfaceTintColor: Colors.transparent,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            flexibleSpace: const FlexibleSpaceBar(
              title: Text('Maintenance Record'),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const MaintTypeAndDescription(),
                const MaintDates(),
                const MaintPartCost(),
                const MaintCarOdometer(),
                const MaintOtherNotes(),
                const MaintEstimatedTime(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const MaintAttachedFiles(),
                      BlocBuilder<CarMaintFilesBloc, List<FilesTableModel>>(
                        builder: (context, state) {
                          if (state.isEmpty) {
                            return const SizedBox.shrink();
                          }
                          return const SizedBox(width: 10);
                        },
                      ),
                      const MaintRemainderButton(),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
