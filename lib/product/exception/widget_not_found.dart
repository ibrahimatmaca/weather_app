class WidgetNotFoundException<T, R> implements Exception {
  final R data;

  WidgetNotFoundException(this.data);
  @override
  String toString() {
    return 'This class doesnt have this state: $T, $data';
  }
}
