
import 'ReceiverAddress.dart';

class Shipments {
  ReceiverAddress receiverAddress;

  Shipments({required this.receiverAddress});

  factory Shipments.fromJson(Map<String, dynamic> json) {
    return Shipments(
      receiverAddress: ReceiverAddress.fromJson(json['receiverAddress']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'receiverAddress': receiverAddress.toJson(),
    };
  }
}