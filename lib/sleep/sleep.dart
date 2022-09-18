import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_meditation/focus/focus.dart';
import 'package:flutter_meditation/open.dart';

import '../sidebar.dart';
import 'meditation_screen.dart';

class Sleep extends StatefulWidget {
  @override
  _SleepState createState() => _SleepState();
}

class _SleepState extends State<Sleep> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return Scaffold(
      body: Stack(
        children: [
          MeditationScreen(),
          NavBar(),
          SideBar(),
        ],
      ),
    );
  }
}

class NavBar extends StatefulWidget {
  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 0.0,
          child: ClipPath(
            clipper: NavBarClipper(),
            child: Container(
              height: 60.0,
              width: MediaQuery.of(context).size.width,
              color: Color(0xff1e1e1e),
            ),
          ),
        ),
        Positioned(
          bottom: 45.0,
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NavOne(
                icon: Icons.bubble_chart,
                active: false,
              ),
              SizedBox(
                width: 1.0,
              ),
              NavTwo(
                icon: Icons.landscape,
                active: false,
              ),
              SizedBox(
                width: 1.0,
              ),
              NavThree(
                icon: Icons.brightness_3,
                active: true,
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 10.0,
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Focus",
                style: TextStyle(
                  color: Colors.white70,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                width: 1.0,
              ),
              Text(
                "Relax",
                style: TextStyle(
                  color: Colors.white70,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                width: 1.0,
              ),
              Text(
                "Sleep",
                style: TextStyle(
                  color: Colors.white70,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class NavOne extends StatelessWidget {
  final IconData icon;
  final bool active;

  const NavOne({
    Key key,
    this.icon,
    this.active,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
              transitionDuration: Duration(seconds: 1),
              transitionsBuilder: (context, animation, animationTime, child) {
                animation = CurvedAnimation(
                    parent: animation, curve: Curves.elasticOut);
                return ScaleTransition(
                  alignment: Alignment.bottomLeft,
                  scale: animation,
                  child: child,
                );
              },
              pageBuilder: (context, animation, animationTime) {
                return Focuses();
              }),
        );
      },
      child: CircleAvatar(
        radius: 25.0,
        backgroundColor: Color(0xff1e1e1e),
        child: CircleAvatar(
          radius: 25.0,
          backgroundColor: active ? Colors.grey.shade100 : Colors.transparent,
          child: Icon(
            icon,
            color: active ? Colors.black87 : Colors.white,
          ),
        ),
      ),
    );
  }
}

class NavTwo extends StatelessWidget {
  final IconData icon;
  final bool active;

  const NavTwo({
    Key key,
    this.icon,
    this.active,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
              transitionDuration: Duration(seconds: 1),
              transitionsBuilder: (context, animation, animationTime, child) {
                animation = CurvedAnimation(
                    parent: animation, curve: Curves.elasticOut);
                return ScaleTransition(
                  alignment: Alignment.bottomCenter,
                  scale: animation,
                  child: child,
                );
              },
              pageBuilder: (context, animation, animationTime) {
                return Open();
              }),
        );
      },
      child: CircleAvatar(
        radius: 25.0,
        backgroundColor: Color(0xff1e1e1e),
        child: CircleAvatar(
          radius: 25.0,
          backgroundColor: active ? Colors.grey.shade100 : Colors.transparent,
          child: Icon(
            icon,
            color: active ? Colors.black87 : Colors.white,
          ),
        ),
      ),
    );
  }
}

class NavThree extends StatelessWidget {
  final IconData icon;
  final bool active;

  const NavThree({
    Key key,
    this.icon,
    this.active,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
              transitionDuration: Duration(seconds: 1),
              transitionsBuilder: (context, animation, animationTime, child) {
                animation = CurvedAnimation(
                    parent: animation, curve: Curves.elasticOut);
                return ScaleTransition(
                  alignment: Alignment.bottomRight,
                  scale: animation,
                  child: child,
                );
              },
              pageBuilder: (context, animation, animationTime) {
                return Sleep();
              }),
        );
      },
      child: CircleAvatar(
        radius: 25.0,
        backgroundColor: Colors.white,
        child: CircleAvatar(
          radius: 25.0,
          backgroundColor: active ? Colors.grey.shade100 : Colors.transparent,
          child: Icon(
            icon,
            color: active ? Colors.black87 : Colors.white,
          ),
        ),
      ),
    );
  }
}

class NavBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    var sw = size.width;
    var sh = size.height;
    path.cubicTo(sw / 12, 0, sw / 12, 2 * sh / 5, 2 * sw / 12, 2 * sh / 5);
    path.cubicTo(3 * sw / 12, 2 * sh / 5, 3 * sw / 12, 0, 4 * sw / 12, 0);
    path.cubicTo(
        5 * sw / 12, 0, 5 * sw / 12, 2 * sh / 5, 6 * sw / 12, 2 * sh / 5);
    path.cubicTo(7 * sw / 12, 2 * sh / 5, 7 * sw / 12, 0, 8 * sw / 12, 0);
    path.cubicTo(
        9 * sw / 12, 0, 9 * sw / 12, 2 * sh / 5, 10 * sw / 12, 2 * sh / 5);
    path.cubicTo(11 * sw / 12, 2 * sh / 5, 11 * sw / 12, 0, sw, 0);
    path.lineTo(sw, sh);
    path.lineTo(0, sh);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
