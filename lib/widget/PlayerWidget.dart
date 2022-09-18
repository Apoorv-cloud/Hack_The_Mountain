import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_meditation/model/AudioPlayerModel.dart';
import 'package:flutter_meditation/music_player/AudioPlayerBloc.dart';
import 'package:flutter_meditation/music_player/AudioPlayerEvent.dart';
import 'package:flutter_meditation/music_player/AudioPlayerState.dart';

class PlayerWidget extends StatelessWidget {
  const PlayerWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AudioPlayerBloc, AudioPlayerState>(
      builder: (context, state) {
        if (state is AudioPlayerInitial || state is AudioPlayerReady) {
          return SizedBox.shrink();
        }
        if (state is AudioPlayerPlaying) {
          return _showPlayer(context, state.playingEntity);
        }
        if (state is AudioPlayerPaused) {
          return _showPlayer(context, state.pausedEntity);
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }

  Widget _showPlayer(BuildContext context, AudioPlayerModel model) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return WidgetDetailMusicPlayer();
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          isScrollControlled: true,
          isDismissible: false,
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            child: Container(
              padding: EdgeInsets.only(top: 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35.0),
                  topRight: Radius.circular(35.0),
                ),
                color: Colors.purple.shade50,
              ),
              child: ListTile(
                leading: setLeading(model),
                title: setTitle(model),
                subtitle: setSubtitle(model),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 3, horizontal: 20),
                trailing: IconButton(
                  icon: setIcon(model),
                  onPressed: setCallback(context, model),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget setIcon(AudioPlayerModel model) {
    if (model.isPlaying)
      return ImageIcon(AssetImage("assets/pause.png"),
          size: 18, color: Colors.deepPurpleAccent);
    else
      return ImageIcon(
        AssetImage("assets/play-button.png"),
        color: Colors.deepPurpleAccent.shade400,
        size: 20,
      );
  }

  Widget setLeading(AudioPlayerModel model) {
    return new Image.asset(
      model.audio.metas.image.path,
      height: 50,
      width: 50,
    );
  }

  Widget setTitle(AudioPlayerModel model) {
    return Text(
      model.audio.metas.title,
      style: TextStyle(
        color: Colors.deepPurpleAccent.shade700,
      ),
    );
  }

  Widget setSubtitle(AudioPlayerModel model) {
    return Text(
      model.audio.metas.artist,
      style: TextStyle(
        color: Colors.black54,
      ),
    );
  }

  Function setCallback(BuildContext context, AudioPlayerModel model) {
    if (model.isPlaying)
      return () {
        BlocProvider.of<AudioPlayerBloc>(context)
            .add(TriggeredPauseAudio(model));
      };
    else
      return () {
        BlocProvider.of<AudioPlayerBloc>(context)
            .add(TriggeredPlayAudio(model));
      };
  }
}

class WidgetDetailMusicPlayer extends StatelessWidget {
  Timer timer;

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double widthScreen = mediaQueryData.size.width;
    double heightScreen = mediaQueryData.size.height;
    double paddingBottom = mediaQueryData.padding.bottom;

    return Container(
      width: widthScreen,
      height: heightScreen,
      child: Stack(
        children: <Widget>[
          _buildWidgetBackgroundCoverAlbum(widthScreen, heightScreen),
          _buildWidgetContainerContent(widthScreen, heightScreen),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            width: widthScreen,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(height: 128.0 + 16.0),
                      Container(
                        width: 72.0,
                        padding: EdgeInsets.symmetric(vertical: 4.0),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          borderRadius: BorderRadius.all(Radius.circular(16.0)),
                        ),
                        child: Icon(Icons.keyboard_arrow_down,
                            color: Colors.white),
                      ),
                      SizedBox(height: 24.0),
                      ClipRRect(
                        child: Image.asset(
                          'assets/deep.png',
                          width: widthScreen / 1.5,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(48.0)),
                      ),
                    ],
                  ),
                ),
                WidgetDetailTitleMusic(),
                SizedBox(height: 16.0),
                WidgetProgressMusic(),
                SizedBox(height: 16.0),
                _buildWidgetPlayerController(),
                SizedBox(height: 16.0),
                SizedBox(height: paddingBottom > 0 ? paddingBottom : 16.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildWidgetPlayerController() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      GestureDetector(
          child: Icon(Icons.skip_previous, color: Colors.white, size: 32.0),
          behavior: HitTestBehavior.translucent,
          onTap: () {
            // changeTrack(false);
          }),
      SizedBox(width: 36.0),
      Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.blueGrey[800],
        ),
        padding: EdgeInsets.all(16.0),
        child: BlocBuilder<AudioPlayerBloc, AudioPlayerState>(
          builder: (context, state) {
            bool isPlaying = true;
            if (state is AudioPlayerPaused) {
              isPlaying = false;
            }
            return Icon(isPlaying ? Icons.pause : Icons.play_arrow,
                color: Colors.white, size: 32.0);
          },
        ),
      ),
      SizedBox(width: 36.0),
      Icon(Icons.skip_next, color: Colors.white, size: 32.0),
    ],
  );
}

class WidgetDetailTitleMusic extends StatefulWidget {
  @override
  _WidgetDetailTitleMusicState createState() => _WidgetDetailTitleMusicState();
}

class _WidgetDetailTitleMusicState extends State<WidgetDetailTitleMusic> {
  bool _isRepeatOne = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                  BlocProvider.of<AudioPlayerBloc>(context)
                      .assetsAudioPlayer
                      .current
                      .value
                      .audio
                      .audio
                      .metas
                      .title,
                  style: Theme.of(context).textTheme.title),
              Text(
                  BlocProvider.of<AudioPlayerBloc>(context)
                      .assetsAudioPlayer
                      .current
                      .value
                      .audio
                      .audio
                      .metas
                      .artist,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle
                      .merge(TextStyle(color: Colors.blueGrey))),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() => _isRepeatOne = !_isRepeatOne);
          },
          child: Icon(
            Icons.repeat_one,
            color: _isRepeatOne ? Color(0xFFAE1947) : Color(0xFF000000),
          ),
        ),
      ],
    );
  }
}

class WidgetProgressMusic extends StatelessWidget {
  double _progress = 0;
  int _durationProgress = 0;
  int progressSecond;
  double progressMusic;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AudioPlayerBloc, AudioPlayerState>(
        builder: (context, state) {
      if (state is MusicUpdateProgress) {
        _progress = state.progressMusic / 100;
        _durationProgress = state.progressSecond;
      }
      int minute = _durationProgress ~/ 60;
      int second = minute > 0 ? _durationProgress % 60 : _durationProgress;
      String strDuration = (minute < 10 ? '0$minute' : '$minute') +
          ':' +
          (second < 10 ? '0$second' : '$second');
      return Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          LinearProgressIndicator(
            value: _progress,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            backgroundColor: Colors.blueGrey[800],
          ),
          Text(strDuration),
        ],
      );
    });
  }
}

abstract class MusicState {}

class MusicInitial extends MusicState {}

class MusicUpdateProgress extends MusicState {
  final int progressSecond;
  final double progressMusic;

  MusicUpdateProgress(this.progressSecond, this.progressMusic);
}

class MusicEndProgress extends MusicState {}

abstract class MusicEvent {}

class MusicStart extends MusicEvent {
  final Music music;

  MusicStart(this.music);
}

class MusicUpdate extends MusicEvent {}

class MusicEnd extends MusicEvent {}

class MusicBloc extends Bloc<MusicEvent, MusicState> {
  Music music;
  int progressSecond;
  double progressMusic;

  @override
  MusicState get initialState => MusicInitial();

  @override
  Stream<MusicState> mapEventToState(MusicEvent event) async* {
    if (event is MusicStart) {
      music = event.music;
      progressSecond = 0;
      progressMusic = 0;
      yield MusicUpdateProgress(progressSecond, progressMusic);
    } else if (event is MusicUpdate) {
      progressSecond += 1;
      progressMusic = (progressSecond / music.durationSecond) * 100;
      print('progressSecond: $progressSecond');
      yield MusicUpdateProgress(progressSecond, progressMusic);
    } else if (event is MusicEnd) {
      yield MusicEndProgress();
    }
  }
}

class Music {
  String title;
  String artist;
  int durationSecond;

  Music(this.title, this.artist, this.durationSecond);
}

Widget _buildWidgetBackgroundCoverAlbum(
    double widthScreen, double heightScreen) {
  return Container(
    width: widthScreen,
    height: heightScreen / 2,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/medit.jpg'),
        fit: BoxFit.cover,
      ),
    ),
    child: BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 5.0,
        sigmaY: 5.0,
      ),
      child: Container(
        color: Colors.white.withOpacity(0.0),
      ),
    ),
  );
}

Widget _buildWidgetContainerContent(double widthScreen, double heightScreen) {
  return Align(
    alignment: Alignment.bottomCenter,
    child: Container(
      width: widthScreen,
      height: heightScreen / 1.4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(48.0), topRight: Radius.circular(48.0)),
        gradient: LinearGradient(
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
          colors: [
            Colors.blueGrey[300],
            Colors.white,
          ],
          stops: [0.1, 0.9],
        ),
      ),
    ),
  );
}
