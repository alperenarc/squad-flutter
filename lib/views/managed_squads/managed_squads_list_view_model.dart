import 'package:flutter/material.dart';
import 'package:squad/core/firebase/squad_operation.dart';
import 'package:squad/views/managed_squads/managed_squads_list.dart';

abstract class ManagedSquadsListViewModel extends State<ManagedSquadsList> {
  var managedSquadsRequests = [];
  
  @override
  void initState() {
    super.initState();

    getMyManagedSquadsList().then((value) {
      setState(() {
        managedSquadsRequests = [];
        managedSquadsRequests = value;
      });
    });
  }

  void acceptUserRequest(userName, squadName) async {
    await acceptUser(userName, squadName);
  }

  void declineUserRequest(userName, squadName) async {
    await declineUser(userName, squadName);
  }
}
