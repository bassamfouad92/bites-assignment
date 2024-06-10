import 'package:json_annotation/json_annotation.dart';
part 'contact_user.g.dart';

@JsonSerializable()
class ContactUser {
  final int id;
  final String name;
  final String email;

  ContactUser({
    required this.id,
    required this.name,
    required this.email,
  });

  factory ContactUser.fromJson(Map<String, dynamic> json) =>
      _$ContactUserFromJson(json);
  Map<String, dynamic> toJson() => _$ContactUserToJson(this);
}
