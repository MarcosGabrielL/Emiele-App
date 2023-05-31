import 'package:flutter/material.dart';

class PaymentModal {
  String date;
  String details;
  double amount;
  Color textColor;

  PaymentModal({
    required this.date,
    required this.details,
    required this.amount,
    required this.textColor,
  });

  factory PaymentModal.fromJson(Map<String, dynamic> json) {
    return PaymentModal(
      date: json['date'],
      details: json['details'],
      amount: json['amount'],
      textColor: json['textColor'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'details': details,
      'amount': amount,
      'textColor': textColor,
    };
  }
}
