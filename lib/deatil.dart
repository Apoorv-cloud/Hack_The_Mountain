//import 'dart:html';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_meditation/MusicPage.dart';
import 'package:flutter_meditation/sidebar.dart';

import 'data/repository/AudioPlayerModelFactory.dart';
import 'data/repository/AudioPlayerRepository.dart';
import 'data/repository/InMemoryAudioPlayerRepository.dart';
import 'music_player/AudioPlayerBloc.dart';
import 'open.dart';

class Detail extends StatefulWidget {
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AudioPlayerRepository>(
          create: (context) => InMemoryAudioPlayerRepository(
              audioPlayerModels:
                  AudioPlayerModelFactory.getAudioPlayerModels()),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AudioPlayerBloc>(
            create: (BuildContext context) => AudioPlayerBloc(
                assetsAudioPlayer: AssetsAudioPlayer.newPlayer(),
                audioPlayerRepository:
                    RepositoryProvider.of<AudioPlayerRepository>(context)),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Classic(),
        ),
      ),
    );
  }
}

class Classic extends StatefulWidget {
  @override
  _ClassicState createState() => _ClassicState();
}

class _ClassicState extends State<Classic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          MusicPage(),
          CustomHeader(),
          SideBar(),
        ],
      ),
    );
  }
}

class CustomHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        HeaderBackground(),
        Container(
          alignment: Alignment.center,
          height: 450.0,
          padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Open(),
                        ),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: "Killing Anxiety",
                  style: TextStyle(fontSize: 35.0),
                  children: [
                    TextSpan(
                      text:
                          "\n \nCalm your anxieties, reduce tension and increase body awareness",
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Container(
                margin: EdgeInsets.only(
                  top: 1.0,
                ),
                width: 150.0,
                height: 2.0,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Colors.grey.withOpacity(.05),
                      Colors.grey.withOpacity(.5),
                      Colors.grey.withOpacity(.05),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 160.0,
          height: 140.0,
          margin: EdgeInsets.only(top: 275.0, bottom: 0),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/deep.png"),
            ),
            borderRadius: BorderRadius.circular(35.0),
          ),
        ),
      ],
    );
  }
}

class HeaderBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          width: 150.0,
          height: 150.0,
          margin: EdgeInsets.only(
            top: 275.0,
          ),
          /*decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                blurRadius: 100.0,
                spreadRadius: 20.0,
                color: Colors.blueGrey.shade800,
              ),
            ],
          ),*/
        ),
        ClipPath(
          clipper: HeaderClipper(),
          child: Container(
            height: 450.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                colorFilter: new ColorFilter.mode(
                    Colors.black.withOpacity(0.6), BlendMode.dstATop),
                image: AssetImage("assets/medit.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class HeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    var sw = size.width;
    var sh = size.height;

    path.lineTo(sw, 0);
    path.lineTo(sw, sh);
    path.cubicTo(sw, sh * .7, 0, sh * .8, 0, sh * .55);
    path.lineTo(0, sh);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
