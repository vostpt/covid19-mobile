

import '../model/stats_model.dart';

abstract class Bloc {

  /// Dispose Bloc instance
  void dispose();

  /// A listener to capture the stream events
  ///
  /// This stream will be a [ResultStream] data type
  Stream<ResultStream> get onListener;
}

/// ResultStream a base class for sending event streams
///
/// [S] is the State instance, emum with states
/// [M] is the related data to pass on the stream
/// this could be a Model instance or other data type
class ResultStream<S, M> {

  /// Data passed to the stream
  M model;

  /// Actual State of the stream
  S state;

}

/// Enums the different States
///
/// [request] on doing the request
/// [loading] while doing the request
/// [success] if request was successfully
/// [fail] if request throw an exception
enum StateStream { request, loading, success, fail }

/// The ResultStream instance for requesting the case Stats
///
/// [StatsResultStream] is extended from [ResultStream]
class StatsResultStream
    extends ResultStream<StateStream, StatsModel>{

  @override
  StatsModel model;

  @override
  StateStream state;

  /// Constructor to set the [state], a [StateStream] instance
  /// and [model] a [StatsModel] instance
  StatsResultStream({this.state, this.model});
}

