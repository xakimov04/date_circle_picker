import 'package:equatable/equatable.dart';

class DateState extends Equatable {
  final int selectedMonthIndex;
  final int selectedDayIndex;
  final int selectedYearIndex;

  const DateState({
    this.selectedMonthIndex = 0,
    this.selectedDayIndex = 0,
    this.selectedYearIndex = 0,
  });

  DateState copyWith({
    int? selectedMonthIndex,
    int? selectedDayIndex,
    int? selectedYearIndex,
  }) {
    return DateState(
      selectedMonthIndex: selectedMonthIndex ?? this.selectedMonthIndex,
      selectedDayIndex: selectedDayIndex ?? this.selectedDayIndex,
      selectedYearIndex: selectedYearIndex ?? this.selectedYearIndex,
    );
  }

  @override
  List<Object> get props => [
        selectedMonthIndex,
        selectedDayIndex,
        selectedYearIndex,
      ];
}
