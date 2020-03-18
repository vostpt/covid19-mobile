

import 'package:covid19mobile/model/stats_model.dart';

abstract class Bloc {
  void dispose();

  Stream<ResultStream> get onListener;
}

class ResultStream<S, M> {

  @override
  M model;

  @override
  S state;

}

enum StateStream {request, loading, success, fail }

class StatsResultStream
    extends ResultStream<StateStream, StatsModel>{

  @override
  StatsModel model;

  @override
  StateStream state;

  StatsResultStream({this.state, this.model});
}

