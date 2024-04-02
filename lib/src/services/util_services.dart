import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class UtilServices {
  String formatDateTime(DateTime dateTime) {
  tz.initializeTimeZones();

  String timeZoneName = 'Africa/Luanda';
  tz.Location timeZone = tz.getLocation(timeZoneName);

  tz.TZDateTime timeZoneDateTime = tz.TZDateTime.from(dateTime, timeZone);

  DateFormat dateFormat = DateFormat.yMd().add_Hms();
  return dateFormat.format(timeZoneDateTime);
}

  String formatDate(DateTime dateTime) {
    dateTime = dateTime.toLocal();
    DateFormat dateFormat = DateFormat.yMd('pt_PT');
    return dateFormat.format(dateTime);
  }

  void showToast({required String text, bool isError = false}) {
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 3,
      backgroundColor: isError ? Colors.red : Colors.white,
      textColor: isError ? Colors.white : Colors.black,
      fontSize: 16.0,
      webBgColor: isError ? "red" : "white",
      webPosition: "center",
    );
  }

  String formatTime(String timeString) {
  List<String> parts = timeString.split(':');
  int hours = int.parse(parts[0]);
  int minutes = int.parse(parts[1]);

  String formattedHour = hours < 10 ? '0$hours' : '$hours';

  String formattedMinute = minutes < 10 ? '0$minutes' : '$minutes';

  return '${formattedHour}h : ${formattedMinute}min';
}


  String getTimeString(Duration duration) {
    int hours = duration.inHours;
    int minutes = (duration.inMinutes.remainder(60));
    int seconds = (duration.inSeconds.remainder(60));

    String hoursStr = hours.toString().padLeft(2, '0');
    String minutesStr = minutes.toString().padLeft(2, '0');
    String secondsStr = seconds.toString().padLeft(2, '0');

    return '$hoursStr:$minutesStr:$secondsStr';
  }
}
