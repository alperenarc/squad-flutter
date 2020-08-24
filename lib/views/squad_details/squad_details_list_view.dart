import 'package:flutter/material.dart';
import 'package:squad/widgets/activity_button.dart';
import 'package:squad/widgets/category_card.dart';
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
      body: ScrollableScreen(),
    );
  }

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
            "Detay",
            style: Theme.of(context)
                .textTheme
                .headline6
                .copyWith(fontWeight: FontWeight.w900, color: kTextColor),
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

class ScrollableScreen extends StatefulWidget {
  @override
  _ScrollableScreenState createState() => _ScrollableScreenState();
}

class _ScrollableScreenState extends State<ScrollableScreen>
    with SingleTickerProviderStateMixin {
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
            SliverToBoxAdapter(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 8.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text('Bizim Ekip',
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w900,
                                  color: kTextColor)),
                          leaveSquadButton(),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            CircleAvatar(
                              radius: 20.0,
                              backgroundImage: NetworkImage(
                                  'https://lh3.googleusercontent.com/-8AfhWpBMmjQ/AAAAAAAAAAI/AAAAAAAAAAA/AMZuucnFDgk77iFoIF2QTNjWMJWdPJsF5w/s96-c/photo.jpg'),
                              backgroundColor: Colors.transparent,
                            ),
                            SizedBox(width: 15),
                            Text(
                              '17.02.2020 tarihinde \nAlperen Arıcı tarafından kuruldu.',
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2
                                  .copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: kTextColor),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverAppBar(
              pinned: true,
              automaticallyImplyLeading: false,
              backgroundColor: kBlueLightColor,
              title: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.calendar_today, color: kTextColor),
                    SizedBox(width: 20),
                    Text(
                      'Etkinlikler',
                      style: TextStyle(color: kTextColor),
                    )
                  ],
                ),
              ),
            ),
            // SliverToBoxAdapter(
            //   child: Container(
            //     height:500,
            //     child: GridView.count(
            //       // Create a grid with 2 columns. If you change the scrollDirection to
            //       // horizontal, this produces 2 rows.
            //       crossAxisCount: 2,
            //       // Generate 100 widgets that display their index in the List.
            //       children: List.generate(100, (index) {
            //         return Center(
            //           child: Text(
            //             'Item $index',
            //             style: Theme.of(context).textTheme.headline5,
            //           ),
            //         );
            //       }),
            //     ),
            //   ),
            // ),
            // SliverAnimatedList(
            //   itemBuilder: (_, index, ___) {
            //     return ListTile(
            //       title: Text(index.toString()),

            //     );
            //   },
            //   initialItemCount: 15,
            // ),
            SliverGrid(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200.0,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return ActivityButton();
                },
                childCount: 20,
              ),
            )
          ],
        ),
      ),
    );
  }

  InkWell leaveSquadButton() {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(29.5),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            "Gruptan Ayrıl",
            style: TextStyle(fontSize: 15, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
