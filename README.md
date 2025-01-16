# Mongo Client Dart

`mongo_client_dart` is a reusable, generic, and easy-to-use MongoDB client package for Dart. It allows developers to interact with MongoDB collections by simply providing model classes and their serialization logic.

## Features

- Generic repository implementation for MongoDB.
- Supports CRUD operations (Create, Read, Update, Delete).
- Easily integrates with any model class by providing a factory method for JSON serialization.
- Built on top of the powerful [`mongo_dart`](https://pub.dev/packages/mongo_dart) package.

## Installation

Add the following line to your `pubspec.yaml`:

```yaml
dependencies:
  mongo_client_dart: ^1.0.3
