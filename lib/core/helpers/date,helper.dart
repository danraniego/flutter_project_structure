import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

class DateHelper {
  
  /// Date Formats
  static const String defaultFormat = "MMM. d, yyyy hh:mm a";
  static const String dateWithSpace = "MMM d, yyyy";
  static const String dateWithDash = "yyyy-MM-dd";
  static const String dateAndTime = "yyyy-MM-dd HH:mm:ss";
  static const String monthAndYear = "MMM. yyyy";

  static dateTimeToString(DateTime dateTime) {
    return DateFormat(dateWithSpace).format(dateTime);
  }

  /// Get Current Date
  static getDate(String? format) {
    format = format ?? defaultFormat;
    DateTime lastUpdated = DateTime.now().toUtc();
    DateTime localTime = lastUpdated.add(lastUpdated.timeZoneOffset);
    return DateFormat(format).format(localTime);
  }

  /// Get Date Time
  static getDateTime() {
    DateTime lastUpdated = DateTime.now().toUtc();
    return lastUpdated.add(lastUpdated.timeZoneOffset);
  }

  /// Format Date
  static formatDate(DateTime date, [String? format]) {
    format = format ?? defaultFormat;
    return DateFormat(format).format(date);
  }

  /// Convert Date To Local Time
  static convertDateToLocal(String date, String? format) {
    format = format ?? defaultFormat;
    DateTime dateTime = DateTime.now();

    if (date != "") {
      dateTime = DateTime.parse(date).toLocal();
    }

    DateTime localTime = dateTime.add(dateTime.timeZoneOffset);

    if (format == "") {
      return localTime;
    }

    return DateFormat(format).format(localTime);
  }

  /// Convert Date To Local Time
  static convertDateToUtc(String date, String? format) {
    format = format ?? defaultFormat;
    DateTime dateTime = DateTime.parse(date).toUtc();
    return DateFormat(format).format(dateTime);
  }

  /// Get Previous Date
  static previousDate(DateTime date) {
    return DateTime(date.year, date.month, date.day - 1);
  }

  /// Get Next Date
  static nextDate(DateTime date) {
    return DateTime(date.year, date.month, date.day + 1);
  }

  /// Parse date String to DateTime
  static convertToDateTime(String date) {
    DateFormat dateFormat = DateFormat(dateAndTime);
    String dateString = dateFormat.format(DateTime.parse(date).toUtc());
    DateTime parsedDate = DateFormat(dateAndTime).parse(dateString);
    return parsedDate;
  }

  /// Convert String Time to TimeOfDay
  static TimeOfDay convertToTimeOfDay(String time) {
    var data = time.split(":");
    return TimeOfDay(hour: int.parse(data[0]), minute: int.parse(data[1]));
  }

  /// Convert Date To Time Ago
  static convertToTimeAgo(String date) {
    final timeAgo = DateTime.now()
        .difference(DateHelper.convertDateToLocal(date.toString(), ""));
    return timeago.format(DateTime.now().subtract(timeAgo));
  }

}
