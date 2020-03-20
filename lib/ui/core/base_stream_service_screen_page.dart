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

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../bloc/base_bloc.dart';


/// Base abstract class that extends [StatefulWidget]
abstract class BasePage extends StatefulWidget {

  /// Class Constructor
  ///
  /// [key] is optional
  BasePage({Key key}) : super(key: key);

  /// Builder to instantiate other widgets on top of this one
  ///
  /// A practical use case could be adding a Provider
  ///
  /// ex:
  ///   @override
  ///   get builder => MultiProvider(
  ///      providers: [
  ///         ChangeNotifierProvider<Provider>.value(value: Provider())
  ///      ],
  ///      child: Widget()
  ///   );
  Widget get builder;
}

/// BaseStreamServiceScreenPage receives an [Bloc] instance
///
/// this will create a listener for every stream events pushed
/// into the [StreamSubscription]
///
/// then it will call [onStateListener] with the result stream
/// of the type [ResultStream]
///
/// on dispose from parent class will cancel the [StreamSubscription]
///
mixin BaseStreamServiceScreenPage<B extends Bloc> {
  B _bloc;
  B get bloc => _bloc;

  Stream<ResultStream> get onStateListener;

  StreamSubscription _streamSubscription;

  StreamSubscription get streamSubscription => _streamSubscription;

  void _listen(Bloc bloc) {
    if(onStateListener == null) {
      return;
    }
    _streamSubscription = onStateListener.listen(onStateResultListener);
  }

  /// Receive the streams
  void onStateResultListener(ResultStream result);

  /// Calls initBloc as soon the Bloc instance of type [B]
  /// is ready to be used
  void initBloc(B bloc);

  void _dispose() {
    _streamSubscription?.cancel();
  }
}

/// [BaseState] abstract class that receives two types:
/// [Page] extends a [BasePage]
/// and [B] extends a [Bloc]
///
/// that will extends the State, The logic and internal
/// state for a [StatefulWidget].
///
/// * The [didChangeDependencies] method will be called again if the
///   inherited widgets subsequently change or if the widget moves in the tree.
///
///   Get the instance Provider Bloc and call [_listen] to listen to
///   the Stream changes
///
///   if the Provider Bloc if different from the [_bloc]
///   updates to use the new instance of the Provider
///
abstract class BaseState<Page extends BasePage, B extends Bloc>
    extends State<Page>
    with BaseStreamServiceScreenPage<B>{

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    /// Gets the Bloc instance
    final bloc = Provider.of<B>(context, listen: false);
    if (bloc != _bloc) {
      _dispose();

      _bloc = bloc;

      initBloc(_bloc);
      _listen(bloc);
    }
  }

  @override
  void dispose() {
    _dispose();
    super.dispose();
  }

}

