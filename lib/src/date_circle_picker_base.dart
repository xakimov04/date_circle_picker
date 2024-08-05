import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class DatePickerScreen extends StatefulWidget {
  final String month;
  final String day;
  final String year;

  const DatePickerScreen({
    super.key,
    required this.month,
    required this.day,
    required this.year,
  });

  @override
  State<DatePickerScreen> createState() => _DatePickerScreenState();
}

class _DatePickerScreenState extends State<DatePickerScreen> {
  late int selectedMonthIndex;
  late int selectedDayIndex;
  late int selectedYearIndex;
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    final months = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ];
    final days = List.generate(31, (index) => (index + 1).toString());
    final years = List.generate(80, (index) => (DateTime.now().year - index).toString());

    selectedMonthIndex = months.indexOf(widget.month);
    selectedDayIndex = days.indexOf(widget.day);
    selectedYearIndex = years.indexOf(widget.year);
  }

  Future<void> _playSound() async {
    await _audioPlayer.play(AssetSource('assets/music/scroll2.mp3'),
        mode: PlayerMode.lowLatency);
  }

  @override
  Widget build(BuildContext context) {
    final months = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ];
    final days = List.generate(31, (index) => (index + 1).toString());
    final years = List.generate(80, (index) => (DateTime.now().year - index).toString());

    return Padding(
      padding: const EdgeInsets.only(left: 65, right: 40, top: 15),
      child: SizedBox(
        height: 180,
        width: 250,
        child: Stack(
          children: [
            const Align(
              child: Padding(
                padding: EdgeInsets.only(right: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Divider(
                      thickness: 1,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 30),
                    Divider(
                      color: Colors.grey,
                      thickness: 1,
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                _buildPicker(
                  context,
                  months,
                  selectedMonthIndex,
                  (index) => setState(() {
                    selectedMonthIndex = index;
                    _playSound();
                  }),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 7),
                    child: Row(
                      children: [
                        _buildPicker(
                          context,
                          days,
                          selectedDayIndex,
                          (index) => setState(() {
                            selectedDayIndex = index;
                            _playSound();
                          }),
                        ),
                        _buildPicker(
                          context,
                          years,
                          selectedYearIndex,
                          (index) => setState(() {
                            selectedYearIndex = index;
                            _playSound();
                          }),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPicker(
    BuildContext context,
    List<String> items,
    int selectedIndex,
    ValueChanged<int> onSelectedItemChanged,
  ) {
    int lastPlayedIndex = selectedIndex;

    return Expanded(
      child: ListWheelScrollView.useDelegate(
        controller: FixedExtentScrollController(initialItem: selectedIndex),
        physics: const FixedExtentScrollPhysics(),
        itemExtent: 40,
        onSelectedItemChanged: (index) {
          if (lastPlayedIndex != index) {
            onSelectedItemChanged(index % items.length);
            lastPlayedIndex = index;
          }
        },
        childDelegate: ListWheelChildBuilderDelegate(
          builder: (context, index) {
            final itemIndex = index % items.length;
            final isSelected = itemIndex == selectedIndex;
            return DatePickerItem(item: items[itemIndex], isSelected: isSelected);
          },
        ),
      ),
    );
  }
}

class DatePickerItem extends StatelessWidget {
  final String item;
  final bool isSelected;

  const DatePickerItem({super.key, required this.item, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          item,
          style: TextStyle(
            color: isSelected ? Colors.green : Colors.grey.withOpacity(.7),
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}

