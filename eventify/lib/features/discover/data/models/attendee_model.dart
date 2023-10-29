import 'package:json_annotation/json_annotation.dart';

part 'attendee_model.g.dart';

@JsonSerializable()
class AttendeeModel {
  AttendeeModel({
    required this.firstName,
    required this.lastName,
    required this.age,
  });

  final String firstName;
  final String lastName;
  final int age;

  factory AttendeeModel.fromJson(Map<String, dynamic> json) =>
      _$AttendeeModelFromJson(json);

  Map<String, dynamic> toJson() => _$AttendeeModelToJson(this);
}
