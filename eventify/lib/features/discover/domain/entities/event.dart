import 'package:equatable/equatable.dart';

class Event extends Equatable {
  const Event({
    required this.name,
    required this.address,
    required this.date,
  });

  final String name;
  final String address;
  final DateTime date;

  @override
  List<Object?> get props => [
        name,
        address,
        date,
      ];
}
