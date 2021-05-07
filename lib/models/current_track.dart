import 'package:flutter/material.dart';
import 'package:spotify_web_ui_clone/data/data.dart';

class CurrentTrackModel extends ChangeNotifier {
  Song? selectedSong;

  void selectTrack(Song song) {
    selectedSong = song;
    notifyListeners();
  }
}
