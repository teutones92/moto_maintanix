import 'package:flutter/material.dart';
import 'package:moto_maintanix/models/repo/files_table_mode/files_table_mode.dart';
import 'package:moto_maintanix/views/vehicles_view/vehicle_maint_record_view/widgets/maint_attached_files/maint_attached_files.dart';
import 'package:moto_maintanix/views/vehicles_view/vehicle_maint_record_view/widgets/maint_car_odometer/maint_car_odometer.dart';
import 'package:moto_maintanix/views/vehicles_view/vehicle_maint_record_view/widgets/maint_dates/maint_dates.dart';
import 'package:moto_maintanix/views/vehicles_view/vehicle_maint_record_view/widgets/maint_estimated_time/maint_estimated_time.dart';
import 'package:moto_maintanix/views/vehicles_view/vehicle_maint_record_view/widgets/maint_part_cost/maint_part_cost.dart';
import 'package:moto_maintanix/views/vehicles_view/vehicle_maint_record_view/widgets/maint_reminder_button/maint_remainder_button.dart';
import 'package:moto_maintanix/views/vehicles_view/vehicle_maint_record_view/widgets/maint_types_descrip/maint_types_descrip.dart';

import '../../../conf/flutter_conf.dart';
import 'widgets/maint_other_notes/maint_other_notes.dart';

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
