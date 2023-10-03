import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather_bg_null_safety/flutter_weather_bg.dart';
import '../class/MiyukiUser.dart';
import '../class/Song.dart';
import '../materials/InitData.dart';
import '../screens/song_page.dart';
import '../services/custom_search_delegate.dart';
import '../services/random_song_service.dart';
import '../services/yukicoin_service.dart';

import './home_drawer_page.dart';

import '../class/Message.dart';
import '../materials/MyText.dart';
import '../materials/colors.dart';

import '../services/message_service.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  String currentMessage = '1';
  final controller1 = TextEditingController();

  User? user;
  String? userEmail;

  //init all data needed
  @override
  void initState() {
    super.initState();
    _readMiyukiUser();
  }

  Future<MiyukiUser> _readMiyukiUser() async {
    setState(() async {
      user = await FirebaseAuth.instance.currentUser;
      userEmail = user!.email;
      InitData.miyukiUser = await MiyukiUser.readUser(userEmail!);
      InitData.miyukiUser.uid = user!.uid;
      InitData.miyukiUser.imgUrl = user!.photoURL;
      print('welcome ${InitData.miyukiUser.name} ${user!.uid}');
    });

    return InitData.miyukiUser;
  }

  //sent message by add button
  void _sentMessage() {
    String snackBarString = '';
    //dialog
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(
                'Sure To Send Message\non channel "$currentMessage"?',
                style: TextStyle(color: theme_purple, fontSize: 20),
              ),
              content: Text('It will cost you \$1 Yuki Coin.\nYou have \$' +
                  InitData.miyukiUser.coin.toString()),
              actions: [
                TextButton(
                    onPressed: () async {
                      if (true) {
                        try {
                          if (InitData.miyukiUser.coin! > 0) {
                            //cost 1 yuki coin
                            YukicoinService.addCoins(-1);
                            //send message
                            final text = controller1.text;
                            MessageService().createMessage(
                              text: text,
                              currMessage: currentMessage,
                              senderImgUrl: (InitData.miyukiUser.imgUrl != null)
                                  ? InitData.miyukiUser.imgUrl!
                                  : '',
                              userName: (InitData.miyukiUser.vip == false)
                                  ? InitData.miyukiUser.name!
                                  : '❆ ${InitData.miyukiUser.name}',
                            );
                            controller1.text = '';
                            snackBarString =
                                'Successfully sent! You still have Yuki Coin \$${InitData.miyukiUser.coin}';
                          } else {
                            snackBarString = 'Your money is not enough';
                          }
                        } catch (e) {
                          print(e.toString());
                          snackBarString =
                              'Failed to send message due to some errors';
                        }
                      } else {
                        snackBarString = 'No Wifi Connection';
                      }
                      setState(() {});

                      //finish
                      var snackBar = SnackBar(content: Text(snackBarString));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Send',
                      style: TextStyle(color: Colors.red, fontSize: 20),
                    )),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        //App Bar
        appBar: AppBar(
          centerTitle: true,
          title: Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Image.asset(
              'assets/images/yuki_club.png',
              width: 170,
            ),
          ),

          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              setState(() {});
              if (_scaffoldKey.currentState!.isDrawerOpen) {
                _scaffoldKey.currentState!.closeDrawer();
                //close drawer, if drawer is open
              } else {
                _scaffoldKey.currentState!.openDrawer();
                //open drawer, if drawer is closed
              }
            },
          ),
          //Search Button
          actions: [
            IconButton(
                onPressed: () {
                  showSearch(
                      context: context, delegate: CustomSearchDelegate());
                },
                icon: const Icon(Icons.search))
          ],
        ),
        body: Stack(
          children: [
            //background
            StreamBuilder(
              stream: Stream.periodic(Duration(seconds: 1)),
              builder: (context, snapshot) {
                final curr_time = DateTime.now();
                //decide background effect
                return (curr_time.minute % 30 == 0)
                    ? WeatherBg(
                        weatherType: WeatherType.heavySnow,
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.height,
                      )
                    : WeatherBg(
                        weatherType: WeatherType.sunnyNight,
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.height,
                      );
              },
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  //Today's song
                  StreamBuilder(
                    stream: Stream.periodic(Duration(seconds: 1)),
                    builder: (context, snapshot) {
                      RandomSongService.selectSong();
                      return Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: GestureDetector(
                            onTap: () async {
                              if (InitData.todaySong != 'No Song') {
                                Song currSong =
                                    await Song.readSong(InitData.todaySong);
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => SongPage(
                                          song: currSong,
                                        )));
                              }
                            },
                            child: Text(
                              '今日の曲：${InitData.todaySong}',
                              style: TextStyle(
                                  fontSize: 20,
                                  decoration: TextDecoration.underline),
                            ),
                          ),
                        ),
                      );
                    },
                  ),

                  SizedBox(height: 10),
                  //Message Board
                  Container(
                    color: theme_dark_grey,
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            int tempInt = int.parse(currentMessage) + 1;
                            if (tempInt >= 7) tempInt = 1;
                            currentMessage = tempInt.toString();
                            setState(() {});
                          },
                          icon: (currentMessage == '1')
                              ? Icon(Icons.looks_one, color: Colors.orange)
                              : (currentMessage == '2')
                                  ? Icon(Icons.looks_two, color: Colors.orange)
                                  : (currentMessage == '3')
                                      ? Icon(Icons.looks_3,
                                          color: Colors.orange)
                                      : (currentMessage == '4')
                                          ? Icon(Icons.looks_4,
                                              color: Colors.orange)
                                          : (currentMessage == '5')
                                              ? Icon(Icons.looks_5,
                                                  color: Colors.orange)
                                              : Icon(Icons.looks_6,
                                                  color: Colors.orange),
                        ),
                        Expanded(
                          child: TextField(
                            controller: controller1,
                            decoration: InputDecoration.collapsed(
                                hintText: '伝言板 Message Board'),
                          ),
                        ),
                        //sent message
                        IconButton(
                          onPressed: () => _sentMessage(),
                          icon: Icon(Icons.send),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: StreamBuilder<List<Message>>(
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Text('Something went wrong!');
                        } else if (snapshot.hasData) {
                          final messages = snapshot.data!;

                          return Column(
                            children: [
                              Expanded(
                                  child: ListView(
                                children: messages.map(buildMessage).toList(),
                              )),
                            ],
                          );
                        } else {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                      stream: MessageService().readMessages(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        //Drawer
        drawer: HomeDrawerPage(
          user: user,
          scaffoldKey: _scaffoldKey,
        ));
  }
}

//build messages
Widget buildMessage(Message message) {
  String messageName;
  if (message.userName!.length > 13) {
    messageName = message.userName!.substring(0, 13) + '...';
  } else {
    messageName = message.userName!;
  }

  return ListTile(
    shape: RoundedRectangleBorder(
      side: BorderSide(color: Colors.black, width: 1),
      borderRadius: BorderRadius.circular(5),
    ),
    tileColor: theme_dark_grey,
    leading: Stack(
      children: [
        Padding(
          padding: EdgeInsets.all(5),
          child: (message.senderImgUrl != '')
              ? CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(message.senderImgUrl!))
              : CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('assets/images/logo.png')),
        ),
        Positioned(
          child: Text(
            message.id.toString(),
            style: TextStyle(
                fontSize: 25,
                color: Colors.orange,
                fontWeight: FontWeight.bold),
          ),
          bottom: -5,
          left: -1,
        )
      ],
    ),
    title: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        //User Name
        Container(
          child: Text(
            messageName,
            style: (message.userName![0] == '❆')
                ? TextStyle(
                    fontSize: 20,
                    color: theme_light_blue,
                    overflow: TextOverflow.ellipsis)
                : TextStyle(
                    fontSize: 20,
                    overflow: TextOverflow.ellipsis,
                  ),
          ),
        ),
        SizedBox(width: 5),
        //Sent Time
        Container(
          child: Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(
                '${message.sentTime.timeZoneName}: ${message.sentTime.year}/${message.sentTime.month}/${message.sentTime.day} ${message.sentTime.hour}:${message.sentTime.minute}',
                style: TextStyle(fontSize: 10)),
          ),
        ),
      ],
    ),
    //Message Text
    subtitle: Text(
      message.text,
      style: TextStyle(fontSize: 18, color: Colors.white),
    ),
  );
}
