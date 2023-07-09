import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:yuki_club_web/services/string_service.dart';
import '../class/MiyukiUser.dart';
import '../materials/InitData.dart';
import '../screens/yakai/yakai_songlist_page.dart';
import '../services/report_service.dart';
import 'package:provider/provider.dart';

import '../class/Concert.dart';
import '../services/custom_search_delegate.dart';
import './songlist_page.dart';
import '../class/Song.dart';
import '../widgets/NetworkVideoPlayer.dart';

import '../class/MyDecoder.dart';
import '../materials/colors.dart';

class SongPage extends StatefulWidget {
  Song? song;
  Concert? concert;
  int? song_index;

  SongPage({
    this.song,
    this.concert,
    this.song_index,
  });

  @override
  State<SongPage> createState() => _SongPageState(
        song: song,
        concert: concert,
        song_index: song_index,
      );
}

class _SongPageState extends State<SongPage> with TickerProviderStateMixin {
  Song? song;
  Concert? concert;
  int? song_index;
  List<String> lyricsList = [' '];
  List<Widget> lyricsTexts = [];

  _SongPageState({
    this.song,
    this.concert,
    this.song_index,
  });

  @override
  void initState() {
    super.initState();
    lyricsList = song!.lyrics_jp!.split('%');
    if (lyricsList.elementAt(0) == '') {
      lyricsTexts.add(Text(
        '歌詞無し No Lyrics',
        style: TextStyle(fontSize: 18),
      ));
    } else {
      for (int i = 0; i < lyricsList.length; i++) {
        lyricsTexts.add(Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: Container(
              child: Text(
                lyricsList.elementAt(i),
                style: TextStyle(fontSize: 15),
              ),
            ),
          ),
        ));
      }
    }
  }

  //bottom navigation
  int _curr_index = 1;

  void _onTap(int index) {
    setState(() {
      _curr_index = index;
    });
    //back to home
    if (_curr_index == 0) {
      Navigator.of(context).popUntil((route) => route.isFirst);
    }
  }

  //add comment
  Future _createComment() async {
    //user info
    MiyukiUser miyukiUser =
        await MiyukiUser.readUser(InitData.miyukiUser.email!);

    final commentController = TextEditingController();
    commentController.text = '';
    String snackBarString = 'Thanks for your comment~';
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(
                'Comment',
                style: TextStyle(color: theme_purple, fontSize: 20),
              ),
              content: TextField(
                controller: commentController,
                decoration: InputDecoration(hintText: 'Comment'),
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      setState(() {
                        if (commentController.text.length >= 15) {
                          if (true) {
                            final now = DateTime.now();
                            //newComment: uid + userName + sentTime + comment
                            String userName = (miyukiUser.vip == true)
                                ? ('❆' + miyukiUser.name!)
                                : miyukiUser.name!;
                            String newComment = InitData.miyukiUser.uid! +
                                '%%' +
                                userName +
                                '%%' +
                                '${now.timeZoneName}: ${now.year}/${now.month}/${now.day} ${now.hour}:${now.minute}' +
                                '%%' +
                                commentController.text;
                            Song.addComment(song!.name, newComment);

                            if (song!.comment!.elementAt(0) == '') {
                              //every song's comment was init as ''
                              song!.comment!.clear();
                            }
                            song!.comment!.add(newComment);

                            Navigator.of(context).pop();
                            snackBarString = 'Thanks for your comment~';
                          } else {
                            snackBarString = 'No Wifi Connection';
                            Navigator.of(context).pop();
                          }
                        } else {
                          snackBarString = 'Please Type More Than 15 letters';
                        }
                      });

                      var snackBar = SnackBar(content: Text(snackBarString));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                    child: Text(
                      'Add',
                      style: TextStyle(color: theme_purple, fontSize: 20),
                    )),
              ],
            ));
  }

  //delete comment
  Future _deleteComment(String deleteComment) async {
    final commentController = TextEditingController();
    commentController.text = '';
    String snackBarString = 'Deleted a comment';
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(
                'Delete Comment',
                style: TextStyle(color: theme_purple, fontSize: 20),
              ),
              content: Text('Sure to delete this comment?'),
              actions: [
                TextButton(
                    onPressed: () {
                      setState(() {
                        if (true) {
                          //delete from firebase
                          Song.deleteComment(song!.name, deleteComment);
                          //delete from current display
                          for (int i = 0; i < song!.comment!.length; i++) {
                            if (song!.comment!.elementAt(i) == deleteComment) {
                              song!.comment!.removeAt(i); //delete comment
                              break;
                            }
                          }
                          //avoid error: don't let the list be empty
                          if (song!.comment!.isEmpty) {
                            song!.comment!.add('');
                          }
                        } else {
                          snackBarString = 'No Wifi Connection';
                        }

                        //finish
                        Navigator.of(context).pop();
                        var snackBar = SnackBar(content: Text(snackBarString));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      });
                    },
                    child: Text(
                      'Delete',
                      style: TextStyle(color: Colors.red, fontSize: 20),
                    )),
              ],
            ));
  }

  //report comment
  Future _reportComment(String reportComment) async {
    final reportController = TextEditingController();
    reportController.text = '';
    String snackBarString = '';
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(
                'Report This Comment',
                style: TextStyle(color: theme_purple, fontSize: 20),
              ),
              content: TextField(
                controller: reportController,
                decoration:
                    InputDecoration(hintText: 'Describe this comment...'),
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      setState(() {
                        if (true) {
                          if (reportController.text.length >= 15) {
                            String reportString = 'Song Name: ' +
                                song!.name +
                                ';Comment context: ' +
                                reportComment +
                                ';Report Context: ' +
                                reportController.text;
                            ReportService.createReport(
                                sender: InitData.miyukiUser.uid!,
                                type: 'Comment',
                                text: reportString);
                            Navigator.of(context).pop();
                            snackBarString = 'We have Received your report!';
                          } else {
                            snackBarString = 'Please Type More Than 15 words';
                          }
                        } else {
                          snackBarString = 'No Wifi Connection';
                          Navigator.of(context).pop();
                        }

                        var snackBar = SnackBar(content: Text(snackBarString));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      });
                    },
                    child: Text(
                      'Report',
                      style: TextStyle(color: Colors.red, fontSize: 20),
                    )),
              ],
            ));
  }

  //switch the video
  Future _switchVideo(String concertYear) async {
    int newSongIndex = 0;
    Concert? newConcert;
    //get new concert and new song index
    //Concert
    if (concertYear[0] != 'y') {
      newConcert = await Concert.readConcert(concertYear);

      if (newConcert != null) {
        for (int i = 0; i < newConcert.songs!.length; i++) {
          if (newConcert.songs!.elementAt(i).contains(song!.name)) {
            newSongIndex = i + 1; //find song index in new concert
            break;
          }
        }
      }
    }
    //Yakai
    else {
      List<String> newYakaiSongList =
          MyDecoder.getYakaiSongList(yakai: concertYear);
      newConcert = Concert(
        name: MyDecoder.yearToConcertName(concertYear),
        year: concertYear,
        year_index: '0',
        songs: newYakaiSongList,
      );

      for (int i = 0; i < newYakaiSongList.length; i++) {
        if (MyDecoder.songNameToPure(newYakaiSongList.elementAt(i)) ==
            song!.name.trim()) {
          newSongIndex = i + 1;
          break;
        }
      }
    }

    print('Current Concert:' + newConcert.name);
    print('Current song index:' + newSongIndex.toString());

    //switch video
    Navigator.pop(context);
    //push without animation
    Navigator.push(
        context,
        PageRouteBuilder(
            transitionDuration: const Duration(seconds: 0),
            pageBuilder: (_, __, ___) => SongPage(
                concert: newConcert, song_index: newSongIndex, song: song)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(StringService.dashToSpace(song!.name)),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: CustomSearchDelegate());
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: Stack(
        children: [
          //Background
          AnimatedBackground(
            behaviour: BubblesBehaviour(
              options: BubbleOptions(
                bubbleCount: 10,
                maxTargetRadius: 100,
              ),
            ),
            vsync: this,
            child: Container(),
          ),
          Column(children: [
            (InitData.miyukiUser.vip == false)
                ? Container(height: 4) //No vip
                : (concert == null) //No video
                    ? Container(
                        height: 200,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : NetworkVideoPlayer(
                        //video
                        concert: concert,
                        index: song_index,
                      ),
            SizedBox(height: 20),
            (_curr_index == 1) //bottom bar
                ? //Live List
                (song!.live != null && song!.live![0] != '')
                    ? Expanded(
                        child: ListView.builder(
                            itemCount: song!.live!.length,
                            itemBuilder: ((context, index) {
                              //shorten concert name
                              String concertName = MyDecoder.yearToConcertName(
                                  song!.live!.elementAt(index));
                              if (concertName.length > 15) {
                                concertName =
                                    concertName.substring(0, 15) + '...';
                              }
                              return Container(
                                height: 60,
                                child: GestureDetector(
                                  onTap: () async {
                                    String concertYear =
                                        song!.live!.elementAt(index);
                                    //Yakai
                                    if (concertYear[0] == 'y') {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  YakaiSonglistPage(
                                                      yakai_year:
                                                          concertYear)));
                                    } else {
                                      //Concert
                                      //Read the concert tapped
                                      Concert tap_concert =
                                          await Concert.readConcert(
                                              song!.live!.elementAt(index));
                                      //Jump to the correspond concert songlist page
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SonglistPage(
                                                    concert: tap_concert,
                                                    concert_type: 'Concert',
                                                  )));
                                    }
                                  },
                                  child: Card(
                                    elevation: 10,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        //Year
                                        Card(
                                          color: theme_dark_grey,
                                          child: Text(
                                            MyDecoder.yearToConcertYear(
                                                song!.live!.elementAt(index)),
                                            style: TextStyle(fontSize: 18),
                                          ),
                                        ),
                                        //Concert Name
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            concertName,
                                            style: TextStyle(fontSize: 18),
                                          ),
                                        ),
                                        (InitData.miyukiUser.vip == false)
                                            ? Container() //not vip
                                            : IconButton(
                                                onPressed: () async {
                                                  _switchVideo(song!.live!
                                                      .elementAt(index));
                                                },
                                                icon: Icon(Icons.music_video))
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            })),
                      )
                    : Text(
                        '公演無し No Live',
                        style: TextStyle(fontSize: 18),
                      )
                : (_curr_index == 2)
                    ? //Lyrics
                    Expanded(
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              children: lyricsTexts,
                            ),
                          ),
                        ),
                      )
                    : // Comment
                    (song!.comment != null && song!.comment!.elementAt(0) != '')
                        ? Expanded(
                            child: ListView.builder(
                                itemCount: song!.comment!.length,
                                itemBuilder: ((context, index) {
                                  //0:uid,1:userName,2:date,3:comment
                                  List<String> commentSplit = song!.comment!
                                      .elementAt(index)
                                      .split('%%');
                                  return Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(1.0),
                                        child: ListTile(
                                          title: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              //User Name
                                              Flexible(
                                                child: Text(
                                                  commentSplit.elementAt(1),
                                                  style: (commentSplit
                                                              .elementAt(
                                                                  1)[0] ==
                                                          '❆')
                                                      ? TextStyle(
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          fontSize: 20,
                                                          color:
                                                              theme_light_blue)
                                                      : TextStyle(
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          fontSize: 20),
                                                ),
                                              ),
                                              SizedBox(width: 5),
                                              //Sent Time
                                              Container(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 5),
                                                  child: Text(
                                                      commentSplit.elementAt(2),
                                                      style: TextStyle(
                                                          fontSize: 10)),
                                                ),
                                              ),
                                            ],
                                          ),
                                          //Message Text
                                          subtitle: Text(
                                            commentSplit.elementAt(3),
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.white),
                                          ),
                                          trailing: (InitData.miyukiUser.uid ==
                                                  commentSplit[0])
                                              ? IconButton(
                                                  onPressed: () async =>
                                                      _deleteComment(song!
                                                          .comment!
                                                          .elementAt(index)),
                                                  icon: Icon(Icons.delete))
                                              : IconButton(
                                                  onPressed: () async =>
                                                      _reportComment(song!
                                                          .comment!
                                                          .elementAt(index)),
                                                  icon: Icon(Icons.report)),
                                        ),
                                      ),
                                      Divider(),
                                    ],
                                  );
                                })),
                          )
                        : Text(
                            'コメント無し No Comment',
                            style: TextStyle(fontSize: 18),
                          )
          ]),
        ],
      ),

      //Add Comment Button
      floatingActionButton: Visibility(
        visible: _curr_index == 3,
        child: FloatingActionButton(
          backgroundColor: theme_purple,
          onPressed: _createComment,
          child: Icon(Icons.add),
        ),
      ),
      //Bottom Bar
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        fixedColor: theme_purple,
        currentIndex: _curr_index,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month), label: 'Lives'),
          BottomNavigationBarItem(icon: Icon(Icons.lyrics), label: 'Lyrics'),
          BottomNavigationBarItem(icon: Icon(Icons.comment), label: 'Comment'),
        ],
        onTap: (idx) => _onTap(idx),
      ),
    );
  }
}
