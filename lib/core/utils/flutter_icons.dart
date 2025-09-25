import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

IconData getFlutterIcon(String name) {
  switch (name) {
    case 'utensils':
      return FontAwesomeIcons.utensils;
    case 'fan':
      return FontAwesomeIcons.fan;
    case 'shop':
      return FontAwesomeIcons.shop;
    case 'mugHot':
      return FontAwesomeIcons.mugHot;
    case 'train':
      return FontAwesomeIcons.train;
    case 'hospital':
      return FontAwesomeIcons.hospital;
    case 'Parking':
      return Icons.local_parking;
    case 'wifi':
      return FontAwesomeIcons.wifi;
    default:
      return Icons.error;
  }
}
