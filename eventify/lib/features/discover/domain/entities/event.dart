import 'package:equatable/equatable.dart';

import 'attendee.dart';

class Event extends Equatable {
  const Event({
    required this.name,
    required this.date,
    required this.address,
    required this.attendees,
  });

  final String name;
  final DateTime date;
  final String address;
  final List<Attendee> attendees;

  @override
  List<Object?> get props => [
        name,
        date,
        address,
        attendees,
      ];
}
