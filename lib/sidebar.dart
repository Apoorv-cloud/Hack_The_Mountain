import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meditation/focus/focus.dart';
import 'package:flutter_meditation/sleep/sleep.dart';
import 'package:rxdart/rxdart.dart';

import 'open.dart';

class SideBar extends StatefulWidget {
  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar>
    with SingleTickerProviderStateMixin<SideBar> {
  AnimationController _animationController;
  StreamController<bool> isSidebarOpenedStreamController;
  Stream<bool> isSidebarOpenedStream;
  StreamSink<bool> isSidebarOpenedSink;
  final _animationDuration = const Duration(milliseconds: 500);

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: _animationDuration);
    isSidebarOpenedStreamController = PublishSubject<bool>();
    isSidebarOpenedStream = isSidebarOpenedStreamController.stream;
    isSidebarOpenedSink = isSidebarOpenedStreamController.sink;
  }

  @override
  void dispose() {
    _animationController.dispose();
    isSidebarOpenedStreamController.close();
    isSidebarOpenedSink.close();
    super.dispose();
  }

  void onIconPressed() {
    final animationStatus = _animationController.status;
    final isAnimationCompleted = animationStatus == AnimationStatus.completed;

    if (isAnimationCompleted) {
      isSidebarOpenedSink.add(false);
      _animationController.reverse();
    } else {
      isSidebarOpenedSink.add(true);
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return StreamBuilder<bool>(
      initialData: false,
      stream: isSidebarOpenedStream,
      builder: (context, isSideBarOpenedAsync) {
        return AnimatedPositioned(
          duration: _animationDuration,
          top: 0,
          bottom: 0,
          left: isSideBarOpenedAsync.data ? 0 : -screenWidth,
          right: isSideBarOpenedAsync.data ? 0 : screenWidth - 45,
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  color: Colors.black87,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 100,
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          "Creators",
                          style: TextStyle(
                              color: Color(0xff997f66),
                              fontSize: 20,
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      ListTile(
                        title: Text(
                          "Apoorv Maheshwari",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w300),
                        ),
                        subtitle: Text(
                          "GitHub: @Apoorv-cloud",
                          style: TextStyle(
                            color: Color(0xff997f66),
                            fontSize: 15,
                          ),
                        ),
                        leading: CircleAvatar(
                          child: Icon(
                            Icons.perm_identity,
                            color: Colors.white,
                          ),
                          radius: 40,
                        ),
                      ),
                      ListTile(
                        title: Text(
                          "Stuti Goyal",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w300),
                        ),
                        subtitle: Text(
                          "GitHub: @Stuti1402",
                          style: TextStyle(
                            color: Color(0xff997f66),
                            fontSize: 15,
                          ),
                        ),
                        leading: CircleAvatar(
                          child: Icon(
                            Icons.perm_identity,
                            color: Colors.white,
                          ),
                          radius: 40,
                        ),
                      ),
                      Divider(
                        height: 84,
                        thickness: 1,
                        color: Colors.white.withOpacity(0.3),
                        indent: 12,
                        endIndent: 12,
                      ),
                      MenuItem(
                        icon: Icons.bubble_chart,
                        title: "Focus",
                        onTap: () {
                          onIconPressed();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Focuses(),
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      MenuItem(
                        icon: Icons.landscape,
                        title: "Relax",
                        onTap: () {
                          onIconPressed();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Open(),
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      MenuItem(
                        icon: Icons.brightness_3,
                        title: "Sleep",
                        onTap: () {
                          onIconPressed();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Sleep(),
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 4,
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          "CalmU",
                          style: TextStyle(
                              color: Color(0xff997f66),
                              fontSize: 20,
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment(0, -0.8),
                child: GestureDetector(
                  onTap: () {
                    onIconPressed();
                  },
                  child: ClipPath(
                    clipper: CustomMenuClipper(),
                    child: Container(
                      width: 42,
                      height: 115,
                      color: Colors.black87,
                      alignment: Alignment.centerLeft,
                      child: AnimatedIcon(
                        progress: _animationController.view,
                        icon: AnimatedIcons.menu_close,
                        color: Color(0xff997f66),
                        size: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class CustomMenuClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Paint paint = Paint();
    paint.color = Colors.white;

    final width = size.width;
    final height = size.height;

    Path path = Path();
    path.moveTo(0, 0);
    path.moveTo(0, 0);
    path.quadraticBezierTo(0, 28, 0, 35);
    path.quadraticBezierTo(
        width - 2, height / 2 - 18, width - 8, height / 2 + 6);
    path.quadraticBezierTo(width - 10, height / 2.2 + 22, 5, height - 35);
    path.quadraticBezierTo(-30, height - 30, 0, height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class MenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function onTap;

  const MenuItem({Key key, this.icon, this.title, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: Row(
          children: <Widget>[
            Icon(
              icon,
              color: Color(0xff997f66),
              size: 28,
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 23,
                  color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
