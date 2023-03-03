import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

int? notificationSum(List<int>? nots) {
  if (nots == null) {
    return null;
  }
  int sum = 0;
  for (int i = 0; i < nots.length; i++) {
    sum += nots[i];
  }
  if (sum == 0) {
    return null;
  }
  return sum;
}

List<DocumentReference>? returnTwoChats(
  DocumentReference? chat1,
  DocumentReference? chat2,
) {
  if (chat1 == null && chat2 == null) {
    return null;
  }
  if (chat1 == null) {
    return [chat2!];
  }
  if (chat2 == null) {
    return [chat1!];
  }
  return [chat1!, chat2!];
}

int? getAge(String? birthdate) {
  try {
    if (birthdate == null) {
      return null;
    }
    var now = new DateTime.now();
    var formatter = new DateFormat('dd.MM.yyyy');
    var birthDate = formatter.parse(birthdate);
    var age = now.year - birthDate.year;
    var m = now.month - birthDate.month;
    if (m < 0 || (m == 0 && now.day < birthDate.day)) {
      age--;
    }
    return age;
  } catch (e) {
    return 0;
  }
}

String? getLocation(String? address) {
  if (address == null) {
    return null;
  }

  List<String> split = address.split(',').map((s) => s.trim()).toList();
  int len = split.length;

  switch (len) {
    case 1:
      return split[0]; // only country is given
    case 2:
      return '${split[0]}, ${split[1]}'; // city, country format
    default:
      // assume last comma separates city/country from rest of address
      String cityCountry = split[len - 1];
      String zipCity = split[len - 2];
      int zipIndex = zipCity.indexOf(' ');
      String city = zipCity.substring(zipIndex + 1);
      String country = cityCountry;
      return '${city.trim()}, ${country.trim()}';
  }
}
