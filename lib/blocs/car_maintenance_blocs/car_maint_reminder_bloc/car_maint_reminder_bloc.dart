import 'package:flutter/material.dart';
import 'package:moto_maintanix/models/repo/maintenances_tables/maint_table/maint_table.dart';
import 'package:moto_maintanix/service/maint_reminder_service/maint_reminder_service.dart';

import '../../../conf/flutter_conf.dart';
import '../../../models/repo/maintenances_tables/maint_reminder_table/maint_reminder_table.dart';

class CarMaintReminderBloc extends Cubit<MaintReminderTable?> {
  CarMaintReminderBloc() : super(null);

  void getReminders(MaintTable maintTable) {
    final reminder = MaintReminderService.getMaintRemainder(
        maintTable.vehicleId, maintTable.id!);
    if (reminder == null) {
      setReminder(maintTable);
      return;
    } else {
      emit(reminder);
    }
  }

  void setReminder(MaintTable maintTable) => emit(
        MaintReminderTable(
          vehicleId: maintTable.vehicleId,
          maintId: maintTable.id!,
          title: maintTable.maintType,
          description: maintTable.maintDescription,
          date: maintTable.nextMaintDate,
          completed: state?.completed ?? false,
          reminderStatus: state?.reminderStatus ?? false,
          addedToCalendar: state?.addedToCalendar ?? false,
          calendarEventId: state?.calendarEventId ?? '',
        ),
      );

  void clearReminder() {
    emit(null);
  }

  void saveReminder({
    required BuildContext context,
    required MaintReminderTable reminder,
    required MaintTable maintTable,
  }) {
    final count = MaintReminderService.saveMaintRemainder(reminder);
    if (count == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to save reminder'),
        ),
      );
      return;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          duration: Duration(milliseconds: 500),
          content: Text('Reminder updated successfully'),
        ),
      );
    }
    getReminders(maintTable);
  }

  void addEventToCalendar(
      BuildContext context, bool add, MaintTable maintTable) async {
    final reminder =
        await MaintReminderService.addOrRemoveReminderToCalendar(state!, add);
    if (context.mounted) {
      saveReminder(
          context: context, reminder: reminder, maintTable: maintTable);
    }
  }
}
