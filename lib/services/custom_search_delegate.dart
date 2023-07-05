import 'package:flutter/material.dart';
import 'package:yuki_club_web/services/string_service.dart';
import '../class/Song.dart';
import '../materials/InitData.dart';
import '../screens/song_page.dart';

class CustomSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    // clear the query
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // close and leave the search bar
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    // show the match
    List<String> matchQuery = [];
    for (var song in InitData.allSongs) {
      if (StringService.dashToSpace(song.toLowerCase())
          .contains(query.toLowerCase())) {
        matchQuery.add(song);
      }
    }

    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        var result_display = StringService.dashToSpace(matchQuery[index]);
        return ListTile(
          title: Text(result_display),
          onTap: () async {
            Song currSong = await Song.readSong(result);
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => SongPage(
                      song: currSong,
                    )));
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // show the match
    List<String> matchQuery = [];
    for (var song in InitData.allSongs) {
      if (StringService.dashToSpace(song.toLowerCase())
          .contains(query.toLowerCase())) {
        matchQuery.add(song);
      }
    }

    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        var result_display = StringService.dashToSpace(matchQuery[index]);
        return ListTile(
          title: Text(result_display),
          onTap: () async {
            Song currSong = await Song.readSong(result);
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => SongPage(
                      song: currSong,
                    )));
          },
        );
      },
    );
  }
}
