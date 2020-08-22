import 'package:flutter/material.dart';
import '../../constants.dart';
import 'squad_details_list_view_model.dart';

class SquadDetailsListView extends SquadDetailsListViewModel {
  @override
  Widget build(BuildContext context) {
    // final routeArg =
    //     ModalRoute.of(context).settings.arguments as Map<String, dynamic>;

    // final squadUid = routeArg['squadUid'].toString();
    // final squadName = routeArg['squadName'].toString();
    // final joinedDate = routeArg['joinedDate'].toString();

    return Scaffold(
      appBar: appBar(context),
      body: Popo(),
    );
  }

  // SingleChildScrollView body() {
  //   print('asd');
  //   return SingleChildScrollView(
  //     child: Column(
  //       children: <Widget>[
  //         Text('Alperen'),
  //         Text('Alperen'),
  //         Container(
  //           height: 100,
  //           child: DefaultTabController(
  //             length: 2,
  //             child: Scaffold(
  //               appBar: TabBar(
  //                 labelColor: Colors.red,
  //                 unselectedLabelColor: Colors.blue,
  //                 indicatorColor: Colors.amberAccent,
  //                 tabs: [
  //                   Tab(
  //                     icon: Icon(Icons.directions_car),
  //                     child: Text('alperns'),
  //                   ),
  //                   Tab(icon: Icon(Icons.directions_transit)),
  //                 ],
  //               ),
  //               body: TabBarView(
  //                 children: [
  //                   Icon(Icons.directions_car),
  //                   Icon(Icons.directions_transit),
  //                 ],
  //               ),
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  AppBar appBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          IconButton(
            icon: const BackButtonIcon(),
            color: kTextColor,
            tooltip: MaterialLocalizations.of(context).backButtonTooltip,
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('/your_squads');
            },
          ),
          Text(
            "Details",
            style: Theme.of(context)
                .textTheme
                .headline6
                .copyWith(fontWeight: FontWeight.w900),
          ),
        ],
      ),
      backgroundColor: kBlueLightColor,
      elevation: 0,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    var pixRatio = MediaQuery.of(context).devicePixelRatio;
    double height = MediaQuery.of(context).size.height * pixRatio;
    print(height);
    return new Scaffold(
      body: new ListView(
        children: <Widget>[
          Card(
            child: Icon(Icons.accessibility_new),
          ),
          Card(
            child: Icon(Icons.accessibility_new),
          ),
          Card(
            child: Icon(Icons.accessibility_new),
          ),
          Card(
            child: Icon(Icons.accessibility_new),
          ),
          Card(
            child: Icon(Icons.accessibility_new),
          ),
          Card(
            child: Icon(Icons.accessibility_new),
          ),
          Card(
            child: Icon(Icons.accessibility_new),
          ),
          Card(
            child: Icon(Icons.accessibility_new),
          ),
          Card(
            child: Icon(Icons.accessibility_new),
          ),
          new Container(
            decoration: new BoxDecoration(color: Colors.red),
            child: new TabBar(
              labelColor: kTextColor,
              unselectedLabelColor: kBlueColor,
              indicatorColor: kTextColor,
              controller: _controller,
              tabs: [
                new Tab(
                  // icon: const Icon(Icons.calendar_today),
                  text: 'Etkinlikler',
                ),
                new Tab(
                  // icon: const Icon(Icons.people_outline),
                  text: 'Location',
                ),
              ],
            ),
          ),
          LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
            print((constraints.minWidth).toString());
            return new Container(
              height: 556,
              child: new TabBarView(
                controller: _controller,
                children: <Widget>[
                  ListView.builder(
                    itemCount: 40,
                    itemBuilder: (context, index) {
                      return Column(
                        children: <Widget>[
                          Center(
                            child: Text(
                              index.toString(),
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  Text(height.toString())
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}

class Popo extends StatefulWidget {
  @override
  _PopoState createState() => _PopoState();
}

class _PopoState extends State<Popo> with SingleTickerProviderStateMixin {
  TabController _controller;
  @override
  void initState() {
    super.initState();
    _controller = new TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            // SliverAppBar(
            //   backgroundColor: Colors.grey[100],
            //   title: Container(
            //     color: Colors.grey[100],
            //     height: 500,
            //     width: MediaQuery.of(context).size.width,
            //     child: Container(
            //       width:500,
            //       child: Center(
            //         child: Card(
            //           child: Text('asd \nAlperemn \nAlperemn \nAlperemn'),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            // SliverGrid(
            //   gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            //     maxCrossAxisExtent: 200.0,
            //     mainAxisSpacing: 10.0,
            //     crossAxisSpacing: 10.0,
            //     childAspectRatio: 4.0,
            //   ),
            //   delegate: SliverChildBuilderDelegate(
            //     (BuildContext context, int index) {
            //       return Container(
            //         alignment: Alignment.center,
            //         color: Colors.red,
            //         child: Text('grid item $index'),
            //       );
            //     },
            //     childCount: 1,
            //   ),
            // ),
            SliverToBoxAdapter(
              child: Container(
                child: Column(children: <Widget>[
                  Text('asd'),
                  Text('adad')
                ],),
              ),
            ),
            SliverAppBar(
              pinned: true,
              automaticallyImplyLeading: false,
              backgroundColor: Colors.black,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Icon(Icons.dashboard),
                  Icon(Icons.tv),
                  Icon(Icons.person),
                ],
              ),
              bottom: TabBar(
                labelColor: kTextColor,
                unselectedLabelColor: kBlueColor,
                indicatorColor: kTextColor,
                controller: _controller,
                tabs: [
                  new Tab(
                    // icon: const Icon(Icons.calendar_today),
                    text: 'Etkinlikler',
                  ),
                  new Tab(
                    // icon: const Icon(Icons.people_outline),
                    text: 'Location',
                  ),
                ],
              ),
            ),

            SliverAnimatedList(
              itemBuilder: (_, index, ___) {
                return ListTile(
                  title: Text(index.toString()),
                );
              },
              initialItemCount: 15,
            ),
          ],
        ),
      ),
    );
  }
}
