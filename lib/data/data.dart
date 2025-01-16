import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

List<Map<String,dynamic>> transactionData = [
  {
    'icon': const FaIcon(FontAwesomeIcons.burger,color: Colors.white),
    'name': 'Food',
    'color': Colors.yellow[700],
    'totalAmount': "-Rs45.00",
    'date': 'Today'
  },
  {
    'icon': const FaIcon(FontAwesomeIcons.bagShopping,color: Colors.white),
    'name': 'Shopping',
     'color':Colors.purple,
    'totalAmount': "-Rs4534.00",
    'date': 'Today'
  },
  {
    'icon': const FaIcon(FontAwesomeIcons.burger,color: Colors.white),
    'name': 'Food',
     'color':Colors.green,
    'totalAmount': "-Rs453.00",
    'date': 'Yesterday'
  },

    {
    'icon': const FaIcon(FontAwesomeIcons.plane,color: Colors.white),
    'name': 'Travel',
     'color':Colors.blue,
    'totalAmount': "-Rs4353.00",
    'date': 'Yesterday'
  },
];
