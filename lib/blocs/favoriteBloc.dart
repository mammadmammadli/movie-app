import 'dart:async';

class FavoriteBloc {
  int _counter = 0;

  final _favCounterStateController = StreamController<int>.broadcast();
  StreamSink<int> get inCounter => _favCounterStateController.sink;

  Stream<int> get counter => _favCounterStateController.stream;

  FavoriteBloc() {
    _favCounterStateController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(int number) {
    _counter ++;
  }

  void dispose() {
    _favCounterStateController.close();
  }
}