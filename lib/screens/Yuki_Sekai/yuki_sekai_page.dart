import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:yuki_club_web/class/Yuki_Sekai/PlayerInfo.dart';
import 'package:yuki_club_web/materials/InitData.dart';
import 'package:yuki_club_web/services/Yuki_Sekai/YukiSekai.dart';

class YukiSekaiPage extends StatefulWidget {
  const YukiSekaiPage({super.key});

  @override
  State<YukiSekaiPage> createState() => _YukiSekaiPageState();
}

class _YukiSekaiPageState extends State<YukiSekaiPage> {
  @override
  void initState() {
    Flame.device.fullScreen();
    Flame.device.setLandscape();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
        icon: Icon(Icons.exit_to_app),
        onPressed: () {
          //Quit Yuki Sekai
          InitData.isInSekai = false;
          Navigator.of(context).popUntil((route) => route.isFirst);
          Flame.device.setPortrait();

          InitData.yukiSekai = YukiSekai();
          InitData.playersInfo.clear();
          PlayerInfo.deletePlayer(InitData.miyukiUser.uid!);
        },
      )),
      body: GameWidget(game: InitData.yukiSekai),
    );
  }
}
