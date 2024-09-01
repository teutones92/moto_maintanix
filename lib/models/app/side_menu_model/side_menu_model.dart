import 'package:flutter/material.dart';

class SideMenuModel {
  final String title;
  final IconData icon;
  String? route;
  final bool available;

  SideMenuModel(
      {required this.title,
      required this.icon,
      this.route,
      required this.available});

  static List<SideMenuModel> sideMenuList = [
    SideMenuModel(
      title: 'Profile',
      icon: Icons.person_outline,
      available: false,
    ),
    SideMenuModel(
      title: 'Customer Support',
      icon: Icons.message_outlined,
      route: 'mailto:teutones92@gmail.com',
      available: true,
    ),
    SideMenuModel(
      title: 'Terms & Conditions',
      icon: Icons.description_outlined,
      route: 'https://www.google.com',
      available: true,
    ),
    SideMenuModel(
      title: 'Settings',
      icon: Icons.settings_outlined,
      available: false,
    ),
    SideMenuModel(
      title: 'Rate Us',
      icon: Icons.star_border_outlined,
      route: 'https://www.google.com',
      available: true,
    ),
  ];
}
