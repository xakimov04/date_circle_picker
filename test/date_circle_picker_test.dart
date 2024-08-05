import 'package:date_circle_picker/bloc/date_bloc.dart';
import 'package:date_circle_picker/bloc/date_event.dart';
import 'package:date_circle_picker/bloc/date_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DateBloc', () {
    late DateBloc dateBloc;

    setUp(() {
      dateBloc = DateBloc();
    });

    tearDown(() {
      dateBloc.close();
    });

    test('initial state is correct', () {
      expect(dateBloc.state, DateState());
    });

    test('SelectMonth event updates state correctly', () {
      final expectedStates = [
        DateState(selectedMonthIndex: 5),
      ];

      expectLater(
        dateBloc.stream,
        emitsInOrder(expectedStates),
      );

      dateBloc.add(SelectMonth(5));
    });

    test('SelectDay event updates state correctly', () {
      final expectedStates = [
        DateState(selectedDayIndex: 10),
      ];

      expectLater(
        dateBloc.stream,
        emitsInOrder(expectedStates),
      );

      dateBloc.add(SelectDay(10));
    });

    test('SelectYear event updates state correctly', () {
      final expectedStates = [
        DateState(selectedYearIndex: 15),
      ];

      expectLater(
        dateBloc.stream,
        emitsInOrder(expectedStates),
      );

      dateBloc.add(SelectYear(15));
    });

    test('all events update state correctly together', () {
      final expectedStates = [
        DateState(selectedMonthIndex: 3),
        DateState(selectedDayIndex: 15),
        DateState(selectedYearIndex: 20),
      ];

      expectLater(
        dateBloc.stream,
        emitsInOrder(expectedStates),
      );

      dateBloc.add(SelectMonth(3));
      dateBloc.add(SelectDay(15));
      dateBloc.add(SelectYear(20));
    });
  });
}
