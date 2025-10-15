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
    case 'parking':
    case 'car':
      return FontAwesomeIcons.car;
    case 'wifi':
      return FontAwesomeIcons.wifi;
    case 'swimmingPool':
      return FontAwesomeIcons.personSwimming;
    case 'laundry':
    case 'soap':
      return FontAwesomeIcons.soap;
    case 'kitchen':
    case 'kitchenSet':
      return FontAwesomeIcons.kitchenSet;
    case 'balcony':
    case 'doorOpen':
      return FontAwesomeIcons.doorOpen;
    case 'garden':
    case 'tree':
      return FontAwesomeIcons.tree;
    case 'wheelchair':
      return FontAwesomeIcons.wheelchair;
    case 'fire':
      return FontAwesomeIcons.fire;
    case 'heating':
    case 'temperatureHigh':
      return FontAwesomeIcons.temperatureHigh;
    case 'security':
    case 'shieldHalved':
      return FontAwesomeIcons.shieldHalved;
    case 'smart_home':
    case 'houseSignal':
      return FontAwesomeIcons.houseSignal;
    case 'rooftop':
    case 'city':
      return FontAwesomeIcons.city;
    case 'gym':
    case 'dumbbell':
      return FontAwesomeIcons.dumbbell;
    case 'pet_friendly':
    case 'paw':
      return FontAwesomeIcons.paw;
    case 'fully_furnished':
    case 'couch':
      return FontAwesomeIcons.couch;
    default:
      return Icons.error;
  }
}
