import 'package:flutter/material.dart';
import 'package:hello_world_minimal/utils/utils.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List _popupUrls = [
    'market://details?id=world.helloing.helloworldminimal',
    'https://helloing.world/helloworldminimal/feedback/',
    'https://helloing.world/helloworldminimal/'
  ];

  bool _isMinimal = true;

  void _toggleMinimal() {
    setState(() {
      _isMinimal = !_isMinimal;
    });
  }

  void _handlePopupItem(int value) {
    launchURL(_popupUrls[value]);
  }

  @override
  Widget build(BuildContext context) {
    final _hPadding = (MediaQuery.of(context).size.shortestSide - 200) / 2;
    final _vPadding = _hPadding / MediaQuery.of(context).size.aspectRatio;

    return SafeArea(
      child: Container(
        color: Colors.black,
        padding: _isMinimal
            ? EdgeInsets.symmetric(
                horizontal: _hPadding,
                vertical: _vPadding,
              )
            : EdgeInsets.zero,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Hello World'),
            actions: <Widget>[
              PopupMenuButton<int>(
                onSelected: _handlePopupItem,
                itemBuilder: (BuildContext context) => <PopupMenuEntry<int>>[
                  const PopupMenuItem<int>(
                    value: 0,
                    child: Text('Rate app'),
                  ),
                  const PopupMenuItem<int>(
                    value: 1,
                    child: Text('Feedback'),
                  ),
                  const PopupMenuItem<int>(
                    value: 2,
                    child: Text('Help'),
                  ),
                ],
              ),
            ],
          ),
          body: Center(
            child: Text('A Minimal Hello World'),
          ),
          floatingActionButton: FloatingActionButton(
            child: _isMinimal
                ? const Icon(Icons.fullscreen)
                : const Icon(Icons.fullscreen_exit),
            onPressed: _toggleMinimal,
            tooltip: 'Toggle minimal',
          ),
        ),
      ),
    );
  }
}
