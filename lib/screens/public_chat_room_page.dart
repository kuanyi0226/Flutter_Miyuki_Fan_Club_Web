import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
//import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../class/ChatMessage.dart';
import '../class/Song.dart';
import '../materials/InitData.dart';
import '../screens/song_page.dart';
import '../services/chatroom_service.dart';
import '../materials/colors.dart';

class PublicChatRoomPage extends StatefulWidget {
  const PublicChatRoomPage({Key? key}) : super(key: key);

  @override
  State<PublicChatRoomPage> createState() => _PublicChatRoomPage();
}

class _PublicChatRoomPage extends State<PublicChatRoomPage>
    with WidgetsBindingObserver {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final _text_controller1 = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  bool _firstTimeLoad = true;
  String _chosenSong = '';
  //sent message by add button
  void _sentMessage() {
    String snackBarString = '';
    setState(() {
      if (true) {
        try {
          //send message
          final text = _text_controller1.text;
          ChatroomService().createMessage(
            sender_email: InitData.miyukiUser.email!,
            text: text,
            senderImgUrl: (InitData.miyukiUser.imgUrl != null)
                ? InitData.miyukiUser.imgUrl!
                : '',
            senderName: (InitData.miyukiUser.vip == false)
                ? InitData.miyukiUser.name!
                : '❆ ${InitData.miyukiUser.name}',
          );
          _text_controller1.text = '';
          //FocusScope.of(context).unfocus();
          SchedulerBinding.instance.addPostFrameCallback((_) {
            _scrollController.jumpTo(100000000);
          });
        } catch (e) {
          print(e.toString());
        }
      } else {
        snackBarString = 'No Wifi Connection';
        var snackBar = SnackBar(content: Text(snackBarString));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    });
  }

  void _shareSong() {
    _chosenSong = '100人目の恋人';
    String snackBarString = '';
    //dialog
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(
                '曲をシェアする\nShare a song',
                style: TextStyle(color: theme_purple, fontSize: 20),
              ),
              content: Text('曲を選択してください\nChoose a song from the list'),
              actions: [
                Container(
                  padding: EdgeInsets.only(left: 17),
                  child: DropdownSearch<String>(
                    popupProps: PopupProps.dialog(
                      showSearchBox: true,
                    ),
                    items: InitData.allSongs,
                    dropdownDecoratorProps: DropDownDecoratorProps(
                      dropdownSearchDecoration:
                          InputDecoration(labelText: "Song Name"),
                    ),
                    selectedItem: _chosenSong,
                    onChanged: (songName) => setState(() {
                      _chosenSong = songName!;
                      //print('choose a song: ' + _chosenSong);
                    }),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    //Share Button
                    TextButton(
                        onPressed: () {
                          setState(() {
                            if (_chosenSong.isNotEmpty && _chosenSong != '') {
                              if (true) {
                                ChatroomService().createMessage(
                                  sender_email: InitData.miyukiUser.email!,
                                  text: '###song_name###' + _chosenSong,
                                  senderImgUrl:
                                      (InitData.miyukiUser.imgUrl != null)
                                          ? InitData.miyukiUser.imgUrl!
                                          : '',
                                  senderName: (InitData.miyukiUser.vip == false)
                                      ? InitData.miyukiUser.name!
                                      : '❆ ${InitData.miyukiUser.name}',
                                );
                                SchedulerBinding.instance
                                    .addPostFrameCallback((_) {
                                  _scrollController.jumpTo(100000000);
                                });
                              } else {
                                snackBarString = 'No Wifi Connection';
                                var snackBar =
                                    SnackBar(content: Text(snackBarString));
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              }
                            }
                            Navigator.of(context).pop();
                          });
                        },
                        child: Text(
                          'Share',
                          style: TextStyle(color: theme_purple, fontSize: 20),
                        )),
                    //Cancel Button
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'Cancel',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        )),
                  ],
                ),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      //App Bar
      appBar: AppBar(
        title: Text('パブリックチャット\nPublic Chat Room'),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(height: 10),
              Expanded(
                child: StreamBuilder<List<ChatMessage>>(
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text('Something went wrong!');
                    } else if (snapshot.hasData) {
                      final messages = snapshot.data!;

                      if (_firstTimeLoad == true) {
                        _firstTimeLoad = false;
                        SchedulerBinding.instance.addPostFrameCallback((_) {
                          _scrollController.jumpTo(100000000);
                        });
                      }

                      return Column(
                        children: [
                          Expanded(
                            child: ListView(
                              controller: _scrollController,
                              children: messages
                                  .map((message) =>
                                      buildMessage(message, context))
                                  .toList(),
                            ),
                          ),
                        ],
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                  stream: ChatroomService().readMessages(),
                ),
              ),
              //textfield
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                color: theme_dark,
                height: 100,
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.library_music, color: theme_purple),
                      onPressed: _shareSong,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 14),
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: TextField(
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(100)
                                ],
                                controller: _text_controller1,
                                style: TextStyle(color: theme_dark),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Type message ...',
                                  hintStyle: TextStyle(color: Colors.grey[500]),
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                if (_text_controller1.text.isNotEmpty) {
                                  _sentMessage();
                                }
                              },
                              icon: Icon(Icons.send),
                              color: theme_purple,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

//build messages
Widget buildMessage(ChatMessage message, BuildContext context) {
  bool isShareSongMessage = false;
  //judge whether is a sharing song message
  if (message.text.startsWith('###song_name###')) isShareSongMessage = true;

  String messageName;
  if (message.senderName!.length > 20) {
    messageName = message.senderName!.substring(0, 20) + '...';
  } else {
    messageName = message.senderName!;
  }
  bool isMe = message.sender_email == InitData.miyukiUser.email;

  return Container(
    margin: EdgeInsets.only(top: 10),
    child: Column(
      children: [
        //Sender name
        if (!isMe)
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                if (!isMe) SizedBox(width: 53),
                Text(
                  messageName,
                  style: (message.senderName![0] == '❆')
                      ? TextStyle(
                          fontSize: 22,
                          color: theme_light_blue,
                          overflow: TextOverflow.ellipsis)
                      : TextStyle(
                          fontSize: 22,
                          overflow: TextOverflow.ellipsis,
                        ),
                ),
              ],
            ),
          ),
        //CircleAvatar
        Row(
          mainAxisAlignment:
              isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!isMe)
              (message.senderImgUrl != '')
                  ? CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(message.senderImgUrl!))
                  : CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage('assets/images/logo.png')),
            SizedBox(
              width: 10,
            ),
            //text bubble
            Container(
              padding: EdgeInsets.all(10),
              constraints: BoxConstraints(maxWidth: 275),
              decoration: BoxDecoration(
                  color: isMe ? theme_purple : theme_dark_grey,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(isMe ? 12 : 0),
                    topRight: Radius.circular(isMe ? 0 : 12),
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  )),
              child: (isShareSongMessage)
                  //Share Song Message
                  ? GestureDetector(
                      onTap: () async {
                        //remove label: ###song_name###
                        String final_name = message.text.substring(15);
                        //create song object
                        Song shareSong = await Song.readSong(final_name);
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SongPage(
                                  song: shareSong,
                                )));
                      },
                      child: Text(
                        message.text.substring(15).replaceAll('_', ' '),
                        style: TextStyle(
                            fontSize: 20, decoration: TextDecoration.underline),
                      ))
                  //Normal Text Message
                  : Text(
                      message.text,
                    ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Row(
            mainAxisAlignment:
                isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              if (!isMe)
                SizedBox(
                  width: 45,
                ),
              SizedBox(
                width: 8,
              ),
              Text(
                '${message.sentTime.month}/${message.sentTime.day} ${(message.sentTime.hour < 10 ? '0' + message.sentTime.hour.toString() : message.sentTime.hour)}:${(message.sentTime.minute < 10 ? '0' + message.sentTime.minute.toString() : message.sentTime.minute)}',
              )
            ],
          ),
        )
      ],
    ),
  );
}
