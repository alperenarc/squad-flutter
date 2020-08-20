import 'package:flutter/material.dart';
import 'package:squad/widgets/loading.dart';
import '../../constants.dart';
import 'managed_squads_list_view_model.dart';

class ManagedSquadsListView extends ManagedSquadsListViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
              "Yönetilen Ekipler",
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
          return await Future.delayed(
            Duration(seconds: 3),
            () {},
          );
        },
        child: ListView.builder(
          itemCount: managedSquadsRequests.length,
          itemBuilder: (BuildContext ctxt, int index) {
            return managedSquadsRequests != [] ||managedSquadsRequests != null || managedSquadsRequests.length != 0
                ? Text("managedSquadsRequests[index]['squadname']")
                // SquadItem(mySquads: managedSquadsRequests[index])
                : Loading();
          },
          padding: const EdgeInsets.all(8.0),
        ),
      ),
    );
  }
}
