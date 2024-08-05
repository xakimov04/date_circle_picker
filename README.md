# Date Picker

A customizable and visually appealing date picker widget for Flutter applications. The `date_picker` package provides a user-friendly interface for selecting dates, with smooth scrolling and sound effects for an enhanced user experience.

## Features

- **Interactive Date Selection**: Choose dates using a wheel picker interface with separate pickers for months, days, and years.
- **Smooth Scrolling**: Utilizes `ListWheelScrollView` for an elegant and responsive scrolling experience.
- **Customizable Appearance**: Easily style the date picker with customizable fonts, colors, and item sizes.
- **Sound Feedback**: Includes sound effects for interactions, adding delightful auditory feedback to the date selection process.

## Installation

Add the package to your `pubspec.yaml` file:

```yaml
dependencies:
  date_picker: ^1.0.0
```
## Example
```dart
import 'package:date_picker/date_picker.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Date Picker Example'),
      ),
      body: Center(
        child: DatePickerScreen(
          month: 'January',
          day: '1',
          year: '2024',
        ),
      ),
    );
  }
}
```
