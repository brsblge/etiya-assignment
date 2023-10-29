part of 'event_cubit.dart';

sealed class EventState extends Equatable {
  const EventState();

  @override
  List<Object> get props => [];
}

final class EventInitial extends EventState {}

final class EventsLoading extends EventState {}

final class EventsLoaded extends EventState {
  const EventsLoaded({required this.events});

  final List<Event> events;

  @override
  List<Object> get props => [events];
}

final class EventsFailed extends EventState {}
