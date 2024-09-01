import 'package:flutter/material.dart';
import 'package:moto_maintanix/conf/flutter_conf.dart';
import 'package:moto_maintanix/models/repo/car_table_model/car_table_model.dart';
import 'package:moto_maintanix/models/repo/maintenances_tables/maint_table/maint_table.dart';
import 'package:moto_maintanix/views/add_edit_maint_view/widgets/06_main_attached_files_widget/main_attached_files_widget.dart';
import 'package:moto_maintanix/views/add_edit_maint_view/widgets/03_maint_date_widget/maint_date_widget.dart';
import 'package:moto_maintanix/views/add_edit_maint_view/widgets/02_maint_details_widget/maint_details_widget.dart';
import 'package:moto_maintanix/views/add_edit_maint_view/widgets/08_maint_estimated_time_widget/maint_estimated_time_widget.dart';
import 'package:moto_maintanix/views/add_edit_maint_view/widgets/04_maint_odo_widget/maint_odo_widget.dart';
import 'package:moto_maintanix/views/add_edit_maint_view/widgets/07_maint_other_notes_widget/maint_other_notes_widget.dart';
import 'package:moto_maintanix/views/add_edit_maint_view/widgets/05_maint_part_cost_widget/maint_part_cost_widget.dart';

import 'widgets/01_maint_type_widget/maint_type_widget.dart';

class AddEditMaint extends StatefulWidget {
  const AddEditMaint({super.key, required this.car, required this.maint});
  final CarTableModel car;
  final MaintTable? maint;

  @override
  State<AddEditMaint> createState() => _AddEditMaintState();
}

class _AddEditMaintState extends State<AddEditMaint> {
  @override
  void initState() {
    context.read<CarMaintBloc>().initMaint(context, widget.maint);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 150.0,
              floating: false,
              pinned: false,
              elevation: 8,
              // backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              surfaceTintColor: Colors.transparent,
              flexibleSpace: const FlexibleSpaceBar(
                title: Text('Maintenance creation'),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Tooltip(
                    message:
                        '${widget.car.brand} ${widget.car.model} ${widget.car.year!}',
                    child: const Icon(Icons.info),
                  ),
                ),
              ],
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const MaintTypeWidget(),
                    const MaintDetailsWidget(),
                    const MaintDateWidget(),
                    const MaintOdoWidget(),
                    const MaintPartCostWidget(),
                    const MainAttachedFilesWidget(),
                    const MaintOtherNotesWidget(),
                    const MaintEstimatedTimeWidget(),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        if (widget.maint != null)
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromARGB(255, 179, 12, 0),
                                    elevation: 8,
                                  ),
                                  onPressed: () {
                                    context.read<CarMaintBloc>().deleteMaint(
                                        context, widget.car.id!, widget.maint);
                                  },
                                  child: const Text('Delete')),
                            ),
                          ),
                        Expanded(
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: ThemeX.floatingButtonColor,
                                elevation: 8,
                              ),
                              onPressed: () {
                                context.read<CarMaintBloc>().saveMaint(
                                    context, widget.car.id!, widget.maint);
                              },
                              child: Text(
                                  widget.maint != null ? 'Update' : 'Save')),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
