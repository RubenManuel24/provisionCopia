import 'package:flutter/material.dart';
import '../../../../models/message_model.dart';

class TileMessage extends StatelessWidget {
  final MessageModel messageModel;
  final bool sentByMe;
  final double larguraContainer;

  TileMessage({
    Key? key,
    required this.messageModel,
    required this.sentByMe,
    required this.larguraContainer,
  }) : super(key: key);

  String getPeriodOfDay(int hour) {
    if (hour < 12) {
      return "da manhã";
    } else if (hour < 18) {
      return "da tarde";
    } else {
      return "da noite";
    }
  }

  String getFormattedTime(String dateTimeString) {
    DateTime dateTime = DateTime.parse(dateTimeString);
    int hour = dateTime.hour;
    int minute = dateTime.minute;
    String period = getPeriodOfDay(hour);
    String formattedHour = hour.toString().padLeft(2, '0');
    String formattedMinute = minute.toString().padLeft(2, '0');
    return "$formattedHour:$formattedMinute $period";
  }

  @override
  Widget build(BuildContext context) {
    String formattedTime = getFormattedTime(messageModel.createdAt);
     return Align(
  alignment: sentByMe ? Alignment.centerRight : Alignment.centerLeft,
  child: Padding(
    padding: EdgeInsets.all(6),
    child: Container(
      width: larguraContainer,
      padding: EdgeInsets.all(9),
      decoration: BoxDecoration(
        color: sentByMe
            ? Color.fromARGB(70, 213, 212, 211).withOpacity(1)
            : Color.fromARGB(255, 114, 145, 174).withOpacity(1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: sentByMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            messageModel.message,
            style: TextStyle(fontSize: 15, color: Colors.black),
          ),
          SizedBox(height: 3,),
          Align(
            alignment: Alignment.bottomRight,
            child: Text(
              formattedTime,
              style: TextStyle(fontSize: 10, color: Colors.black),
            ),
          ),
        ],
      ),
    ),
  ),
);

  }
}
