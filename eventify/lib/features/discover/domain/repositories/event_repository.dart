import '../../../../stack/common/models/failure.dart';
import '../../../../stack/common/models/result.dart';
import '../entities/event.dart';

abstract interface class EventRepository {
  Future<Result<List<Event>, Failure>> getEvents();
}
