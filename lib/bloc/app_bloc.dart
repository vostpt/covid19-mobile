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

import 'dart:async';

import 'package:covid19mobile/model/api_response_model.dart';
import 'package:covid19mobile/model/faq_model.dart';
import 'package:covid19mobile/model/post_type.dart';
import 'package:covid19mobile/model/remote_work_model.dart';
import 'package:covid19mobile/model/stats_model.dart';
import 'package:covid19mobile/model/video_model.dart';
import 'package:covid19mobile/services/api_service.dart';
import 'package:covid19mobile/ui/app.dart';
import 'package:rxdart/subjects.dart';

import 'base_bloc.dart';

class AppBloc implements Bloc {
  static const String _tag = '.AppBloc';

  StreamController onStream = BehaviorSubject<ResultStream>();

  AppBloc() {
    APIService.api.init();
  }

  void foo() async {
    final APIResponse response = await APIService.api.getFoo(null);
    if (response.isOk) {
      logger.i('[$_tag] everything went ok!');
      // do something
    } else {
      logger.e('[$_tag] oops...');
      // throw some error
    }
  }

  void getStats() async {
    final APIResponse response = await APIService.api.getStats();
    if (response.isOk) {
      logger.i('[$_tag] everything went ok!');

      onStream.sink.add(StatsResultStream(
          model: StatsModel.fromJson(response.data),
          state: StateStream.success));
    } else {
      logger.e('[$_tag] oops...');
      // throw some error
    }
  }

  void geRemoteWork() async {
    final postType = PostType(PostTypes.remoteWork);

    var results =
        await getPosts<RemoteWorkModel>(postType, cacheKey: "RemoteWorkModel");

    onStream.sink.add(RemoteWorkResultStream(
        model: results,
        state: results != null ? StateStream.success : StateStream.fail));
  }

  void getVideos() async {
    final postType = PostType(PostTypes.videos);

    getPosts<VideoModel>(postType, cacheKey: "VideoModel");
  }
  
  void getFaqs() async {
    final postType = PostType(PostTypes.faq);

    var results = await getPosts<FaqModel>(postType, cacheKey: "FaqModel");

    onStream.sink.add(FaqResultStream(
        model: results,
        state: results != null ? StateStream.success : StateStream.fail));
  }

  Future<List<T>> getPosts<T>(PostType postType,
      {bool cache = true, String cacheKey = "key"}) async {
    final APIResponse response = await APIService.api.getPosts<T>(postType);
    if (response.isOk) {
      logger.i('[$_tag] everything went ok!');

      /// Cast the response to Map key -> value
      final data = response.data.cast<Map<String, dynamic>>();

      var results = parseData<T>(postType, data);

      if (cache) {
        /// TODO: cache results
      }

      return results;
    } else {
      logger.e('[$_tag] oops...');
      // throw some error
    }
    return null;
  }

  /// Parse the json map into each corresponding Post Model
  ///
  /// Both [postType] and [data] are mandatory
  ///
  /// Then returns the parsed data
  parseData<T>(PostType postType, dynamic data) {
    switch (postType.postTypes) {
      case PostTypes.measures:
        // TODO: Handle this case.
        break;
      case PostTypes.remoteWork:

        /// Data converted to a Map now we need to convert each entry
        return data.map<T>((json) =>

            /// into a [RemoteWorkModel] instance and save into a List
            RemoteWorkModel.fromJson(json)).toList();

        break;
      case PostTypes.faq:

        /// Data converted to a Map now we need to convert each entry
        return data.map<T>((json) =>

            /// into a [RemoteWorkModel] instance and save into a List
            FaqModel.fromJson(json)).toList();

        break;
      case PostTypes.faq:

        /// Data converted to a Map now we need to convert each entry
        return data.map<T>((json) =>

            /// into a [RemoteWorkModel] instance and save into a List
            FaqModel.fromJson(json)).toList();

        break;
      case PostTypes.videos:

        /// Data converted to a Map now we need to convert each entry
        return data.map<T>((json) =>

            /// into a [VideoModel] instance and save into a List
            VideoModel.fromJson(json)).toList();
    }
  }

  @override
  void dispose() {
    onStream.close();
  }

  @override
  Stream<ResultStream> get onListener => onStream.stream;
}
