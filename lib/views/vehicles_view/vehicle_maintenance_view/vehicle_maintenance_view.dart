import 'package:flutter/material.dart';
import 'package:moto_maintanix/conf/flutter_conf.dart';
import 'package:moto_maintanix/conf/navigator_x.dart';
import 'package:moto_maintanix/models/repo/car_table_model/car_table_model.dart';
import 'package:moto_maintanix/models/repo/maintenances_tables/maint_table/maint_table.dart';
import 'package:moto_maintanix/views/add_edit_maint_view/add_edit_maint.dart';
import 'package:moto_maintanix/views/vehicles_view/vehicle_maint_record_view/vehicle_maint_record_view.dart';

import 'widgets/no_maint_records_widget.dart';

class VehicleMaintenanceView extends StatelessWidget {
  const VehicleMaintenanceView({super.key, required this.carItemModel});
  final CarTableModel carItemModel;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      context.read<CarListMaintBloc>().getMaintList(carItemModel.id!);
      return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: ThemeX.floatingButtonColor,
          onPressed: () {
            NavigatorX.push(
                context, AddEditMaint(car: carItemModel, maint: null));
            context.read<CarMaintBloc>().clearAll(context);
          },
          child: const Icon(Icons.add),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  expandedHeight: 150.0,
                  floating: false,
                  pinned: false,
                  surfaceTintColor: Colors.transparent,
                  actions: carItemModel.notes!.isNotEmpty
                      ? [
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Tooltip(
                              message: carItemModel.notes,
                              child: const Icon(Icons.info),
                            ),
                          ),
                        ]
                      : null,
                  flexibleSpace: FlexibleSpaceBar(
                    title: Hero(
                      tag: carItemModel.id!,
                      transitionOnUserGestures: true,
                      child: Material(
                        type: MaterialType.transparency,
                        child: ListTile(
                          title: Text(
                            '${carItemModel.brand} ${carItemModel.model} ${carItemModel.year}'
                                .toUpperCase(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          subtitle: const Text('Maintenance History'),
                        ),
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Row(
                    children: [
                      Expanded(
                        child: Card(
                          elevation: 10,
                          child: TextField(
                            onChanged: (value) {
                              context
                                  .read<CarListMaintBloc>()
                                  .searchMaintList(value, carItemModel.id!);
                            },
                            decoration: InputDecoration(
                              hintText: 'Search Maintenance Records',
                              prefixIcon: const Icon(Icons.search),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                        ),
                      ),
                      Card(
                        elevation: 10,
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: PopupMenuButton(
                              icon: const Icon(Icons.filter_list),
                              itemBuilder: (context) {
                                return List.generate(2, (index) {
                                  return PopupMenuItem(
                                    value: index,
                                    onTap: () {
                                      context
                                          .read<CarListMaintBloc>()
                                          .filterMaintList(index);
                                    },
                                    child: Align(
                                      child: Text(
                                        index == 0
                                            ? 'Sort by Date'
                                            : 'Sort by Type',
                                      ),
                                    ),
                                  );
                                });
                              }),
                        ),
                      ),
                      Card(
                        elevation: 10,
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: IconButton(
                            onPressed: () {
                              context
                                  .read<CarListMaintBloc>()
                                  .getMaintList(carItemModel.id!);
                            },
                            icon: const Icon(Icons.refresh),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 10)),
                BlocBuilder<CarListMaintBloc, List<MaintTable>>(
                  builder: (context, state) {
                    if (state.isEmpty) {
                      return const NoMaintRecordsWidget();
                    }
                    return SliverGrid.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10),
                      itemCount: state.length,
                      itemBuilder: (context, index) {
                        final maint = state[index];
                        return Stack(
                          children: [
                            InkWell(
                              borderRadius: BorderRadius.circular(10),
                              onTap: () {
                                NavigatorX.push(
                                    context, const VehicleMaintRecordView());
                                context
                                    .read<CarMaintBloc>()
                                    .setState(context, maint);
                              },
                              child: Card(
                                // margin: const EdgeInsets.all(10),
                                elevation: 15,
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                    context
                                        .read<CarMaintBloc>()
                                        .clearAll(context);
                                  },
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
