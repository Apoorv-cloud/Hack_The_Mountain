import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meditation/colorsfile.dart';
import 'package:flutter_meditation/focus/models/course.dart';
import 'package:flutter_meditation/focus/models/data.dart';
import 'package:url_launcher/url_launcher.dart';

class Courses extends StatefulWidget {
  @override
  _CoursesState createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
  Widget _buildCourses(BuildContext context, int index) {
    Size size = MediaQuery.of(context).size;
    Course course = courses[index];

    _launchURL() async {
      var url = course.corurl;
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }

    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 10, left: 20, right: 20),
      child: Container(
        height: size.height * 0.2,
        decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(30.0),
            boxShadow: [
              BoxShadow(
                  color: black.withOpacity(0.1),
                  blurRadius: 30.0,
                  offset: Offset(10, 15))
            ]),
        child: Padding(
          padding: const EdgeInsets.all(appPadding),
          child: Row(
            children: [
              Container(
                width: size.width * 0.25,
                height: size.height * 0.25,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image(
                    image: AssetImage(course.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                width: size.width * 0.45,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: appPadding / 2, top: appPadding / 2.5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        course.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                        maxLines: 2,
                      ),
                      SizedBox(
                        height: size.height * 0.025,
                      ),
                      Row(
                        children: [
                          Container(
                            child: InkWell(
                              onTap: _launchURL,
                              child: Icon(
                                Icons.all_inclusive_rounded,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.02,
                          ),
                          Text(
                            course.students,
                            style: TextStyle(
                              color: black.withOpacity(0.4),
                            ),
                            maxLines: 2,
                          )
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.access_time_outlined,
                            color: black.withOpacity(0.4),
                          ),
                          SizedBox(
                            width: size.width * 0.02,
                          ),
                          Text(
                            course.time.toString() + ' min',
                            style: TextStyle(
                              color: black.withOpacity(0.4),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Routine Yoga',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1,
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      const url = 'https://www.youtube.com/watch?v=eNjdNJ8PRbk';
                      launchURL(url);
                    });
                  },
                  child: Text(
                    'Know More',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                        color: primary),
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              SafeArea(
                child: SizedBox(
                  height: 290,
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: courses.length,
                    itemBuilder: (context, index) {
                      return _buildCourses(context, index);
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
