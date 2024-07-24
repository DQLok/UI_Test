import 'package:flutter/material.dart';

class TabMenu {
  String id;
  String name;
  IconData icon;
  bool select;

  TabMenu(
      {required this.id,
      required this.name,
      required this.icon,
      required this.select});
}

List<TabMenu> listTabMenu = [
  TabMenu(id: 'home', name: 'Home', icon: Icons.other_houses, select: true),
  TabMenu(
      id: 'profile',
      name: 'Profile',
      icon: Icons.person_4_outlined,
      select: false),
  TabMenu(
      id: 'nearby',
      name: 'Nearby',
      icon: Icons.location_on_outlined,
      select: false),
  TabMenu(id: 'bookmark', name: 'Bookmark', icon: Icons.tab, select: false),
  TabMenu(
      id: 'notification',
      name: 'Notification',
      icon: Icons.notifications_none,
      select: false),
  TabMenu(
      id: 'message',
      name: 'Message',
      icon: Icons.message_outlined,
      select: false),
  TabMenu(id: 'setting', name: 'Setting', icon: Icons.settings, select: false),
  TabMenu(id: 'help', name: 'Help', icon: Icons.help_outline, select: false),
  TabMenu(
      id: 'logout',
      name: 'Logout',
      icon: Icons.settings_power_rounded,
      select: false)
];
