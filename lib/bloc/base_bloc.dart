import 'package:covid19mobile/model/initiative_model.dart';
import 'package:covid19mobile/model/video_model.dart';

///     This program is free software: you can redistribute it and/or modify
///    it under the terms of the GNU General Public License as published by
///    the Free Software Foundation, either version 3 of the License, or
///    (at your option) any later version.
///
///    This program is distributed in the hope that it will be useful,
///    but WITHOUT ANY WARRANTY; without even the implied warranty of
///    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
///    GNU General Public License for more details.
///
///    You should have received a copy of the GNU General Public License
///    along with this program.  If not, see <https://www.gnu.org/licenses/>.

import '../model/faq_model.dart';
import '../model/remote_work_model.dart';
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
class StatsResultStream extends ResultStream<StateStream, StatsModel> {
  @override
  StatsModel model;

  @override
  StateStream state;

  /// Constructor to set the [state], a [StateStream] instance
  /// and [model] a [StatsModel] instance
  StatsResultStream({this.state, this.model});
}

/// The ResultStream instance for requesting the remote work posts
///
/// [RemoteWorkResultStream] is extended from [ResultStream]
class RemoteWorkResultStream
    extends ResultStream<StateStream, List<RemoteWorkModel>> {
  @override
  List<RemoteWorkModel> model;

  @override
  StateStream state;

  /// Constructor to set the [state], a [StateStream] instance
  /// and [model] a [Lst<RemoteWorkModel>] instance list
  RemoteWorkResultStream({this.state, this.model});
}

/// The ResultStream instance for requesting the remote work posts
///
/// [VideosResultStream] is extended from [ResultStream]
class VideosResultStream extends ResultStream<StateStream, List<VideoModel>> {
  @override
  List<VideoModel> model;

  @override
  StateStream state;

  /// Constructor to set the [state], a [StateStream] instance
  /// and [model] a [Lst<VideoModel>] instance list
  VideosResultStream({this.state, this.model});
}

/// The ResultStream instance for requesting the remote work posts
///
/// [FaqResultStream] is extended from [ResultStream]
class FaqResultStream extends ResultStream<StateStream, List<FaqModel>> {
  @override
  List<FaqModel> model;

  @override
  StateStream state;

  /// Constructor to set the [state], a [StateStream] instance
  /// and [model] a [Lst<FaqModel>] instance list
  FaqResultStream({this.state, this.model});
}

/// The ResultStream instance for requesting the remote work posts
///
/// [InitiativeResultStream] is extended from [ResultStream]
class InitiativeResultStream
    extends ResultStream<StateStream, List<InitiativeModel>> {
  @override
  List<InitiativeModel> model;

  @override
  StateStream state;

  /// Constructor to set the [state], a [StateStream] instance
  /// and [model] a [Lst<InitiativeModel>] instance list
  InitiativeResultStream({this.state, this.model});
}
