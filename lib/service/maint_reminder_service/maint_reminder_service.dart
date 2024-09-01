import 'package:device_calendar/device_calendar.dart';
import 'package:moto_maintanix/models/repo/maintenances_tables/maint_reminder_table/maint_reminder_table.dart';
import 'package:moto_maintanix/service/object_box_service/object_box_service.dart';

class MaintReminderService {
  // This is the instance of the DeviceCalendarPlugin
  static final deviceCalendar = DeviceCalendarPlugin();

  // This method is used to save the maintenance reminder to the database
  static int saveMaintRemainder(MaintReminderTable reminderTable) {
    return ObjectBoxService.objectbox
        .createOrUpdateMaintReminder(reminderTable);
  }

  static MaintReminderTable? getMaintRemainder(int vehicleId, int maintId) {
    final reminders = ObjectBoxService.objectbox
        .getMaintReminders(vehicleId: vehicleId, maintId: maintId);
    return reminders.isEmpty ? null : reminders.first;
  }

  static Future<bool> getCalendarPermission() {
    return deviceCalendar.hasPermissions().then((value) => value.data ?? false);
  }

  // This method is used to check if the user has permission to access the calendar

  static Future<MaintReminderTable> addOrRemoveReminderToCalendar(
      MaintReminderTable reminderTable, bool add) async {
    try {
      final parsedDate = DateTime.parse(reminderTable.date);
      final calendarsResult = await deviceCalendar.retrieveCalendars();
      // Verify if the calendarsResult.data is null or empty
      if (calendarsResult.data == null || calendarsResult.data!.isEmpty) {
        throw Exception('No calendars found on the device.');
      }
      final calendarId = calendarsResult.data!.first.id;
      // Verify if the calendarId is null
      if (calendarId == null) {
        throw Exception('The first calendar ID is null.');
      }
      final calendarEvent = Event(
        calendarId,
        title: reminderTable.title,
        description: reminderTable.description,
        start:
            TZDateTime.local(parsedDate.year, parsedDate.month, parsedDate.day),
        end: TZDateTime.local(
            parsedDate.year, parsedDate.month, parsedDate.day + 1),
      );
      if (add) {
        final resp = await deviceCalendar.createOrUpdateEvent(calendarEvent);
        reminderTable.calendarEventId = resp?.data ?? '';
        saveMaintRemainder(reminderTable);
      } else {
        await deviceCalendar.deleteEvent(
            calendarId, reminderTable.calendarEventId);
      }
    } catch (_) {
      // print('Error: $e');
    }
    return reminderTable;
  }
}
