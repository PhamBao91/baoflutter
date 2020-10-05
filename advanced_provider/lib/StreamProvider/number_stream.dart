class NumberStream {
  Stream<int> intStream() {
    Duration interval = Duration(seconds: 1);
    int _count = 0;
    return Stream<int>.periodic(interval, (int _count) => _count++);
  }
}