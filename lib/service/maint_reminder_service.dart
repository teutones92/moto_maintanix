import 'package:device_calendar/device_calendar.dart';
import 'package:moto_maintanix/models/repo/maintenances_tables/maint_reminder_table/maint_reminder_table.dart';
import 'package:moto_maintanix/service/object_box_service.dart';
import 'package:timezone/timezone.dart' as tz;

class MaintReminderService {
  static int saveMaintRemainder(MaintReminderTable reminderTable) {
    return ObjectBoxService.objectbox
        .createOrUpdateMaintReminder(reminderTable);
  }

  static MaintReminderTable? getMaintRemainder(int vehicleId, int maintId) {
    final reminders = ObjectBoxService.objectbox
        .getMaintReminders(vehicleId: vehicleId, maintId: maintId);
    return reminders.isEmpty ? null : reminders.first;
  }

  static Future<bool> addOrRemoveReminderToCalendar(
      MaintReminderTable reminderTable, bool add) async {
    final timezoneName = DateTime.now().timeZoneName;
    print(timezoneName);
    try {
      final timezone = tz.getLocation(timezoneName);
      print(timezone);
    } catch (e) {
      print(e);
    }
    bool isAdded = false;
    // final date = DateTime.parse(reminderTable.date);
    // final tzDate = TZDateTime.from(date, timezone);
    // final tzDateEnd = tzDate.add(const Duration(hours: 1));
    // final calendarPlugin = DeviceCalendarPlugin();
    // final event = Event(
    //   reminderTable.title,
    //   start: tzDate,
    //   end: tzDateEnd,
    // );
    // if (!add) {
    //   final calendars =
    //       await calendarPlugin.deleteEvent(event.calendarId, event.eventId);
    //   return isAdded = calendars.data ?? false;
    // }
    // final calendars = await calendarPlugin.createOrUpdateEvent(event);
    // isAdded = calendars?.data?.isNotEmpty ?? false;
    return isAdded;
  }
}
