import 'package:json_annotation/json_annotation.dart';

part 'name_age.g.dart';

@JsonSerializable()
class NameAge {
  int? count;
  String? name;
  int? age;

  NameAge({
    this.count,
    this.name,
    this.age,
  });

  factory NameAge.fromJson(Map<String, dynamic> json) {
    return _$NameAgeFromJson(json);
  }

  Map<String, dynamic> toJson() => _$NameAgeToJson(this);
}
