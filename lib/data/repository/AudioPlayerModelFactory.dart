import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter_meditation/model/AudioPlayerModel.dart';

class AudioPlayerModelFactory {
  static List<AudioPlayerModel> getAudioPlayerModels() {
    return [
      /*AudioPlayerModel(
          id: "1",
          isPlaying: false,
          audio: Audio("assets/audio/meditation_piano.mp3",
              metas: Metas(
                id: "1",
                title: "Forest Birds",
                artist: "Joe Doe",
                album: "Country Album",
                image: MetasImage.asset("assets/country.jpg"),
              ))),*/
      AudioPlayerModel(
          id: "2",
          isPlaying: false,
          audio: Audio("assets/audios/meditation_piano.mp3",
              metas: Metas(
                id: "2",
                title: "Soothing Piano",
                artist: "Joe Doe",
                album: "Country Album",
                image: MetasImage.asset("assets/piano.jpg"),
              ))),
      AudioPlayerModel(
          id: "3",
          isPlaying: false,
          audio: Audio("assets/audios/meditation_stones.mp3",
              metas: Metas(
                id: "3",
                title: "Meditation Stones",
                artist: "Joe Doe",
                album: "Country Album",
                image: MetasImage.asset("assets/st.jpg"),
              ))),
      AudioPlayerModel(
          id: "4",
          isPlaying: false,
          audio: Audio("assets/audios/meditation_wind_chimes.mp3",
              metas: Metas(
                id: "4",
                title: "Wind Chimes",
                artist: "Joe Doe",
                album: "Country Album",
                image: MetasImage.asset("assets/wind.jpg"),
              ))),
      AudioPlayerModel(
          id: "5",
          isPlaying: false,
          audio: Audio("assets/audios/country_2.mp3",
              metas: Metas(
                id: "5",
                title: "My Other Country Song",
                artist: "Joe Doe",
                album: "Country Album",
                image: MetasImage.asset("assets/country.jpg"),
              ))),
      AudioPlayerModel(
          id: "6",
          isPlaying: false,
          audio: Audio("assets/audios/country.mp3",
              metas: Metas(
                id: "6",
                title: "My Country Song",
                artist: "Joe Doe",
                album: "Country Album",
                image: MetasImage.asset("assets/country.jpg"),
              ))),
      AudioPlayerModel(
          id: "7",
          isPlaying: false,
          audio: Audio("assets/audios/country_2.mp3",
              metas: Metas(
                id: "7",
                title: "My Other Country Song",
                artist: "Joe Doe",
                album: "Country Album",
                image: MetasImage.asset("assets/country.jpg"),
              ))),
      AudioPlayerModel(
          id: "8",
          isPlaying: false,
          audio: Audio("assets/audios/country_2.mp3",
              metas: Metas(
                id: "8",
                title: "My Other Country Song",
                artist: "Joe Doe",
                album: "Country Album",
                image: MetasImage.asset("assets/country.jpg"),
              ))),
    ];
  }
}
