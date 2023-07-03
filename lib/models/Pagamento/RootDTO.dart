
class RootDTO {
  String items;
  String payer;
  String paymentMethods;
  String shipments;
  String backUrls;
  String id;
  String initPoint;
  String sandboxInitPoint;
  String dateCreated;
  String operationType;
  String metadata;
  String additionalInfo;
  String externalReference;
  bool expires;
  int collectorId;
  int clientId;
  String marketplace;
  double marketplaceFee;
  bool binaryMode;
  String vendedor_id;

  RootDTO({
    required this.items,
    required this.payer,
    required this.paymentMethods,
    required this.shipments,
    required  this.backUrls,
    required this.id,
    required this.initPoint,
    required this.sandboxInitPoint,
    required this.dateCreated,
    required  this.operationType,
    required  this.metadata,
    required this.additionalInfo,
    required  this.externalReference,
    required this.expires,
    required this.collectorId,
    required this.clientId,
    required this.marketplace,
    required this.marketplaceFee,
    required this.binaryMode,
    required this.vendedor_id,
  });

  factory RootDTO.fromJson(Map<String, dynamic> json) {
    return RootDTO(
      items: json['items'],
      payer: json['payer'],
      paymentMethods: json['paymentMethods'],
      shipments: json['shipments'],
      backUrls: json['backUrls'],
      id: json['id'],
      initPoint: json['initPoint'],
      sandboxInitPoint: json['sandboxInitPoint'],
      dateCreated: json['dateCreated'],
      operationType: json['operationType'],
      metadata: json['metadata'],
      additionalInfo: json['additionalInfo'],
      externalReference: json['externalReference'],
      expires: json['expires'],
      collectorId: json['collectorId'],
      clientId: json['clientId'],
      marketplace: json['marketplace'],
      marketplaceFee: json['marketplaceFee'],
      binaryMode: json['binaryMode'],
      vendedor_id: json['vendedor_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'items': items,
      'payer': payer,
      'paymentMethods': paymentMethods,
      'shipments': shipments,
      'backUrls': backUrls,
      'id': id,
      'initPoint': initPoint,
      'sandboxInitPoint': sandboxInitPoint,
      'dateCreated': dateCreated,
      'operationType': operationType,
      'metadata': metadata,
      'additionalInfo': additionalInfo,
      'externalReference': externalReference,
      'expires': expires,
      'collectorId': collectorId,
      'clientId': clientId,
      'marketplace': marketplace,
      'marketplaceFee': marketplaceFee,
      'binaryMode': binaryMode,
      'vendedor_id': vendedor_id,
    };
  }
}