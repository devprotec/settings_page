import 'dart:io';

import 'package:filesize/filesize.dart';
import 'package:intl/intl.dart';
import 'package:mime/mime.dart';

class Utilities {
  static getFileSize(File file) {
    var size = file.lengthSync();

    return filesize(size);
  }

  static enumToString(String value) {
    return value.replaceAll("_", ' ');
  }

  static getFileType(File file) {
    var type = file.path.split('/').last;
    final mimeType = lookupMimeType(type);
    return mimeType;
  }

  static String dateFormat(DateTime date) {
    return DateFormat("d-MMM-yyyy").format(date);
    // return DateFormat.d().add_yMMM().format(date);
  }

  static String dateFormat2(DateTime date) {
    return DateFormat("EEE, d MMM").format(date);
    // return DateFormat.d().add_yMMM().format(date);
  }

  static String dateFormat3(DateTime date, {bool onlyText = false}) {
    final _date = DateTime(date.year, date.month, date.day);
    final DateTime now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    if (_date == today) {
      if (onlyText) {
        return "Today";
      }
      return "Today, ${DateFormat("d MMM").format(date)}";
    }

    return onlyText
        ? DateFormat("d MMM").format(date)
        : DateFormat("d MMM, yyyy").format(date);
    // return DateFormat.d().add_yMMM().format(date);
  }

  static String timeFormat(DateTime date) {
    return DateFormat("hh:mm a").format(date);
    // return DateFormat.d().add_yMMM().format(date);
  }

  static String newdateFormat(DateTime date) {
    return DateFormat("yyyy-M-dd").format(date);
    // return DateFormat.yMMMd().format(_date);
  }

  static String fullDateFormat(DateTime date) {
    return DateFormat('dd MMM yyyy, hh:mm a').format(date);
    // return DateFormat.yMMMd().format(_date);
  }

  static String yearMD(DateTime date) {
    return DateFormat("yyyy-MM-dd").format(date);
    // return DateFormat.d().add_yMMM().format(date);
  }

  static String time(DateTime date) {
    return DateFormat("hh:mm a").format(date);
    // return DateFormat.d().add_yMMM().format(date);
  }

  static String mDY(DateTime date) {
    return DateFormat("MM-dd-yyyy").format(date);
    // return DateFormat.d().add_yMMM().format(date);
  }
}
