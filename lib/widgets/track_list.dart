import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify_web_ui_clone/data/data.dart';
import 'package:spotify_web_ui_clone/models/current_track.dart';

class TrackList extends StatelessWidget {
  final List<Song> tracks;

  const TrackList({Key? key, required this.tracks}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DataTable(
      headingTextStyle:
          Theme.of(context).textTheme.overline!.copyWith(fontSize: 12.0),
      dataRowHeight: 54.0,
      showCheckboxColumn: false,
      columns: const [
        DataColumn(label: Text('TITLE')),
        DataColumn(label: Text('ARTIST')),
        DataColumn(label: Text('ALBUM')),
        DataColumn(label: Icon(Icons.access_time)),
      ],
      rows: tracks.map((e) {
        final selected =
            Provider.of<CurrentTrackModel>(context).selectedSong?.id == e.id;
        final textStyle = TextStyle(
            color: selected
                ? Theme.of(context).accentColor
                : Theme.of(context).iconTheme.color);
        return DataRow(
          selected: selected,
          onSelectChanged: (_) =>
              Provider.of<CurrentTrackModel>(context, listen: false)
                  .selectTrack(e),
          cells: [
            DataCell(
              Text(e.title, style: textStyle),
            ),
            DataCell(
              Text(e.artist, style: textStyle),
            ),
            DataCell(
              Text(e.album, style: textStyle),
            ),
            DataCell(
              Text(e.duration, style: textStyle),
            ),
          ],
        );
      }).toList(),
    );
  }
}
