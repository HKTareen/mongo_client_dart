
import 'package:mongo_client_dart/mongo_client_dart.dart';
import 'package:mongo_dart/mongo_dart.dart';
class UserProfile extends Serializable {
  final String? id;
  final String? email;
  final String? name;

  UserProfile({ this.id, required this.email, required this.name});

  @override
  Map<String, dynamic> toJson() => {
    '_id': id,
    'email': email,
    'name': name,
  };

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      id: json['_id'].toString(),
      email: json['email'],
      name: json['name'],
    );
  }
}