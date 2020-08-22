import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../constants.dart';

class SquadItem extends StatelessWidget {
  const SquadItem({
    Key key,
    @required this.mySquads,
  }) : super(key: key);

  final mySquads;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      // ignore: missing_return
      onTap: () {
        if (mySquads.data['state']) {
          Navigator.of(context).pushNamed(
            '/squad_details',
            arguments: {
              'squadUid': mySquads.documentID,
              'squadName': mySquads.data['squadName'],
              'joinedDate': mySquads.data['joinedDate'],
            },
          );
        } else {
          final snackBar = SnackBar(
            content: Text('Ekip yöneticisi tarafından onay bekleniyor.'),
            action: SnackBarAction(
              label: 'Tamam',
              onPressed: () {},
            ),
          );
          return Scaffold.of(context).showSnackBar(snackBar);
        }
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        padding: EdgeInsets.all(10),
        height: 90,
        decoration: BoxDecoration(
          color: mySquads.data['state'] ? kBlueLightColor : kShadowColor,
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
            mySquads.data['state'] ? Icon(Icons.check) : Icon(Icons.close),
            SizedBox(width: 20),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    mySquads.data['squadName'].toString(),
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                  ),
                  Text(
                      'Katıldığınız Tarih : ${DateFormat.yMMMd().format(DateTime.parse(mySquads.data['joinedDate'].toDate().toString()))}')
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
