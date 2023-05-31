import 'package:flutter/material.dart';

class TrackOrderModal {
  IconData icon;
  String title;
  String subtitle;
  String time;

  TrackOrderModal({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.time,
  });

  factory TrackOrderModal.fromJson(Map<String, dynamic> json) {
    return TrackOrderModal(
      icon: json['icon'],
      title: json['title'],
      subtitle: json['subtitle'],
      time: json['time'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'icon': icon,
      'title': title,
      'subtitle': subtitle,
      'time': time,
    };
  }
}
