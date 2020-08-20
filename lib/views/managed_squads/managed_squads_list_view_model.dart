import 'package:flutter/material.dart';
import 'package:squad/core/firebase/squad_operation.dart';
import 'package:squad/views/managed_squads/managed_squads_list.dart';

abstract class ManagedSquadsListViewModel extends State<ManagedSquadsList> {
  var managedSquadsRequests = [];

  @override
  void initState() {
    super.initState();
    getMyManagedSquads().then((value) {
      // Bad code Change it 
      Future.delayed(const Duration(milliseconds: 1000), () {
        setState(() {
          managedSquadsRequests = managedSquadsRequestsFromFirebase;
        });
      });
    });
  }
}
