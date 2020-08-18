import 'package:flutter/material.dart';
import 'package:squad/core/firebase/user_operation.dart';
import 'package:squad/views/your_squads/your_squads_list.dart';

abstract class YourSquadsListViewModel extends State<YourSquadsList> {
  var mySquads=[];

  @override
  void initState() {
    super.initState();
    getMySquads().then((value) {
      setState(() {
        mySquads = squads;
      });
    });
  }
}
