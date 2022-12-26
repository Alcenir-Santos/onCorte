import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:polygon_clipper/polygon_clipper.dart';
import '../Views/HomeEmpresas.dart';
import 'package:rolling_nav_bar/rolling_nav_bar.dart';

class BottomPage extends StatefulWidget {
  BottomPage() : super();
  @override
  _TabsDemoScreenState createState() => _TabsDemoScreenState();
}

class _TabsDemoScreenState extends State<BottomPage> {
  Color logoColor;
  int activeIndex;

  var iconData = <IconData>[
    Icons.home,
    Icons.people,
    Icons.account_circle,
    Icons.chat,
    Icons.settings,
  ];

  var iconText = <Widget>[
    Text('Home', style: TextStyle(color: Colors.grey, fontSize: 12)),
    Text('Friends', style: TextStyle(color: Colors.grey, fontSize: 12)),
    Text('Account', style: TextStyle(color: Colors.grey, fontSize: 12)),
    Text('Chat', style: TextStyle(color: Colors.grey, fontSize: 12)),
    Text('Settings', style: TextStyle(color: Colors.grey, fontSize: 12)),
  ];

  @override
  void initState() {
    logoColor = Colors.red[600];
    activeIndex = 0;
    super.initState();
  }

  void incrementIndex() {
    setState(() {
      activeIndex = activeIndex < (iconData.length - 1) ? activeIndex + 1 : 0;
      print(activeIndex);
    });
  }

  // ignore: unused_element
  _onAnimate(AnimationUpdate update) {
    setState(() {
      logoColor = update.color;
    });
  }

  _onTap(int index) {
    activeIndex = index;
  }

  int currentTabIndex = 0;
  List<Widget> tabs = [
    TabScreen(Colors.orange),
    TabScreen(Colors.blue),
    HomeEmpresas(),
    TabScreen(Colors.red),
    TabScreen(Colors.black),
  ];
  onTapped(int index) {
    setState(() {
      currentTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (BuildContext context) {
          return Stack(
            children: <Widget>[
              Positioned(
                top: 100,
                height: 414,
                width: MediaQuery.of(context).size.width,
                child: GestureDetector(
                  onTap: incrementIndex,
                  child: ClipPolygon(
                    sides: 6,
                    borderRadius: 15,
                    child: Container(
                      height: MediaQuery.of(context).size.width,
                      width: MediaQuery.of(context).size.width,
                      color: logoColor,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 140, 30, 0),
                          child: Transform(
                            transform: Matrix4.skew(0.1, -0.55),
                            child: Text(
                              'Rolling\nNav Bar',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 70,
                                fontFeatures: <FontFeature>[
                                  FontFeature.enable('smcp')
                                ],
                                shadows: <Shadow>[
                                  Shadow(
                                    offset: Offset(5, 5),
                                    blurRadius: 3.0,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                  ),
                                  Shadow(
                                    offset: Offset(5, 5),
                                    blurRadius: 8.0,
                                    color: Color.fromARGB(125, 0, 0, 255),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                height: 95,
                width: MediaQuery.of(context).size.width,
                // Option 1: Recommended
                child: RollingNavBar.iconData(
                  activeIndex: activeIndex,
                  animationCurve: Curves.linear,
                  animationType: AnimationType.roll,
                  baseAnimationSpeed: 200,
                  iconData: iconData,
                  iconColors: <Color>[Colors.grey[800]],
                  iconText: iconText,
                  indicatorColors: <Color>[
                    Colors.red,
                    Colors.orange,
                    Colors.green,
                    Colors.blue,
                    Colors.purple,
                  ],
                  iconSize: 25,
                  indicatorRadius: 20,
                  onAnimate: _onAnimate,
                  onTap: _onTap,
                ),

                // Option 2: More work, but there if you need it
                // child: RollingNavBar.children(
                //   children: <Widget>[
                //     Text('1', style: TextStyle(color: Colors.grey)),
                //     Text('2', style: TextStyle(color: Colors.grey)),
                //     Text('3', style: TextStyle(color: Colors.grey)),
                //   ],
                // ),
              ),
            ],
          );
        },
      ),
      // backgroundColor: Colors.yellow,
      // fixedColor: Colors.black38,
      // elevation: 0,
      // selectedItemColor: Colors.red,
      // unselectedItemColor: Colors.black38,
      // onTap: onTapped,iconSize: 30,
      // currentIndex: currentTabIndex,
    );
  }
}
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: tabs[currentTabIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         // backgroundColor: Colors.yellow,
//         // fixedColor: Colors.black38,
//         elevation: 0,
//         selectedItemColor: Colors.red,
//         unselectedItemColor: Colors.black38,
//         onTap: onTapped,iconSize: 30,
//         currentIndex: currentTabIndex,
//         items: [
//           BottomNavigationBarItem(
//             backgroundColor: Colors.white,
//             icon: Icon(Icons.home),
//             title: Text(""),
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.mail),
//             title: Text(""),
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             title: Text(""),
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             title: Text(""),
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             title: Text(""),
//           ),
//         ],
//       ),
//     );
//   }
// }

class TabScreen extends StatelessWidget {
  final Color color;
  TabScreen(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
    );
  }
}

// class BottomPage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<BottomPage> {
//   final Key keyOne = PageStorageKey('pageOne');
//   final Key keyTwo = PageStorageKey('pageTwo');

//   int currentTab = 0;

//   PageOne one;
//   PageTwo two;
//   List<Widget> pages;
//   Widget currentPage;

//   List<Data> dataList;
//   final PageStorageBucket bucket = PageStorageBucket();

//   @override
//   void initState() {
//     dataList = [
//       Data(1, false, "Example-1"),
//       Data(2, false, "Example-2"),
//       Data(3, false, "Example-3"),
//       Data(4, false, "Example-4"),
//       Data(5, false, "Example-5"),
//       Data(6, false, "Example-6"),
//       Data(7, false, "Example-7"),
//       Data(8, false, "Example-8"),
//       Data(9, false, "Example-9"),
//       Data(10, false, "Example-10"),
//     ];
//     one = PageOne(
//       key: keyOne,
//       dataList: dataList,
//     );
//     two = PageTwo(
//       key: keyTwo,
//     );

//     pages = [one, two];

//     currentPage = one;

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Persistance Example"),
//       ),
//       body: PageStorage(
//         child: currentPage,
//         bucket: bucket,
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: currentTab,
//         onTap: (int index) {
//           setState(() {
//             currentTab = index;
//             currentPage = pages[index];
//           });
//         },
//         items: <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             title: Text('Home'),
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.settings),
//             title: Text("Settings"),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class PageOne extends StatefulWidget {
//   final List<Data> dataList;
//   PageOne({
//     Key key,
//     this.dataList,
//   }) : super(key: key);

//   @override
//   PageOneState createState() => PageOneState();
// }

// class PageOneState extends State<PageOne> {
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//         itemCount: widget.dataList.length,
//         itemBuilder: (context, index) {
//           return ExpansionTile(
//             key: PageStorageKey('${widget.dataList[index].id}'),
//             title: Text(widget.dataList[index].title),
//             // onExpansionChanged: (b) => setState(() {
//             //       widget.dataList[index].expanded = b;
//             //       PageStorage.of(context).writeState(context, b,
//             //           identifier: ValueKey(
//             //             '${widget.dataList[index].id}',
//             //           ));
//             //     }),
//             // initiallyExpanded: widget.dataList[index].expanded,
//             //  PageStorage.of(context).readState(
//             //           context,
//             //           identifier: ValueKey(
//             //             '${widget.dataList[index].id}',
//             //           ),
//             //         ) ??
//             //     false,
//             children: <Widget>[
//               Container(
//                 color: index % 2 == 0 ? Colors.orange : Colors.limeAccent,
//                 height: 100.0,
//               ),
//             ],
//           );
//         });
//   }
// }

// class PageTwo extends StatefulWidget {
//   PageTwo({Key key}) : super(key: key);

//   @override
//   PageTwoState createState() => PageTwoState();
// }

// class PageTwoState extends State<PageTwo> {
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemExtent: 250.0,
//       itemBuilder: (context, index) => Container(
//             padding: EdgeInsets.all(10.0),
//             child: Material(
//               elevation: 4.0,
//               borderRadius: BorderRadius.circular(5.0),
//               color: index % 2 == 0 ? Colors.cyan : Colors.deepOrange,
//               child: Center(
//                 child: Text(index.toString()),
//               ),
//             ),
//           ),
//     );
//   }
// }

// class Data {
//   final int id;
//   bool expanded;
//   final String title;
//   Data(this.id, this.expanded, this.title);
// }
