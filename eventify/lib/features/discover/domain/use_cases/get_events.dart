import '../../../../stack/base/domain/use_case.dart';
import '../../../../stack/common/models/failure.dart';
import '../../../../stack/common/models/result.dart';
import '../entities/event.dart';
import '../repositories/event_repository.dart';

class GetEvents extends UseCase<void, List<Event>, void> {
  GetEvents(this._eventRepository, super.logger);

  final EventRepository _eventRepository;

  @override
  Future<Result<List<Event>, Failure>> execute({void params}) {
    return _eventRepository.getEvents();
  }
}
