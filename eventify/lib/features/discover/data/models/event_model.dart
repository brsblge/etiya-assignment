import 'package:json_annotation/json_annotation.dart';

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
}
