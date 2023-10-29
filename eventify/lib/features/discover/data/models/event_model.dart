import 'package:json_annotation/json_annotation.dart';

import 'attendee_model.dart';

part 'event_model.g.dart';

@JsonSerializable()
class EventModel {
  EventModel({
    required this.name,
    required this.date,
    required this.address,
    required this.attendees,
  });

  final String? name;
  final DateTime? date;
  final String? address;
  final List<AttendeeModel>? attendees;

  factory EventModel.fromJson(Map<String, dynamic> json) =>
      _$EventModelFromJson(json);

  Map<String, dynamic> toJson() => _$EventModelToJson(this);
}
