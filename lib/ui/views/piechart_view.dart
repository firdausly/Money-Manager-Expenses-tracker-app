import 'package:chips_choice/chips_choice.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:moneymanager/core/enums/viewstate.dart';
import 'package:moneymanager/core/viewmodels/piechart_model.dart';
import 'package:moneymanager/ui/views/base_view.dart';
import 'package:pie_chart/pie_chart.dart';

class PieChartView extends StatelessWidget {
  const PieChartView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<PieChartModel>(
      onModelReady: (model) => model.init(true),
      builder: (context, model, child) => Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          height: 55,
          index: 0,
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
        appBar: AppBar(
          title: Text('Chart'),
        ),
        body: model.state == ViewState.Busy
            ? CircularProgressIndicator()
            : SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 10,
                    child: Column(
                      children: <Widget>[
                        ChipsChoice<int>.single(
                          itemConfig: ChipsChoiceItemConfig(
                              elevation: 1, selectedColor: Colors.red),
                          value: model.selectedMonthIndex,
                          isWrapped: true,
                          options: ChipsChoiceOption.listFrom<int, String>(
                            source: model.months,
                            value: (i, v) => i,
                            label: (i, v) => v,
                          ),
                          onChanged: (val) => model.changeSelectedMonth(val),
                        ),
                        ChipsChoice<int>.single(
                          itemConfig: ChipsChoiceItemConfig(
                              elevation: 1, selectedColor: Colors.green),
                          value: model.type == 'income' ? 0 : 1,
                          isWrapped: true,
                          options: ChipsChoiceOption.listFrom<int, String>(
                            source: model.types,
                            value: (i, v) => i,
                            label: (i, v) => v,
                          ),
                          onChanged: (val) => model.changeType(val),
                        ),
                        model.dataMap.length == 0
                            ? Text('No Data for this month')
                            : PieChart(dataMap: model.dataMap),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
