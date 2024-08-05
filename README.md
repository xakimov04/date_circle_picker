## Date Picker
A customizable and visually appealing date picker widget for Flutter applications. The date_picker package provides a user-friendly interface for selecting dates, with smooth scrolling and sound effects for an enhanced user experience.

## Features
Interactive Date Selection: Allows users to select a date using a wheel picker interface with separate pickers for months, days, and years.
Smooth Scrolling: Utilizes the ListWheelScrollView for an elegant and responsive scrolling experience.
Customizable Appearance: Easily style the date picker to fit your app's design with customizable fonts, colors, and item sizes.
Sound Feedback: Includes sound effects for interactions, adding a delightful auditory feedback to the date selection process.
Installation
Add the package to your pubspec.yaml file:


'''
dependencies:
  date_circle_picker: ^1.0.0
'''
Then, run flutter pub get to install the package.

## Usage
To use the DatePickerScreen widget, import the package and include it in your widget tree:

'''
import 'package:date_circle_picker/date_circle_picker.dart';

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
'''

## Example
Check out the example directory for a fully functional demonstration of the date picker in action.

## Customization
Customize the date picker by modifying the widget's properties:

- Fonts: Adjust text styles for selected and unselected items.
- Colors: Change the color scheme to match your app's theme.
- Item Sizes: Modify item heights and widths to fit your design requirements.
