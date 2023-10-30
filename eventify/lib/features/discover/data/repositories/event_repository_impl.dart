import '../../../../stack/common/models/failure.dart';
import '../../../../stack/common/models/result.dart';
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
      ),
      Event(
        name: 'Event 2',
        date: DateTime.now(),
        address: 'Address 2',
      ),
      Event(
        name: 'Event 3',
        date: DateTime.now(),
        address: 'Address 3',
      ),
      Event(
        name: 'Event 4',
        date: DateTime.now(),
        address: 'Address 4',
      ),
      Event(
        name: 'Event 5',
        date: DateTime.now(),
        address: 'Address 5',
      ),
      Event(
        name: 'Event 6',
        date: DateTime.now(),
        address: 'Address 6',
      ),
      Event(
        name: 'Event 7',
        date: DateTime.now(),
        address: 'Address 7',
      ),
      Event(
        name: 'Event 8',
        date: DateTime.now(),
        address: 'Address 8',
      ),
      Event(
        name: 'Event 9',
        date: DateTime.now(),
        address: 'Address 9',
      ),
    ];
  }
  // - Helpers
}
