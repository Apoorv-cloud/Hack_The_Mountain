import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_meditation/model/AudioPlayerModel.dart';
import 'package:flutter_meditation/music_player/AudioPlayerBloc.dart';
import 'package:flutter_meditation/music_player/AudioPlayerEvent.dart';

class AudioTrackWidget extends StatelessWidget {
  final AudioPlayerModel audioPlayerModel;

  const AudioTrackWidget({Key key, @required this.audioPlayerModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 0, left: 10),
      child: Container(
        padding: EdgeInsets.only(top: 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(70.0),
            topRight: Radius.circular(70.0),
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.orange.withOpacity(0.03),
                blurRadius: 300.0,
                offset: Offset(50, 50))
          ],
        ),
        child: ListTile(
          leading: setLeading(),
          horizontalTitleGap: 15.0,
          minVerticalPadding: 7,
          title: setTitle(),
          subtitle: setSubtitle(),
          trailing: IconButton(
            icon: setIcon(),
            onPressed: setCallback(context),
          ),
        ),
      ),
    );
  }

  Widget setIcon() {
    if (audioPlayerModel.isPlaying)
      return ImageIcon(
        AssetImage("assets/pause.png"),
        color: Colors.deepOrange.shade300,
        size: 18,
      );
    else
      return ImageIcon(
        AssetImage("assets/play-button.png"),
        color: Colors.deepOrange,
        size: 20,
      );
  }

  Widget setLeading() {
    return new Image.asset(
      audioPlayerModel.audio.metas.image.path,
      height: 50,
      width: 50,
    );
  }

  Widget setTitle() {
    return Text(
      audioPlayerModel.audio.metas.title,
      style: TextStyle(
        fontSize: 15,
        color: Colors.deepOrangeAccent,
      ),
    );
  }

  Widget setSubtitle() {
    return Text(
      audioPlayerModel.audio.metas.artist,
      style: TextStyle(fontSize: 13),
    );
  }

  Function setCallback(BuildContext context) {
    if (audioPlayerModel.isPlaying)
      return () {
        BlocProvider.of<AudioPlayerBloc>(context)
            .add(TriggeredPauseAudio(audioPlayerModel));
      };
    else
      return () {
        BlocProvider.of<AudioPlayerBloc>(context)
            .add(TriggeredPlayAudio(audioPlayerModel));
      };
  }
}
