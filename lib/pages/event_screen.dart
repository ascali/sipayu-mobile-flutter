import 'package:flutter/material.dart';
import 'package:flutter_neat_and_clean_calendar/flutter_neat_and_clean_calendar.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:sipayu/pods/event_pod.dart';

class EventScreen extends StatefulHookConsumerWidget {
  const EventScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<StatefulHookConsumerWidget> createState() =>
      _EventScreenState();
}

class _EventScreenState extends ConsumerState<EventScreen> {
  @override
  void initState() {
    Future.microtask(() => ref.read(eventPodProvider.notifier).getEvent(
        DateTime.now().month.toString(), DateTime.now().year.toString()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final pod = ref.watch(eventPodProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Event Calender",
          style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Calendar(
          startOnMonday: true,
          eventTileHeight: 75,
          weekDays: const [
            'Senin',
            'Selasa',
            'Rabu',
            'Kamis',
            'Jumat',
            'Sabtu',
            'Minggu'
          ],
          eventsList: pod.valueOrNull
              ?.map((e) => NeatCleanCalendarEvent(e.name ?? '',
                  startTime:
                      DateTime.tryParse(e.dateEvent ?? '') ?? DateTime.now(),
                  endTime:
                      DateTime.tryParse(e.dateEvent ?? '') ?? DateTime.now(),
                  color: Colors.red,
                  isAllDay: true,
                  description: e.description ?? ''))
              .toList(),
          isExpandable: true,
          eventDoneColor: Colors.green,
          selectedColor: Colors.pink,
          selectedTodayColor: Colors.red,
          todayColor: Colors.blue,
          defaultDayColor: Colors.black,
          eventColor: null,
          locale: 'id-ID',
          todayButtonText: 'Event',
          allDayEventText: '',
          isExpanded: true,
          onMonthChanged: (date) {
            ref
                .read(eventPodProvider.notifier)
                .getEvent(date.month.toString(), date.year.toString());
          },
          expandableDateFormat: 'EEEE, dd. MMMM yyyy',
          datePickerType: DatePickerType.date,
          dayOfWeekStyle: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.w800, fontSize: 11),
        ),
      ),
    );
  }
}
