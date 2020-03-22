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

import 'dart:io';

import 'package:covid19mobile/resources/constants.dart';
import 'package:covid19mobile/ui/app.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

abstract class MessagingService {
  MessagingService._();
  static final String _tag = '$bundle.PushNotificationsService';
  static final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  static void init() {
    logger.i("$_tag: Initing FCM service...");
    _firebaseMessaging.requestNotificationPermissions();

    _firebaseMessaging.onIosSettingsRegistered
        .listen((IosNotificationSettings settings) {
      logger.i("$_tag: Push notifications registered for iOS: $settings");
    });

    _firebaseMessaging.getToken().then((token) {
      logger.i('$_tag: Device registered for FCM with token: $token');
    });

    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        logger.i("$_tag Push (onMessage): $message");
      },
      onBackgroundMessage:
          Platform.isIOS ? null : _backgroundNotificationsHandler,
      onLaunch: (Map<String, dynamic> message) async {
        logger.i(_tag, "$_tag: Push (onLaunch): $message");
      },
      onResume: (Map<String, dynamic> message) async {
        logger.i("$_tag: Push (onResume): $message");
      },
    );
  }

  static Future<dynamic> _backgroundNotificationsHandler(
      Map<String, dynamic> message) {
    if (message.containsKey('data')) {
      final dynamic data = message['data'];
      logger.i("$_tag: Push (background) data message: $message");
    }

    if (message.containsKey('notification')) {
      final dynamic notification = message['notification'];
      logger.i(_tag, "$_tag: Push (background) data message: $notification");
    }
    return null;
  }
}
