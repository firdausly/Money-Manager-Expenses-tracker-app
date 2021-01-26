import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:moneymanager/core/enums/viewstate.dart';
import 'package:moneymanager/core/viewmodels/reminder_model.dart';
import 'package:moneymanager/ui/views/base_view.dart';

class ReminderView extends StatelessWidget {
  const ReminderView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<ReminderModel>(
      onModelReady: (model) => model.init(),
      builder: (context, model, child) => Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          height: 55,
          index: 1,
          backgroundColor: Colors.white,
          // buttonBackgroundColor: Colors.greenAccent,
          color: Colors.greenAccent,
          items: [
            Icon(Icons.pie_chart),
            Icon(Icons.notifications),
            Icon(Icons.home_filled,size: 40,),
            Icon(Icons.calculate),
            Icon(Icons.note_add),
          ],
          onTap: (index){
            debugPrint(index.toString());
            switch(index.toString()){
              case '0':
                return Navigator.of(context).pushNamed("chart");
              case '1':
                return Navigator.of(context).pushNamed("reminder");
              case '2':
                return Navigator.of(context).pushNamed("home");
              case '3':
                return Navigator.of(context).pushNamed("calculation");
              case '4':
                return Navigator.of(context).pushNamed("notes");
            }
          },
        ),
        appBar: AppBar(title: Text('Reminder')),
        body: model.state == ViewState.Busy
            ? CircularProgressIndicator()
            : Column(
                children: <Widget>[
                  ListTile(
                    title: Text('Daily Reminder'),
                    subtitle: Text(model.timeText),
                    trailing: InkWell(
                      child: Icon(Icons.edit),
                      onTap: () {
                        model.pickTime(context);
                      },
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
