import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moto_maintanix/blocs/car_maintenance_blocs/car_maint_bloc/car_maint_bloc.dart';
import 'package:moto_maintanix/service/calendar_service/calendar_service.dart';
import 'package:moto_maintanix/service/notifications_service/notifications_service.dart';

import '../../../../../blocs/car_maintenance_blocs/car_maint_reminder_bloc/car_maint_reminder_bloc.dart';
import '../../../../modals_view/reminder_modal_view/reminder_modal_view.dart';

class MaintRemainderButton extends StatelessWidget {
  const MaintRemainderButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(153, 255, 68, 0),
        ),
        onPressed: () async {
          final maintState = context.read<CarMaintBloc>().state;
          if (maintState == null) {
            return;
          }
          context.read<CarMaintReminderBloc>().getReminders(maintState);
          await CalendarService.getCalendarPermission();
          await NotificationService.nService.getNotificationPermission();
          if (!context.mounted) return;
          await showModalBottomSheet(
            backgroundColor: Colors.transparent,
            context: context,
            builder: (context) {
              return ReminderModalView(maintState: maintState);
            },
          );
          if (context.mounted) {
            context.read<CarMaintReminderBloc>().clearReminder();
          }
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
