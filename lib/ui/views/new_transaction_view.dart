import 'package:flutter/material.dart';
import 'package:moneymanager/core/viewmodels/new_transcation_model.dart';
import 'package:moneymanager/ui/shared/ui_helpers.dart';
import 'package:moneymanager/ui/views/base_view.dart';
import 'package:moneymanager/ui/widgets/new_transaction_view_widget/transaction_type_spinner.dart';

class NewTransactionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<NewTransactionModel>(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: TransactionTypeSpinner(
              model.selectedCategory, model.changeSelectedItem),
        ),
        body: SafeArea(
          child: GridView.count(
            crossAxisCount: 2,
            childAspectRatio: 1.25,
            children: model
                .loadCategoriesIcons()
                .map((e) => Padding(
              padding: EdgeInsets.all(5),
              child: Card(
                  color: Colors.white,
                  elevation: 35,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed("inserttransaction",
                          arguments: [e, model.selectedCategory]);
                    },
                    child: Container(
                      padding: EdgeInsets.all(4),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(e.name,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                          UIHelper.verticalSpaceSmall(),
                          Divider(),
                          Center(
                            child: Icon(
                              e.icon,
                              size: 55,
                            ),
                          )
                        ],
                      ),
                    ),
                  )),
            ))
                .toList(),
          ),
        ),
      ),
    );
  }
}