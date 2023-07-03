
import 'BackUrls.dart';
import 'Item.dart';
import 'Payer.dart';
import 'PaymentMethods.dart';
import 'Shipments.dart';

class Root {
  List<Item> items;
  Payer payer;
  PaymentMethods paymentMethods;
  Shipments shipments;
  BackUrls backUrls;
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

  Root({
    required this.items,
    required this.payer,
    required this.paymentMethods,
    required this.shipments,
    required this.backUrls,
    required this.id,
    required this.initPoint,
    required this.sandboxInitPoint,
    required this.dateCreated,
    required  this.operationType,
    required  this.metadata,
    required  this.additionalInfo,
    required this.externalReference,
    required this.expires,
    required this.collectorId,
    required this.clientId,
    required this.marketplace,
    required this.marketplaceFee,
    required this.binaryMode,
  });

  factory Root.fromJson(Map<String, dynamic> json) {
    return Root(
      items: List<Item>.from(json['items'].map((item) => Item.fromJson(item))),
      payer: Payer.fromJson(json['payer']),
      paymentMethods: PaymentMethods.fromJson(json['paymentMethods']),
      shipments: Shipments.fromJson(json['shipments']),
      backUrls: BackUrls.fromJson(json['backUrls']),
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
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'items': List<dynamic>.from(items.map((item) => item.toJson())),
      'payer': payer.toJson(),
      'paymentMethods': paymentMethods.toJson(),
      'shipments': shipments.toJson(),
      'backUrls': backUrls.toJson(),
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
    };
  }
}