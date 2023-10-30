import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/event.dart';
import '../../domain/use_cases/get_events.dart';

part 'event_state.dart';

class EventCubit extends Cubit<EventState> {
  EventCubit(this._getEvents) : super(EventInitial());

  final GetEvents _getEvents;

  void fetchEvents() async {
    emit(EventsLoading());
    final result = await _getEvents();
    emit(
      result.isSuccessful
          ? EventsLoaded(events: result.value!)
          : EventsFailed(),
    );
  }
}
