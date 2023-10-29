import 'package:equatable/equatable.dart';

class Attendee extends Equatable {
  const Attendee({
    required this.firstName,
    required this.lastName,
    required this.age,
  });

  final String firstName;
  final String lastName;
  final int age;

  @override
  List<Object?> get props => [
        firstName,
        lastName,
        age,
      ];
}
