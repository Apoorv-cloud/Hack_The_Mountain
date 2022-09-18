import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meditation/deatil.dart';
import 'package:flutter_meditation/focus/focus.dart';
import 'package:flutter_meditation/sidebar.dart';
import 'package:flutter_meditation/sleep/sleep.dart';
import 'package:provider/provider.dart';

import 'LanguageChangeProvider.dart';
import 'generated/l10n.dart';

class Open extends StatefulWidget {
  @override
  _OpenState createState() => _OpenState();
}

class _OpenState extends State<Open> {
  bool isStrechedDropDown = false;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: <Widget>[
          Scaffold(
            body: Stack(
              children: [
                CustomBody(),
                CustomAppbar(),
                NavBar(),
                SideBar(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomAppbar extends StatefulWidget {
  @override
  _CustomAppbarState createState() => _CustomAppbarState();
}

class _CustomAppbarState extends State<CustomAppbar> {
  String value = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 105.0,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white,
              Colors.transparent,
            ],
          ),
        ),
        child: Stack(
          children: [
            ClipPath(
              clipper: AppBarClipper(),
              child: Container(
                height: 50.0,
                width: MediaQuery.of(context).size.width,
                color: Color(0xff998470),
              ),
            ),
            Positioned(
              top: 30.0,
              left: MediaQuery.of(context).size.width / 2 - 25,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    radius: 25.0,
                    backgroundColor: Colors.grey.shade100,
                  ),
                  CircleAvatar(
                    radius: 23.0,
                    backgroundImage: AssetImage("assets/face.jpg"),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    "CalmU",
                    //S.of(context).CalmU,
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 20,
                        fontWeight: FontWeight.w800),
                  ),
                  SizedBox(width: 140),
                  new DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      icon: Icon(
                        Icons.translate,
                        color: Colors.black87,
                      ),
                      items: [
                        DropdownMenuItem<String>(
                          value: "🇺🇸",
                          onTap: () {
                            context
                                .read<LanguageChangeProvider>()
                                .changeLocale("en");
                          },
                          child: Center(
                            child: Text("🇺🇸   English"),
                          ),
                        ),
                        DropdownMenuItem<String>(
                          value: "🇮🇳",
                          onTap: () {
                            context
                                .read<LanguageChangeProvider>()
                                .changeLocale("hi");
                          },
                          child: Center(
                            child: Text("🇮🇳    हिंदी       "),
                          ),
                        ),
                      ],
                      onChanged: (_value) => {
                        print(_value.toString()),
                        setState(
                          () {
                            value = _value;
                          },
                        ),
                      },
                    ),
                  ),
                  //Text(
                  //"$value",
                  //),

                  /*IconButton(
                    icon: Icon(
                      Icons.translate,
                      color: Colors.black87,
                    ),
                    onPressed: () {
                      context.read<LanguageChangeProvider>().changeLocale("hi");
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.translate_rounded,
                      color: Colors.black87,
                    ),
                    onPressed: () {
                      context.read<LanguageChangeProvider>().changeLocale("en");
                    },
                  ),*/
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Section(
              headline: S.of(context).Meditation,
              description: S.of(context).Med1,
              img: AssetImage("assets/dessert.jpg"),
            ),
            Section(
              headline: S.of(context).Sensation,
              description: S.of(context).Sen1,
              img: AssetImage('assets/gala.jpg'),
            ),
          ],
        ),
        Center(
          child: ClipPath(
            clipper: MidClipper(),
            child: Section(
              headline: S.of(context).Daydream,
              description: S.of(context).Day1,
              img: AssetImage('assets/lo.jpg'),
            ),
          ),
        ),
      ],
    );
  }
}

class Section extends StatelessWidget {
  final String headline;
  final String description;
  final ImageProvider img;

  const Section({
    Key key,
    this.headline,
    this.description,
    this.img,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Detail(),
          ),
        );
      },
      child: Container(
        height: MediaQuery.of(context).size.height * .5,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: img,
          ),
        ),
        child: Center(
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: headline,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
              ),
              children: [
                TextSpan(
                  text: '\n$description',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
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
                active: true,
              ),
              SizedBox(
                width: 1.0,
              ),
              NavThree(
                icon: Icons.brightness_3,
                active: false,
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
        Navigator.pop(context);
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
        Navigator.pop(context);
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
        Navigator.pop(context);
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

class MidClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    var sw = size.width;
    var sh = size.height;
    path.cubicTo(0, sh * .3, sw, sh * .2, sw, sh * .45);
    path.lineTo(sw, sh);
    path.cubicTo(sw, sh * .7, 0, sh * .8, 0, sh * .55);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
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

class AppBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    var sw = size.width;
    var sh = size.height;

    path.lineTo(0, sh);
    path.lineTo(4 * sw / 12, sh);
    path.cubicTo(5 * sw / 12, sh, 5 * sw / 12, sh / 2, 6 * sw / 12, sh / 2);
    path.cubicTo(7 * sw / 12, sh / 2, 7 * sw / 12, sh, 8 * sw / 12, sh);
    path.lineTo(sw, sh);
    path.lineTo(sw, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
