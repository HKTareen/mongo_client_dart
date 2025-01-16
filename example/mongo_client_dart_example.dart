import 'package:mongo_client_dart/mongo_client_dart.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'user_profile.dart';

void main() async {
  final db =await Db.create('mongodb+srv://myclust:myclust@abc.xysx.mongodb.net/app');
  await db.open();

  final userRepository = MongoDBRepositoryImpl<UserProfile>(db, 'users',UserProfile.fromJson);

  // Insert a user
  final user = UserProfile(email: 'test@example.com', name: 'John Doe');
  final userId = await userRepository.insertOne(user);
  print('Inserted user with ID: $userId');

  // Find all users
  final users = await userRepository.findAll();
  print('Users: ${users.map((u) => u.toJson())}');
  await db.close();
}
