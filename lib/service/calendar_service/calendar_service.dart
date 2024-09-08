import 'package:moto_maintanix/models/repo/maintenances_tables/maint_reminder_table/maint_reminder_table.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:simple_calendar_event/simple_calendar_event.dart';

class CalendarService {
  static Future<bool> getCalendarPermission() async {
    await Permission.calendarFullAccess.request();
    return await Permission.calendarFullAccess.isGranted;
  }

  static Future<MaintReminderTable?> addOrRemoveReminderToCalendar(
      MaintReminderTable maintReminderTable) async {
    if (!await getCalendarPermission()) return null;
    final dateTime = DateTime.parse(maintReminderTable.date);
    final newDate = dateTime.add(const Duration(hours: 10));
    final calendars = await SimpleCalendarEvent.getCalendars();
    final eventId = await SimpleCalendarEvent.addEventToCalendar(
      model: CalendarEventModel(
        title: maintReminderTable.title,
        description: maintReminderTable.description!,
        location: maintReminderTable.location ?? '',
        startTime: newDate,
        endTime: newDate.add(const Duration(hours: 8)),
        timeZone: 'America/New_York',
        calendarId: calendars.first.id,
      ),
    );
    maintReminderTable.calendarEventId = eventId.toString();
    return maintReminderTable;
    // This method is used to check if the user has permission to access the calendar
  }

  static Future<bool> removeReminderFromCalendar(
      MaintReminderTable maintReminderTable) async {
    if (!await getCalendarPermission()) return false;
    if (maintReminderTable.calendarEventId.isEmpty) return false;
    return await SimpleCalendarEvent.removeEvent(
        int.parse(maintReminderTable.calendarEventId));
  }
}
