class SqliteException implements Exception {
  final dynamic parent;
  final String message;

  SqliteException(this.parent, this.message);

  @override
  String toString() => message;
}
