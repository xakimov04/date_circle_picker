import 'package:equatable/equatable.dart';

abstract class DateEvent extends Equatable {
  const DateEvent();

  @override
  List<Object> get props => [];
}

class SelectMonth extends DateEvent {
  final int monthIndex;

  const SelectMonth(this.monthIndex);

  @override
  List<Object> get props => [monthIndex];
}

class SelectDay extends DateEvent {
  final int dayIndex;

  const SelectDay(this.dayIndex);

  @override
  List<Object> get props => [dayIndex];
}

class SelectYear extends DateEvent {
  final int yearIndex;

  const SelectYear(this.yearIndex);

  @override
  List<Object> get props => [yearIndex];
}
