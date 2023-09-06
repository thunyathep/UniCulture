import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:unihr/main.dart';
import 'package:flutter/material.dart';

class NotificationServeice{
  static Future<void> initializeNotification() async{
    await AwesomeNotifications().initialize(
        null,
        [
          NotificationChannel(
              channelKey: "Morale_channel",
              channelName: "Morale_Diary_Notification",
              channelDescription: "Morale Diary Notification Test",
              ledColor: Color(0xFFEC6C8B),
              importance: NotificationImportance.High,
              channelShowBadge: true,
              onlyAlertOnce: true,
              playSound: true,
              criticalAlerts: true,
          ),
        ],
        channelGroups: [
          NotificationChannelGroup(
              channelGroupKey: "Morale_channel_Group",
              channelGroupName: "Morale_Diary_Group_1",
          ),
        ],
      debug: true,
    );
    await AwesomeNotifications().isNotificationAllowed().then(
        (isAllowed) async {
          if (!isAllowed){
            await AwesomeNotifications().requestPermissionToSendNotifications();
          }
        }
    );

    await AwesomeNotifications().setListeners(
        onActionReceivedMethod: onActionReceivedMethod,
        onNotificationCreatedMethod: onNotificationCreateMethod,
        onNotificationDisplayedMethod: onNotificationDisplayedMethod,
        onDismissActionReceivedMethod: onDismissActionReceivedMethod,
    );
  }

  static Future<void> onNotificationCreateMethod(
      ReceivedNotification receivedNotification
      ) async{
    debugPrint("onNotificationCreateMethod");
  }

  static Future<void> onActionReceivedMethod(
      ReceivedAction receivedAction
      ) async{
    debugPrint("onActionReceivedMethod");
    final payload = receivedAction.payload ?? {};
    if(payload["navigate"] == "true"){
      // MyApp.navigatorkey.currentState?.push;
    }
  }


  static Future<void> onDismissActionReceivedMethod(
      ReceivedAction receivedAction
      ) async{
    debugPrint("onDismissActionReceivedMethod");
  }

  static Future<void> onNotificationDisplayedMethod(
      ReceivedNotification receivedNotification
      ) async{
    debugPrint("onNotificationDisplayedMethod");
  }
}