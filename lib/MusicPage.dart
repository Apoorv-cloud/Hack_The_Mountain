import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_meditation/music_player/AudioPlayerBloc.dart';
import 'package:flutter_meditation/music_player/AudioPlayerEvent.dart';
import 'package:flutter_meditation/music_player/AudioPlayerState.dart';
import 'package:flutter_meditation/widget/AudioTrackWidget.dart';
import 'package:flutter_meditation/widget/PlayerWidget.dart';

class MusicPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.topCenter,
        child: BlocBuilder<AudioPlayerBloc, AudioPlayerState>(
            builder: (context, state) {
          if (state is AudioPlayerInitial) {
            BlocProvider.of<AudioPlayerBloc>(context).add(InitializeAudio());
            return buildCircularProgress();
          } else if (state is AudioPlayerReady) {
            return buildReadyTrackList(state);
          } else if (state is AudioPlayerPlaying) {
            return buildPlayingTrackList(state);
          } else if (state is AudioPlayerPaused) {
            return buildPausedTrackList(state);
          } else {
            return buildUnknownStateError();
          }
        }));
  }

  Widget buildReadyTrackList(AudioPlayerReady state) {
    return Container(
        margin: EdgeInsets.only(top: 460),
        child: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return AudioTrackWidget(
                  audioPlayerModel: state.entityList[index]);
            },
            itemCount: state.entityList.length));
  }

  Widget buildPlayingTrackList(AudioPlayerPlaying state) {
    return Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 460),
          child: ListView.builder(
              //padding: EdgeInsets.only(top: 460),
              itemBuilder: (BuildContext context, int index) {
                return AudioTrackWidget(
                    audioPlayerModel: state.entityList[index]);
              },
              itemCount: state.entityList.length),
        ),
        Container(
          alignment: Alignment.bottomCenter,
          child: PlayerWidget(),
        )
      ],
    );
  }

  Widget buildPausedTrackList(AudioPlayerPaused state) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(top: 460),
          //alignment: Alignment.topCenter,
          child: ListView.builder(
              //padding: EdgeInsets.only(top: 460),
              itemBuilder: (BuildContext context, int index) {
                return AudioTrackWidget(
                    audioPlayerModel: state.entityList[index]);
              },
              itemCount: state.entityList.length),
        ),
        Container(
          alignment: Alignment.bottomCenter,
          child: PlayerWidget(),
        )
      ],
    );
  }

  Widget buildCircularProgress() {
    return Center(child: CircularProgressIndicator());
  }

  Widget buildUnknownStateError() {
    return Text("Unknown state error");
  }
}
