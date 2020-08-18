import 'package:flutter/material.dart';
import 'package:squad/views/your_squads/your_squads_list_view_model.dart';
import '../../constants.dart';
import 'package:intl/intl.dart';

class YourSquadsListView extends YourSquadsListViewModel {
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
        child: ListView(
          padding: const EdgeInsets.all(8.0),
          children: <Widget>[
            mySquads.length != 0 ? SquadItem(mySquads: mySquads) : Loading(),
          ],
        ),
      ),
    );
  }
}

class Loading extends StatelessWidget {
  const Loading({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        child: CircularProgressIndicator(
          valueColor: new AlwaysStoppedAnimation<Color>(kBlueLightColor),
        ),
        height: 20.0,
        width: 20.0,
      ),
    );
  }
}

class SquadItem extends StatelessWidget {
  const SquadItem({
    Key key,
    @required this.mySquads,
  }) : super(key: key);

  final List mySquads;

  @override
  Widget build(BuildContext context) {

    print(DateTime.parse(mySquads[0].data['joinedDate'].toDate().toString()));

    print(DateFormat.yMMMd().format(DateTime.parse(mySquads[0].data['joinedDate'].toDate())));

    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.all(10),
      height: 90,
      decoration: BoxDecoration(
        color: Colors.white,
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
          // SvgPicture.asset(
          //   "assets/icons/Meditation_women_small.svg",
          // ),
          Icon(Icons.access_alarms),
          SizedBox(width: 20),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  mySquads[0].data['squadName'].toString(),
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                Text('Katıldığınız Tarih : ${mySquads[0].data['joinedDate']}')
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// class SquadItemCard extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.symmetric(vertical: 5),
//       padding: EdgeInsets.all(10),
//       height: 90,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(13),
//         boxShadow: [
//           BoxShadow(
//             offset: Offset(0, 17),
//             blurRadius: 23,
//             spreadRadius: -13,
//             color: kShadowColor,
//           ),
//         ],
//       ),
//       child: Row(
//         children: <Widget>[
//           // SvgPicture.asset(
//           //   "assets/icons/Meditation_women_small.svg",
//           // ),
//           Icon(Icons.access_alarms),
//           SizedBox(width: 20),
//           Expanded(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Text(
//                   "Basic",
//                   style: Theme.of(context).textTheme.subtitle2,
//                 ),
//                 Text("Start your deepen you practice")
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
