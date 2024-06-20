// ignore_for_file: constant_identifier_names

import 'package:imei/config/themes/app_colors.dart';

import 'package:flutter/painting.dart ';

const int PUSH_INTEVAL = 5;
const Duration PERIODIC_DURATION_INTEVAL = Duration(minutes: 1);
const Duration CONNECTION_DURATION_INTEVAL = Duration(seconds: 2);
const methodChannel = 'com.soferp.TSM/TSM';
const ip = "10.3.1.166";
const server = "http://$ip:3000";
const titleTextStyle = TextStyle(
    fontSize: 20, color: LightColors.darkBlue, fontWeight: FontWeight.bold);
