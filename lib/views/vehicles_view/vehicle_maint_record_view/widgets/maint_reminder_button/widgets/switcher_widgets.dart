import 'package:flutter/material.dart';
import 'package:moto_maintanix/models/repo/maintenances_tables/maint_reminder_table/maint_reminder_table.dart';
import 'package:moto_maintanix/models/repo/maintenances_tables/maint_table/maint_table.dart';
import 'package:moto_maintanix/service/notifications_service/notifications_service.dart';

import '../../../../../../conf/flutter_conf.dart';

class SwitchersWidget extends StatelessWidget {
  const SwitchersWidget(
      {super.key, required this.maintState, required this.textStyle});

  final MaintTable maintState;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CarMaintReminderBloc, MaintReminderTable?>(
      builder: (context, state) {
        if (state == null) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Padding(
          padding: const EdgeInsets.only(left: 8, right: 8, top: 0, bottom: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Text(
                  state.title.toString(),
                  style: textStyle.copyWith(),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                state.description.toString(),
                style: textStyle.copyWith(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
              Row(
                children: [
                  Text(
                    'Notification Date: ',
                    style: textStyle.copyWith(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    maintState.nextMaintDate.toString(),
                    style: textStyle.copyWith(
                      color: convertDateTime(maintState.nextMaintDate)
                          ? Colors.red
                          : Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              if (convertDateTime(maintState.nextMaintDate))
                Text(
                  'Maintenance date has passed',
                  style: textStyle.copyWith(
                    color: Colors.red,
                    fontSize: 16,
                  ),
                ),
              const SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: List.generate(
                  3,
                  (index) {
                    return SwitchListTile(
                      activeColor: const Color.fromARGB(255, 0, 17, 255),
                      activeTrackColor: Colors.grey.shade300,
                      inactiveTrackColor: Colors.grey.shade300,
                      dense: true,
                      contentPadding: EdgeInsets.zero,
                      title: Row(
                        children: [
                          Icon(
                            index == 0
                                ? Icons.notifications
                                : index == 1
                                    ? Icons.check
                                    : Icons.calendar_month,
                            color: Colors.black,
                          ),
                          const SizedBox(width: 10),
                          Flexible(
                            child: Text(
                              index == 0
                                  ? 'Set Reminder'
                                  : index == 1
                                      ? 'Maintenance Completed?'
                                      : 'Add to Calendar',
                              style: textStyle.copyWith(
                                color: Colors.black,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      value: index == 0
                          ? state.reminderStatus
                          : index == 1
                              ? state.completed
                              : state.addedToCalendar,
                      onChanged: convertDateTime(maintState.nextMaintDate)
                          ? null
                          : (value) {
                              final bloc = context.read<CarMaintReminderBloc>();
                              switch (index) {
                                case 0:
                                  if (value) {
                                    NotificationService.nService
                                        .setScheduledNotification(maintState);
                                  } else {
                                    NotificationService.nService
                                        .cancelNotification(maintState);
                                  }
                                  state.reminderStatus = value;
                                  if (!context.mounted) return;
                                  bloc.saveReminder(
                                    context: context,
                                    reminder: state,
                                    maintTable: maintState,
                                  );

                                case 1:
                                  state.completed = value;
                                  bloc.saveReminder(
                                    context: context,
                                    reminder: state,
                                    maintTable: maintState,
                                  );
                                case 2:
                                  state.addedToCalendar = value;
                                  context
                                      .read<CarMaintReminderBloc>()
                                      .addEventToCalendar(
                                          context, value, maintState);
                              }
                            },
                    );
                    // });
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }

  bool convertDateTime(String nextDateTime) {
    return DateTime.parse(nextDateTime).isBefore(DateTime.now());
  }
}
