

class ResultPago {
  String id;
  String reques;
  String collectionId;
  String collectionStatus;
  String externalReference;
  String paymentType;
  String merchantOrderId;
  String preferenceId;
  String siteId;
  String processingMode;
  String merchantAccountId;
  String attributes;

  ResultPago({
    required this.id,
    required this.reques,
    required this.collectionId,
    required  this.collectionStatus,
    required this.externalReference,
    required this.paymentType,
    required this.merchantOrderId,
    required this.preferenceId,
    required this.siteId,
    required this.processingMode,
    required this.merchantAccountId,
    required this.attributes,
  });

  factory ResultPago.fromJson(Map<String, dynamic> json) {
    return ResultPago(
      id: json['id'],
      reques: json['reques'],
      collectionId: json['collectionId'],
      collectionStatus: json['collectionStatus'],
      externalReference: json['externalReference'],
      paymentType: json['paymentType'],
      merchantOrderId: json['merchantOrderId'],
      preferenceId: json['preferenceId'],
      siteId: json['siteId'],
      processingMode: json['processingMode'],
      merchantAccountId: json['merchantAccountId'],
      attributes: json['attributes'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'reques': reques,
      'collectionId': collectionId,
      'collectionStatus': collectionStatus,
      'externalReference': externalReference,
      'paymentType': paymentType,
      'merchantOrderId': merchantOrderId,
      'preferenceId': preferenceId,
      'siteId': siteId,
      'processingMode': processingMode,
      'merchantAccountId': merchantAccountId,
      'attributes': attributes,
    };
  }
}