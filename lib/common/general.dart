import 'package:flutter/material.dart';

// *-*-*--
const DEBUGMODE = false;
//
//APP CONFIG
const appName = "";

/// Logging config
const kLOG_TAG = "[JIGSS APP]";
const kLOG_ENABLE = true;
const kLOG_IMPORTANT_LOG = true;

enum LOG_LEVEL { DEBUG, RUN, ERROR }

void printLog(dynamic data, {LOG_LEVEL priority = LOG_LEVEL.DEBUG}) {
  if (kLOG_ENABLE) {
    _print(data);
  } else if (kLOG_IMPORTANT_LOG == true) {
    if (priority == LOG_LEVEL.RUN || priority == LOG_LEVEL.ERROR) {
      _print(data);
    }
  }
}

void _print(dynamic data) {
  final String now = DateTime.now().toUtc().toString().split(' ').last;
  debugPrint("[$now]$kLOG_TAG${data.toString()}");
}
