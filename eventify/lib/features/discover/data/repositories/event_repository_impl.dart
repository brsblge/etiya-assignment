import '../../../../stack/common/models/failure.dart';
import '../../../../stack/common/models/result.dart';
import '../../domain/entities/attendee.dart';
import '../../domain/entities/event.dart';
import '../../domain/repositories/event_repository.dart';

class EventRepositoryImpl implements EventRepository {
  @override
  Future<Result<List<Event>, Failure>> getEvents() async {
    await Future.delayed(const Duration(seconds: 3), () {});
    return Result.success(value: _createDummyEvents());
  }

  // Helpers
  List<Event> _createDummyEvents() {
    return [
      Event(
        name: 'Event 1',
        date: DateTime.now(),
        address: 'Address 1',
        attendees: const [
          Attendee(
            firstName: 'John',
            lastName: 'Doe',
            age: 27,
          ),
          Attendee(
            firstName: 'Jane',
            lastName: 'Doe',
            age: 25,
          ),
        ],
      ),
      Event(
        name: 'Event 2',
        date: DateTime.now(),
        address: 'Address 2',
        attendees: const [
          Attendee(
            firstName: 'John',
            lastName: 'Doe',
            age: 27,
          ),
        ],
      ),
      Event(
        name: 'Event 3',
        date: DateTime.now(),
        address: 'Address 3',
        attendees: const [
          Attendee(
            firstName: 'Jane',
            lastName: 'Doe',
            age: 25,
          ),
        ],
      ),
    ];
  }
  // - Helpers
}
