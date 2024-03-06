import 'package:flutter/material.dart';
import '../materials/colors.dart';

class AdPage extends StatefulWidget {
  const AdPage({super.key});

  @override
  State<AdPage> createState() => _AdPageState();
}

class _AdPageState extends State<AdPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Thanks for watching Ads')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/cover1.jpg'),
            SizedBox(height: 5),
            ElevatedButton(
              style: ElevatedButton.styleFrom(foregroundColor: theme_purple),
              child: Text(
                'Watch Ad!',
                style: TextStyle(fontSize: 50),
              ),
              onPressed: () {},
            ),
            SizedBox(height: 5),
            Text('広告を見る、Yuki Coinを稼ぐ'),
            Text('ありがとうございます！'),
          ],
        ),
      ),
    );
  }
}
