import 'package:flutter/material.dart';
import 'package:moneymanager/ui/shared/ui_helpers.dart';

class EmptyTransactionsWidget extends StatelessWidget {
  const EmptyTransactionsWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          UIHelper.verticalSpaceLarge(),
          Image.asset(
            'assets/icons/emptywallet.jpg',
            width: 200,
            height: 200,
          ),
          UIHelper.verticalSpaceMedium(),
          Text(
            'No transactions\nTap + to add one.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey, fontSize: 18),
          ),
        ],
      ),
    );
  }
}
