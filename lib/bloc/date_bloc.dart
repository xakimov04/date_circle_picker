import 'package:bloc/bloc.dart';
import 'date_event.dart';
import 'date_state.dart';

class DateBloc extends Bloc<DateEvent, DateState> {
  DateBloc() : super(DateState());

  @override
  Stream<DateState> mapEventToState(DateEvent event) async* {
    if (event is SelectMonth) {
      yield state.copyWith(selectedMonthIndex: event.monthIndex);
    } else if (event is SelectDay) {
      yield state.copyWith(selectedDayIndex: event.dayIndex);
    } else if (event is SelectYear) {
      yield state.copyWith(selectedYearIndex: event.yearIndex);
    }
  }
}
