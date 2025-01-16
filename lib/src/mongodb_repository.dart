import 'package:mongo_dart/mongo_dart.dart';
import '../mongo_client_dart.dart';

abstract class MongoDBClient<T extends Serializable> {
  Future<List<T>> findAll();
  Future<T?> findById(String id);
  Future findByEmail(String email);
  Future<String> insertOne(T document);
  Future<bool> updateOne(String id, Map<String, dynamic> updateFields);
  Future<bool> deleteOne(String id);
}

class MongoDBRepositoryImpl<T extends Serializable>
    implements MongoDBClient<T> {
  final DbCollection collection;
  final T Function(Map<String, dynamic> json) fromJsonFactory;

  MongoDBRepositoryImpl(Db db, String collectionName, this.fromJsonFactory)
      : collection = db.collection(collectionName);

  @override
  Future<List<T>> findAll() async {
    final results = await collection.find({"isDeleted": false}).toList();
    return results.map<T>((e) => fromJsonFactory(e)).toList();
  }

  @override
  Future<T?> findById(String id) async {
    final result = await collection.findOne({'_id': ObjectId.parse(id)});
    return result != null ? fromJsonFactory(result) : null;
  }

  @override
  Future findByEmail(String email) async {
    return await collection.findOne({'email': email});
  }

  @override
  Future<String> insertOne(T document) async {
    final result = await collection.insertOne(document.toJson());
    return result.id.toHexString();
  }

  @override
  Future<bool> updateOne(String id, Map<String, dynamic> updateFields) async {
    final modifier = ModifierBuilder();
    updateFields.forEach((key, value) {
      modifier.set(key, value);
    });

    final result = await collection.updateOne(
      where.id(ObjectId.parse(id)),
      modifier,
    );
    return result.isAcknowledged;
  }

  @override
  Future<bool> deleteOne(String id) async {
    final result = await collection.remove(where.id(ObjectId.parse(id)));
    return result['n'] > 0;
  }
}
