import 'dto/user.dto.dart';

class User implements UserDto {
  String? id;
  String? username;
  String? firstName;
  String? lastName;
  String? emailAddress;
  String? phoneNumber;
  String? role;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  User({
    this.id,
    this.username,
    this.firstName,
    this.lastName,
    this.emailAddress,
    this.phoneNumber,
    this.role,
    this.status,
    this.createdAt,
    this.updatedAt
  });
}