
import 'PreferenceItem.dart';

class NewPreferenceDTO {
  String accessToken;
  List<PreferenceItem> items;

  NewPreferenceDTO({required this.accessToken, required this.items});

  factory NewPreferenceDTO.fromJson(Map<String, dynamic> json) {
    return NewPreferenceDTO(
      accessToken: json['accessToken'],
      items: List<PreferenceItem>.from(
          json['items'].map((item) => PreferenceItem.fromJson(item))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'accessToken': accessToken,
      'items': List<dynamic>.from(items.map((item) => item.toJson())),
    };
  }
}