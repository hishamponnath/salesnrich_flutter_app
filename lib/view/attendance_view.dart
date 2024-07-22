import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:salesnrich_app_flutter/model/attendancemodel.dart';
import 'package:salesnrich_app_flutter/service/attendance_service.dart';
import 'package:salesnrich_app_flutter/view/drawer_view.dart';

class AttendanceView extends StatefulWidget {
  const AttendanceView({super.key});

  @override
  State<AttendanceView> createState() => _AttendanceViewState();
}

class _AttendanceViewState extends State<AttendanceView> {
  final AttendanceService _attendanceService = AttendanceService();

  // Function to determine the color based on attendance status
  Color _getStatusColor(String? status) {
    switch (status?.toLowerCase()) {
      case 'present':
        return Colors.green;
      case 'leave':
        return Colors.red;
      case 'half_day_leave':
        return Colors.blueAccent;
      default:
        return Colors.grey[800]!;
    }
  }

  // Function to format date as dd MMMM yyyy
  String _formatDate(String? date) {
    if (date == null || date.isEmpty) return 'No Date';
    try {
      DateTime parsedDate = DateTime.parse(date);
      return DateFormat('dd-MMMM-yyyy').format(parsedDate);
    } catch (e) {
      return 'Invalid Date';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "View Attendance",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue[800],
      ),
      drawer: const Drawer(child: Drawerclass()),
      body: FutureBuilder(
        future: _attendanceService.getAllAttendance(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Attendancemodel> AttendanceList = snapshot.data!;
            return ListView.builder(
              itemCount: AttendanceList.length,
              itemBuilder: (context, index) {
                Attendancemodel attendance = AttendanceList[index];
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  elevation: 4.0,
                  color: const Color.fromARGB(255, 135, 167, 193),
                  child: ListTile(
                    leading: Container(
                      padding: const EdgeInsets.all(2.0), // Border width
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: CircleAvatar(
                        backgroundColor:
                            _getStatusColor(attendance.attendanceStatus),
                        child: const Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    title: Text(
                      _formatDate(attendance.createdDate),
                      style: const TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      attendance.remarks ?? 'No Remark',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                );
              },
            );
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
