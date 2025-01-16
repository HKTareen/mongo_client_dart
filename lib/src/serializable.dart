abstract class Serializable {
  Map<String, dynamic> toJson();

  static T fromJson<T>(Map<String, dynamic> json, String typeName) {
    throw UnimplementedError(
        'Override this method in the specific Serializable implementation for $typeName.');
  }
}
