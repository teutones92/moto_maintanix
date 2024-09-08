import 'package:flutter/material.dart';
import 'package:moto_maintanix/models/repo/maintenances_tables/maint_table/maint_table.dart';
import 'package:moto_maintanix/service/calendar_service/calendar_service.dart';
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
          id: state?.id,
          vehicleId: maintTable.vehicleId,
          maintId: maintTable.id!,
          title: maintTable.maintType,
          description: maintTable.maintDescription,
          date: maintTable.nextMaintDate,
          location: maintTable.location,
          completed: state?.completed ?? false,
          reminderStatus: state?.reminderStatus ?? false,
          addedToCalendar: state?.addedToCalendar ?? false,
          calendarEventId: state?.calendarEventId ?? '',
        ),
      );

  void saveReminder({
    required BuildContext context,
    required MaintReminderTable reminder,
    required MaintTable maintTable,
    bool showSnack = true,
  }) {
    final count = MaintReminderService.saveMaintRemainder(reminder);
    getReminders(maintTable);
    if (!showSnack) return;
    if (count == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to save reminder'),
        ),
      );
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        duration: Duration(milliseconds: 500),
        content: Text('Reminder updated successfully'),
      ),
    );
  }

  void addEventToCalendar(
      BuildContext context, bool add, MaintTable maintTable) async {
    final reminder =
        await CalendarService.addOrRemoveReminderToCalendar(state!);
    if (context.mounted) {
      if (reminder == null) {
        return;
      }
      saveReminder(
          context: context, reminder: reminder, maintTable: maintTable);
    }
  }

  void removeEventFromCalendar(
      BuildContext context, MaintTable maintTable) async {
    final reminder = state!;
    final removed = await CalendarService.removeReminderFromCalendar(reminder);
    if (context.mounted) {
      if (!removed) {
        return;
      }
      reminder.addedToCalendar = false;
      reminder.calendarEventId = '';
      saveReminder(
          context: context, reminder: reminder, maintTable: maintTable);
    }
  }

  void updateReminder(BuildContext context, MaintTable maintTable) {
    if (state == null) {
      setReminder(maintTable);
      return;
    }
    final reminderData = MaintReminderTable(
        id: state?.id,
        vehicleId: maintTable.vehicleId,
        maintId: maintTable.id!,
        calendarEventId: state!.calendarEventId,
        title: maintTable.maintType,
        description: maintTable.maintDescription,
        date: maintTable.maintDate,
        location: state!.location,
        completed: state!.completed,
        reminderStatus: state!.reminderStatus,
        addedToCalendar: state!.addedToCalendar);
    saveReminder(
      context: context,
      reminder: reminderData,
      maintTable: maintTable,
      showSnack: false,
    );
  }

  void clearReminder() => emit(null);
}
