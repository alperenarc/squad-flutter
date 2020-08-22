import 'package:flutter/material.dart';
import 'package:squad/views/your_squads/your_squads_list_view_model.dart';
import 'package:squad/widgets/loading.dart';
import 'package:squad/widgets/squad_item.dart';
import '../../constants.dart';

class YourSquadsListView extends YourSquadsListViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: <Widget>[
            IconButton(
              icon: const BackButtonIcon(),
              color: kTextColor,
              tooltip: MaterialLocalizations.of(context).backButtonTooltip,
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/home');
              },
            ),
            Text(
              "Ekiplerin",
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(fontWeight: FontWeight.w900),
            ),
          ],
        ),
        backgroundColor: kBlueLightColor,
        elevation: 0,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          return await Future.delayed(Duration(seconds: 3));
        },
        child: ListView.builder(
          itemCount: mySquads.length,
          itemBuilder: (BuildContext ctxt, int index) {
            return mySquads.length != 0
                ? SquadItem(mySquads: mySquads[index])
                : Loading();
          },
          padding: const EdgeInsets.all(8.0),
        ),
      ),
    );
  }
}
