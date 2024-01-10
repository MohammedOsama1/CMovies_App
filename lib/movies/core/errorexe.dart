class MyError extends Error {
  final String message;

  MyError(this.message);

  @override
  String toString() {
    return 'MyError: $message';
  }
}
