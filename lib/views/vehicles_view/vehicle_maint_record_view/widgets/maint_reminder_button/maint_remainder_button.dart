import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moto_maintanix/blocs/car_maintenance_blocs/car_maint_bloc/car_maint_bloc.dart';
import 'package:moto_maintanix/models/repo/maintenances_tables/maint_reminder_table/maint_reminder_table.dart';

import '../../../../../blocs/car_maintenance_blocs/car_maint_reminder_bloc/car_maint_reminder_bloc.dart';

class MaintRemainderButton extends StatelessWidget {
  const MaintRemainderButton({super.key});

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 18,
      color: Colors.black,
    );
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(153, 255, 68, 0),
        ),
        onPressed: () {
          final maintState = context.read<CarMaintBloc>().state;
          if (maintState == null) {
            return;
          }
          context.read<CarMaintReminderBloc>().getReminders(maintState);
          showModalBottomSheet(
            backgroundColor: Colors.transparent,
            context: context,
            builder: (context) => Scaffold(
              backgroundColor: Colors.transparent,
              body: Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 8,
                      width: 60,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 25),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 80,
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(237, 0, 0, 0),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                            padding: const EdgeInsets.all(15),
                            child: Center(
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.car_repair_rounded,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    'Vehicle Maintenance Reminder',
                                    style: textStyle.copyWith(
                                        fontSize: 20, color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          BlocBuilder<CarMaintReminderBloc,
                              MaintReminderTable?>(
                            builder: (context, state) {
                              if (state == null) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      state.title.toString(),
                                      style: textStyle,
                                    ),
                                    Text(
                                      state.description.toString(),
                                      style: textStyle.copyWith(
                                        color: Colors.grey,
                                        fontSize: 16,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      'Notification Date: ${maintState.nextMaintDate.toString()}',
                                      style: textStyle.copyWith(
                                        color: Colors.grey,
                                        fontSize: 16,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: List.generate(
                                        3,
                                        (index) {
                                          return SwitchListTile(
                                            activeColor: const Color.fromARGB(
                                                255, 0, 17, 255),
                                            activeTrackColor:
                                                Colors.grey.shade300,
                                            inactiveTrackColor:
                                                Colors.grey.shade300,
                                            dense: true,
                                            contentPadding: EdgeInsets.zero,
                                            title: Row(
                                              children: [
                                                Icon(index == 0
                                                    ? Icons.notifications
                                                    : index == 1
                                                        ? Icons.check
                                                        : Icons.calendar_month),
                                                const SizedBox(width: 10),
                                                Text(
                                                  index == 0
                                                      ? 'Set Reminder'
                                                      : index == 1
                                                          ? 'Maintenance Completed?'
                                                          : 'Add to Calendar',
                                                  style: textStyle.copyWith(
                                                      color: Colors.black),
                                                ),
                                              ],
                                            ),
                                            value: index == 0
                                                ? state.reminderStatus
                                                : index == 1
                                                    ? state.completed
                                                    : state.addedToCalendar,
                                            onChanged: (value) {
                                              if (index == 0) {
                                                state.reminderStatus = value;
                                              } else if (index == 1) {
                                                state.completed = value;
                                              } else if (index == 2) {
                                                state.addedToCalendar = value;
                                                context
                                                    .read<
                                                        CarMaintReminderBloc>()
                                                    .addEventToCalendar(
                                                        context, value);
                                              }
                                              context
                                                  .read<CarMaintReminderBloc>()
                                                  .saveReminder(
                                                    context: context,
                                                    reminder: state,
                                                    maintTable: maintState,
                                                  );
                                            },
                                          );
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.notifications),
            SizedBox(width: 8),
            Flexible(
              child: Text(
                'Set Reminder',
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
