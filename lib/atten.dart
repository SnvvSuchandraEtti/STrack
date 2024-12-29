import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:animations/animations.dart';
import 'package:percent_indicator/percent_indicator.dart';

class AttendanceScreen extends StatefulWidget {
  @override
  _AttendanceScreenState createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> with SingleTickerProviderStateMixin {
  DateTime selectedDate = DateTime(2024, 10, 1);

  final Map<String, AttendanceEntry> attendanceData = {
    '2024-06-01': AttendanceEntry(status: 'present', notes: 'On time'),
    '2024-06-02': AttendanceEntry(status: 'present', notes: 'Participated in class discussion'),
    '2024-06-03': AttendanceEntry(status: 'present', notes: 'On time'),
    '2024-06-04': AttendanceEntry(status: 'present', notes: 'Active participation'),
    '2024-06-05': AttendanceEntry(status: 'present', notes: 'Completed assignment'),
    '2024-06-06': AttendanceEntry(status: 'present', notes: 'On time'),
    '2024-06-07': AttendanceEntry(status: 'holiday', notes: 'Ganesh Chaturthi'),
    '2024-06-08': AttendanceEntry(status: 'holiday', notes: 'Sunday'),
    '2024-06-09': AttendanceEntry(status: 'present', notes: 'On time'),
    '2024-06-10': AttendanceEntry(status: 'present', notes: 'Class presentation'),
    '2024-06-11': AttendanceEntry(status: 'present', notes: 'On time'),
    '2024-06-12': AttendanceEntry(status: 'present', notes: 'Participated in lab work'),
    '2024-06-13': AttendanceEntry(status: 'present', notes: 'On time'),
    '2024-06-14': AttendanceEntry(status: 'present', notes: 'On time'),
    '2024-06-15': AttendanceEntry(status: 'holiday', notes: 'Sunday'),
    '2024-06-16': AttendanceEntry(status: 'present', notes: 'Attended workshop'),
    '2024-06-17': AttendanceEntry(status: 'present', notes: 'On time'),
    '2024-06-18': AttendanceEntry(status: 'present', notes: 'Assignment submitted'),
    '2024-06-19': AttendanceEntry(status: 'present', notes: 'Active in group activity'),
    '2024-06-20': AttendanceEntry(status: 'present', notes: 'On time'),
    '2024-06-21': AttendanceEntry(status: 'present', notes: 'Asked insightful questions'),
    '2024-06-22': AttendanceEntry(status: 'holiday', notes: 'Sunday'),
    '2024-06-23': AttendanceEntry(status: 'present', notes: 'Completed project work'),
    '2024-06-24': AttendanceEntry(status: 'present', notes: 'Submitted lab report'),
    '2024-06-25': AttendanceEntry(status: 'half-day', notes: 'Left early for doctor appointment'),
    '2024-06-26': AttendanceEntry(status: 'present', notes: 'On time'),
    '2024-06-27': AttendanceEntry(status: 'present', notes: 'On time'),
    '2024-06-28': AttendanceEntry(status: 'holiday', notes: 'Festival holiday'),
    '2024-06-29': AttendanceEntry(status: 'holiday', notes: 'Sunday'),
    '2024-06-30': AttendanceEntry(status: 'present', notes: 'Participated in seminar'),

    // July 2024
    '2024-07-01': AttendanceEntry(status: 'present', notes: 'On time'),
    '2024-07-02': AttendanceEntry(status: 'present', notes: 'Participated in lab experiment'),
    '2024-07-03': AttendanceEntry(status: 'present', notes: 'On time'),
    '2024-07-04': AttendanceEntry(status: 'absent', notes: 'Sick leave'),
    '2024-07-05': AttendanceEntry(status: 'present', notes: 'On time'),
    '2024-07-06': AttendanceEntry(status: 'present', notes: 'Completed assignment'),
    '2024-07-07': AttendanceEntry(status: 'holiday', notes: 'Sunday'),
    '2024-07-08': AttendanceEntry(status: 'present', notes: 'On time'),
    '2024-07-09': AttendanceEntry(status: 'present', notes: 'Group project work'),
    '2024-07-10': AttendanceEntry(status: 'half-day', notes: 'Left early'),
    '2024-07-11': AttendanceEntry(status: 'present', notes: 'On time'),
    '2024-07-12': AttendanceEntry(status: 'present', notes: 'Attended seminar'),
    '2024-07-13': AttendanceEntry(status: 'present', notes: 'On time'),
    '2024-07-14': AttendanceEntry(status: 'holiday', notes: 'Sunday'),
    '2024-07-15': AttendanceEntry(status: 'present', notes: 'Participated in sports event'),
    '2024-07-16': AttendanceEntry(status: 'present', notes: 'On time'),
    '2024-07-17': AttendanceEntry(status: 'absent', notes: 'Family emergency'),
    '2024-07-18': AttendanceEntry(status: 'present', notes: 'Submitted assignment'),
    '2024-07-19': AttendanceEntry(status: 'present', notes: 'On time'),
    '2024-07-20': AttendanceEntry(status: 'present', notes: 'Participated in class activity'),
    '2024-07-21': AttendanceEntry(status: 'holiday', notes: 'Sunday'),
    '2024-07-22': AttendanceEntry(status: 'present', notes: 'On time'),
    '2024-07-23': AttendanceEntry(status: 'present', notes: 'Project presentation'),
    '2024-07-24': AttendanceEntry(status: 'half-day', notes: 'Left early for doctor appointment'),
    '2024-07-25': AttendanceEntry(status: 'present', notes: 'On time'),
    '2024-07-26': AttendanceEntry(status: 'present', notes: 'Attended lab session'),
    '2024-07-27': AttendanceEntry(status: 'holiday', notes: 'Optional holiday'),
    '2024-07-28': AttendanceEntry(status: 'holiday', notes: 'Sunday'),
    '2024-07-29': AttendanceEntry(status: 'present', notes: 'Class test'),
    '2024-07-30': AttendanceEntry(status: 'present', notes: 'Group discussion'),
    '2024-07-31': AttendanceEntry(status: 'absent', notes: 'Personal leave'),

    // August 2024
    '2024-08-01': AttendanceEntry(status: 'present', notes: 'On time'),
    '2024-08-02': AttendanceEntry(status: 'present', notes: 'Completed assignment'),
    '2024-08-03': AttendanceEntry(status: 'absent', notes: 'Family commitment'),
    '2024-08-04': AttendanceEntry(status: 'holiday', notes: 'Sunday'),
    '2024-08-05': AttendanceEntry(status: 'present', notes: 'On time'),
    '2024-08-06': AttendanceEntry(status: 'present', notes: 'Class quiz'),
    '2024-08-07': AttendanceEntry(status: 'present', notes: 'Participated in debate'),
    '2024-08-08': AttendanceEntry(status: 'absent', notes: 'Personal reasons'),
    '2024-08-09': AttendanceEntry(status: 'present', notes: 'Completed lab assignment'),
    '2024-08-10': AttendanceEntry(status: 'half-day', notes: 'Left early'),
    '2024-08-11': AttendanceEntry(status: 'holiday', notes: 'Sunday'),
    '2024-08-12': AttendanceEntry(status: 'present', notes: 'On time'),
    '2024-08-13': AttendanceEntry(status: 'present', notes: 'Participated in lab'),
    '2024-08-14': AttendanceEntry(status: 'present', notes: 'On time'),
    '2024-08-15': AttendanceEntry(status: 'holiday', notes: 'Independence Day'),
    '2024-08-16': AttendanceEntry(status: 'present', notes: 'On time'),
    '2024-08-17': AttendanceEntry(status: 'absent', notes: 'Sick leave'),
    '2024-08-18': AttendanceEntry(status: 'holiday', notes: 'Sunday'),
    '2024-08-19': AttendanceEntry(status: 'present', notes: 'Group project'),
    '2024-08-20': AttendanceEntry(status: 'present', notes: 'On time'),
    '2024-08-21': AttendanceEntry(status: 'absent', notes: 'Family event'),
    '2024-08-22': AttendanceEntry(status: 'present', notes: 'On time'),
    '2024-08-23': AttendanceEntry(status: 'present', notes: 'Submitted report'),
    '2024-08-24': AttendanceEntry(status: 'half-day', notes: 'Left early'),
    '2024-08-25': AttendanceEntry(status: 'holiday', notes: 'Sunday'),
    '2024-08-26': AttendanceEntry(status: 'present', notes: 'Completed assignment'),
    '2024-08-27': AttendanceEntry(status: 'present', notes: 'Group work'),
    '2024-08-28': AttendanceEntry(status: 'present', notes: 'Participated in class discussion'),
    '2024-08-29': AttendanceEntry(status: 'present', notes: 'On time'),
    '2024-08-30': AttendanceEntry(status: 'present', notes: 'Class quiz'),
    '2024-08-31': AttendanceEntry(status: 'absent', notes: 'Medical leave'),
    // September 2024
    '2024-09-01': AttendanceEntry(status: 'holiday', notes: 'Sunday'),
    '2024-09-02': AttendanceEntry(status: 'present', notes: 'On time'),
    '2024-09-03': AttendanceEntry(status: 'present', notes: 'Participated in presentation'),
    '2024-09-04': AttendanceEntry(status: 'present', notes: 'Completed group activity'),
    '2024-09-05': AttendanceEntry(status: 'absent', notes: 'Medical leave'),
    '2024-09-06': AttendanceEntry(status: 'present', notes: 'Attended workshop'),
    '2024-09-07': AttendanceEntry(status: 'present', notes: 'On time'),
    '2024-09-08': AttendanceEntry(status: 'holiday', notes: 'Sunday'),
    '2024-09-09': AttendanceEntry(status: 'present', notes: 'Lab assignment completed'),
    '2024-09-10': AttendanceEntry(status: 'present', notes: 'Participated in sports activity'),
    '2024-09-11': AttendanceEntry(status: 'present', notes: 'On time'),
    '2024-09-12': AttendanceEntry(status: 'present', notes: 'Class test taken'),
    '2024-09-13': AttendanceEntry(status: 'present', notes: 'Project submission'),
    '2024-09-14': AttendanceEntry(status: 'absent', notes: 'Personal leave'),
    '2024-09-15': AttendanceEntry(status: 'holiday', notes: 'Sunday'),
    '2024-09-16': AttendanceEntry(status: 'present', notes: 'Participated in lab'),
    '2024-09-17': AttendanceEntry(status: 'half-day', notes: 'Left early'),
    '2024-09-18': AttendanceEntry(status: 'present', notes: 'Group presentation'),
    '2024-09-19': AttendanceEntry(status: 'present', notes: 'On time'),
    '2024-09-20': AttendanceEntry(status: 'absent', notes: 'Family obligation'),
    '2024-09-21': AttendanceEntry(status: 'present', notes: 'On time'),
    '2024-09-22': AttendanceEntry(status: 'holiday', notes: 'Sunday'),
    '2024-09-23': AttendanceEntry(status: 'present', notes: 'Participated in discussion'),
    '2024-09-24': AttendanceEntry(status: 'present', notes: 'On time'),
    '2024-09-25': AttendanceEntry(status: 'present', notes: 'Completed assignment'),
    '2024-09-26': AttendanceEntry(status: 'absent', notes: 'Personal reason'),
    '2024-09-27': AttendanceEntry(status: 'present', notes: 'On time'),
    '2024-09-28': AttendanceEntry(status: 'present', notes: 'Participated in event'),
    '2024-09-29': AttendanceEntry(status: 'holiday', notes: 'Sunday'),
    '2024-09-30': AttendanceEntry(status: 'present', notes: 'On time'),

    // October 2024
    '2024-10-01': AttendanceEntry(status: 'present', notes: 'Submitted lab report'),
    '2024-10-02': AttendanceEntry(status: 'holiday', notes: 'Gandhi Jayanti'),
    '2024-10-03': AttendanceEntry(status: 'present', notes: 'Class quiz'),
    '2024-10-04': AttendanceEntry(status: 'present', notes: 'Participated in seminar'),
    '2024-10-05': AttendanceEntry(status: 'present', notes: 'On time'),
    '2024-10-06': AttendanceEntry(status: 'holiday', notes: 'Sunday'),
    '2024-10-07': AttendanceEntry(status: 'present', notes: 'On time'),
    '2024-10-08': AttendanceEntry(status: 'absent', notes: 'Sick leave'),
    '2024-10-09': AttendanceEntry(status: 'present', notes: 'Participated in project'),
    '2024-10-10': AttendanceEntry(status: 'present', notes: 'On time'),
    '2024-10-11': AttendanceEntry(status: 'present', notes: 'Class assignment submitted'),
    '2024-10-12': AttendanceEntry(status: 'present', notes: 'On time'),
    '2024-10-13': AttendanceEntry(status: 'holiday', notes: 'Sunday'),
    '2024-10-14': AttendanceEntry(status: 'present', notes: 'Attended lecture'),
    '2024-10-15': AttendanceEntry(status: 'present', notes: 'Group activity'),
    '2024-10-16': AttendanceEntry(status: 'present', notes: 'On time'),
    '2024-10-17': AttendanceEntry(status: 'present', notes: 'Participated in event'),
    '2024-10-18': AttendanceEntry(status: 'absent', notes: 'Medical leave'),
    '2024-10-19': AttendanceEntry(status: 'present', notes: 'On time'),
    '2024-10-20': AttendanceEntry(status: 'holiday', notes: 'Sunday'),
    '2024-10-21': AttendanceEntry(status: 'present', notes: 'Lab assignment completed'),
    '2024-10-22': AttendanceEntry(status: 'present', notes: 'On time'),
    '2024-10-23': AttendanceEntry(status: 'present', notes: 'Class discussion'),
    '2024-10-24': AttendanceEntry(status: 'present', notes: 'Submitted project'),
    '2024-10-25': AttendanceEntry(status: 'half-day', notes: 'Left early'),
    '2024-10-26': AttendanceEntry(status: 'present', notes: 'Attended group meeting'),
    // Add more entries for testing
  };

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    )..repeat(reverse: true);
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
  }

  Color _getAttendanceColor(String? status) {
    switch (status) {
      case 'present':
        return Colors.green;
      case 'absent':
        return Colors.red;
      case 'half-day':
        return Colors.lightGreen;
      case 'holiday':
        return Colors.grey;
      default:
        return Colors.blueGrey;
    }
  }

  String _getDateKey(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }

  double _calculateAttendance() {
    int totalWorkingDays = attendanceData.values.where((entry) => entry.status != 'holiday').length;
    int presentDays = attendanceData.values.where((entry) => entry.status == 'present').length;
    int halfDays = attendanceData.values.where((entry) => entry.status == 'half-day').length;

    return totalWorkingDays > 0 ? ((presentDays + (halfDays * 0.5)) / totalWorkingDays) * 100 : 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Your Attendance'),
          backgroundColor: Colors.orangeAccent,
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back), // Back icon
            onPressed: () {
              Navigator.of(context).pop(); // Navigate back
            },
          ),
        ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 10),
            _buildMonthSelector(),
            const SizedBox(height: 10),
            _buildAttendanceProgress(),
            const SizedBox(height: 10),
            Expanded(child: _buildCalendarGrid()),
            const SizedBox(height: 10),
            _buildAttendanceSummary(),
          ],
        ),
      ),
    );
  }

  Widget _buildMonthSelector() {
    List<DateTime> months = [
      DateTime(2024, 6),
      DateTime(2024, 7),
      DateTime(2024, 8),
      DateTime(2024, 9),
      DateTime(2024, 10),
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DropdownButton<DateTime>(
          value: selectedDate,
          items: months.map<DropdownMenuItem<DateTime>>((DateTime value) {
            return DropdownMenuItem<DateTime>(
              value: value,
              child: Text(DateFormat.yMMM().format(value)),
            );
          }).toList(),
          onChanged: (DateTime? newValue) {
            setState(() {
              if (newValue != null) {
                selectedDate = newValue;
                _controller.forward();
              }
            });
          },
        ),
      ],
    );
  }

  Widget _buildAttendanceProgress() {
    double attendancePercentage = _calculateAttendance();

    return Column(
      children: [
        const Text(
          'Overall Attendance',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        CircularPercentIndicator(
          radius: 80.0, // Decreased radius for progress indicator
          lineWidth: 8.0, // Decreased line width
          percent: attendancePercentage / 100,
          center: Text(
            '${attendancePercentage.toStringAsFixed(1)}%',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: attendancePercentage >= 75 ? Colors.green : Colors.red,
            ),
          ),
          progressColor: attendancePercentage >= 75 ? Colors.green : Colors.red,
          backgroundColor: Colors.grey.shade300,
        ),
      ],
    );
  }

  Widget _buildCalendarGrid() {
    int daysInMonth = DateUtils.getDaysInMonth(selectedDate.year, selectedDate.month);

    return GridView.builder(
      padding: const EdgeInsets.all(8.0), // Reduced padding
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
        crossAxisSpacing: 4.0, // Decreased cross axis spacing
        mainAxisSpacing: 4.0, // Decreased main axis spacing
      ),
      itemCount: daysInMonth,
      itemBuilder: (context, index) {
        DateTime day = DateTime(selectedDate.year, selectedDate.month, index + 1);
        String dateKey = _getDateKey(day);
        AttendanceEntry? entry = attendanceData[dateKey];

        return GestureDetector(
          onTap: () {
            _showAttendanceDetails(day, entry);
          },
          child: AnimatedOpacity(
            opacity: entry != null ? 1.0 : 0.4,
            duration: const Duration(milliseconds: 300),
            child: Container(
              height: 50, // Fixed height for calendar items
              decoration: BoxDecoration(
                color: _getAttendanceColor(entry?.status),
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4.0,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  '${day.day}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _showAttendanceDetails(DateTime day, AttendanceEntry? entry) {
    showModal(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Attendance Details for ${DateFormat.yMMMd().format(day)}'),
          content: Text('Status: ${entry?.status ?? "No data"}\nNotes: ${entry?.notes ?? "No notes"}'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildAttendanceSummary() {
    int totalPresent = attendanceData.values.where((entry) => entry.status == 'present').length;
    int totalAbsent = attendanceData.values.where((entry) => entry.status == 'absent').length;
    int totalHalfDay = attendanceData.values.where((entry) => entry.status == 'half-day').length;
    int totalHoliday = attendanceData.values.where((entry) => entry.status == 'holiday').length;

    return Container(
      width: 207, // Set the desired width
      height: 172, // Set the desired height
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.0)),
        color: Colors.white,
        elevation: 4.0,
        child: Padding(
          padding: const EdgeInsets.all(2.0), // Adjust padding as needed
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSummaryRow(Icons.check_circle, 'Total Present Days', totalPresent, Colors.green),
              _buildSummaryRow(Icons.cancel, 'Total Absent Days', totalAbsent, Colors.red),
              _buildSummaryRow(Icons.timelapse, 'Total Half Days', totalHalfDay, Colors.amber),
              _buildSummaryRow(Icons.beach_access, 'Total Holidays', totalHoliday, Colors.grey),
            ],
          ),
        ),
      ),
    );
  }



  Widget _buildSummaryRow(IconData icon, String title, int count, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: color),
          const SizedBox(width: 8),
          Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const Spacer(),
          Text(
            '$count',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: color),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class AttendanceEntry {
  final String status;
  final String notes;

  AttendanceEntry({required this.status, required this.notes});
}
