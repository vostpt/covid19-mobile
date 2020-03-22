import 'package:covid19mobile/model/notifications_model.dart';
import 'package:covid19mobile/services/messaging_service.dart';

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

import 'package:flutter/material.dart';

enum Channel {
  general,
  stats,
  measures,
  questions,
  other,
}

class NotificationsProvider extends ChangeNotifier {
  NotificationsModel notifications = NotificationsModel();

  NotificationsProvider() {
    notifications = NotificationsModel(
        general: MessagingService.notificationsEnabledForApp);
  }

  void checkPermissions() async {
    await MessagingService.init();
    notifications = NotificationsModel(
        general: MessagingService.notificationsEnabledForApp);
    notifyListeners();
  }

  void toggleNotification({@required Channel channel, bool value = false}) {
    switch (channel) {
      case Channel.general:
        value ? MessagingService.init() : MessagingService.unregister();
        notifications = notifications.copyWith(general: value);
        break;
      case Channel.stats:
        notifications = notifications.copyWith(stats: value);
        break;
      case Channel.measures:
        notifications = notifications.copyWith(measures: value);
        break;
      case Channel.questions:
        notifications = notifications.copyWith(questions: value);
        break;
      case Channel.other:
        notifications = notifications.copyWith(other: value);
        break;
      default:
    }

    notifyListeners();
  }
}
