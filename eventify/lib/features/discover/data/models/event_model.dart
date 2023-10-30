import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/event.dart';

part 'event_model.g.dart';

@JsonSerializable()
class EventModel {
  EventModel({
    required this.name,
    required this.address,
    required this.date,
  });

  final String? name;
  final String? address;
  final DateTime? date;

  factory EventModel.fromJson(Map<String, dynamic> json) =>
      _$EventModelFromJson(json);

  Map<String, dynamic> toJson() => _$EventModelToJson(this);

  factory EventModel.fromEntity(Event entity) => EventModel(
        name: entity.name,
        address: entity.address,
        date: entity.date,
      );

  Event toEntity() => Event(
        name: name ?? 'N/A',
        address: address ?? 'N/A',
        date: date ?? DateTime(0),
      );
}
