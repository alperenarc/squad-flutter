import 'package:flutter/material.dart';
import '../constants.dart';

class ManagedSquadItem extends StatelessWidget {
  final Function accept;
  final Function decline;
  const ManagedSquadItem({
    Key key,
    @required this.myManagedSquads,
    this.accept,
    this.decline,
  }) : super(key: key);

  final myManagedSquads;
  @override
  Widget build(BuildContext context) {
    // print(myManagedSquads.data);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.all(10),
      height: 90,
      decoration: BoxDecoration(
        color: kShadowColor,
        borderRadius: BorderRadius.circular(13),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 17),
            blurRadius: 23,
            spreadRadius: -13,
            color: kShadowColor,
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            radius: 30.0,
            backgroundImage: NetworkImage(
                "${myManagedSquads['userInfo']['photoUrl'].toString()}"),
            backgroundColor: Colors.transparent,
          ),
          SizedBox(width: 20),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                RichText(
                  text: new TextSpan(
                    style: new TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      new TextSpan(
                          text:
                              "${myManagedSquads['userInfo']['username'].toString()} ",
                          style: new TextStyle(fontWeight: FontWeight.w900)),
                      new TextSpan(text: 'adlı kullanıcı,  '),
                      new TextSpan(
                          text: "\n${myManagedSquads['squadName'].toString()}",
                          style: new TextStyle(fontWeight: FontWeight.w900)),
                      new TextSpan(text: ' ekibine katılmak istiyor.')
                    ],
                  ),
                ),
              ],
            ),
          ),
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                decline(myManagedSquads['userUid'].toString(),
                    myManagedSquads['squadName'].toString());
              }),
          IconButton(
              icon: Icon(Icons.check),
              onPressed: () {
                accept(myManagedSquads['userUid'].toString(),
                    myManagedSquads['squadName'].toString());
              }),
        ],
      ),
    );
  }
}
