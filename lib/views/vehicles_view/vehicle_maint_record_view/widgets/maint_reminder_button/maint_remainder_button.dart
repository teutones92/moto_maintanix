import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moto_maintanix/blocs/car_maintenance_blocs/car_maint_bloc/car_maint_bloc.dart';
import 'package:moto_maintanix/service/maint_reminder_service/maint_reminder_service.dart';
import 'package:moto_maintanix/service/notifications_service/notifications_service.dart';

import '../../../../../blocs/car_maintenance_blocs/car_maint_reminder_bloc/car_maint_reminder_bloc.dart';
import 'widgets/modal_body_widget.dart';

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
          await MaintReminderService.getCalendarPermission();
          await NotificationService.nService.getNotificationPermission();
          if (!context.mounted) return;
          showModalBottomSheet(
            backgroundColor: Colors.transparent,
            context: context,
            builder: (context) {
              return ModalBodyWidget(maintState: maintState);
            },
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
