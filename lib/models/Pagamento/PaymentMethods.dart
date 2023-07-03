
import 'ExcludedPaymentMethod.dart';
import 'ExcludedPaymentType.dart';

class PaymentMethods {
  List<ExcludedPaymentMethod> excludedPaymentMethods;
  List<ExcludedPaymentType> excludedPaymentTypes;

  PaymentMethods({
    required this.excludedPaymentMethods,
    required this.excludedPaymentTypes,
  });

  factory PaymentMethods.fromJson(Map<String, dynamic> json) {
    return PaymentMethods(
      excludedPaymentMethods: List<ExcludedPaymentMethod>.from(json['excludedPaymentMethods']
          .map((method) => ExcludedPaymentMethod.fromJson(method))),
      excludedPaymentTypes: List<ExcludedPaymentType>.from(json['excludedPaymentTypes']
          .map((type) => ExcludedPaymentType.fromJson(type))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'excludedPaymentMethods': List<dynamic>.from(
          excludedPaymentMethods.map((method) => method.toJson())),
      'excludedPaymentTypes': List<dynamic>.from(
          excludedPaymentTypes.map((type) => type.toJson())),
    };
  }
}
