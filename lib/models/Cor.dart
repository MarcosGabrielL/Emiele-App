
class CorModel {
  int id;
  String vendedor;
  String primaryColor;
  String secondary;

  CorModel({
    required this.id,
    required this.vendedor,
    required this.primaryColor,
    required this.secondary,
  });

  factory CorModel.fromJson(Map<String, dynamic> json) => _$CorModelFromJson(json);
  Map<String, dynamic> toJson() => _$CorModelToJson(this);

  @override
  String toString() {
    return 'CorModel{id: $id, vendedor: $vendedor, primaryColor: $primaryColor, secondary: $secondary}';
  }
}


CorModel _$CorModelFromJson(Map<String, dynamic> json) {
  return CorModel(
    id: json['id'] as int,
    vendedor: json['vendedor'] as String,
    primaryColor: json['primary_color'] as String,
    secondary: json['secondary'] as String,
  );
}

Map<String, dynamic> _$CorModelToJson(CorModel instance) => <String, dynamic>{
  'id': instance.id,
  'vendedor': instance.vendedor,
  'primary_color': instance.primaryColor,
  'secondary': instance.secondary,
};
