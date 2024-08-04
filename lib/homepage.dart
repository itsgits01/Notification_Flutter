import 'package:flutter/material.dart';
import 'package:notificatn/local_notification.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    // TODO: implement initState
    listenToNotifications();
    super.initState();
  }

//  to listen to any notification clicked or not
  listenToNotifications() {
    print("Listening to notification");
    LocalNotifications.onClickNotification.stream.listen((event) {
      print(event);
      Navigator.pushNamed(context, '/another', arguments: event);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter notification"),
      ),
      body: Column(
        children: [
          ElevatedButton.icon(
            onPressed: () {
              LocalNotifications.showSimpleNotification(
                  title: 'Notification simple',
                  body: "This is a simple ne wnotifiction",
                  payload: "Simple Ddata");
            },
            icon: Icon(Icons.notifications_outlined),
            label: Text('Simple NOtification'),
          ),

          //periodic notification
          ElevatedButton.icon(
            onPressed: () {
              LocalNotifications.showPeriodicNotification(
                  title: 'Periodic NOtification simple',
                  body: "This is a simple ne wnotifiction",
                  payload: "Simple Ddata");
            },
            icon: Icon(Icons.timer_outlined),
            label: Text('Periodic NOtification'),
          ),

          ElevatedButton.icon(
                icon: Icon(Icons.timer_outlined),
                onPressed: () {
                  LocalNotifications.showScheduleNotification(
                      title: "Schedule Notification",
                      body: "This is a Schedule Notification",
                      payload: "This is schedule data");
                },
                label: Text("Schedule Notifications"),
              ),

          // to close periodic notifications
          ElevatedButton.icon(
              icon: Icon(Icons.delete_outline),
              onPressed: () {
                LocalNotifications.cancel(1);
              },
              label: Text("Close Periodic Notifcations")),

          ElevatedButton.icon(
              icon: Icon(Icons.delete_forever_outlined),
              onPressed: () {
                LocalNotifications.cancelAll();
              },
              label: Text("Cancel All Notifcations"))
        ],
      ),
    );
  }
}
