import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

enum PopupItems { rate, feedback, help }

class _HomeState extends State<Home> {
  bool _isMinimal = true;

  void _toggleMinimal() {
    setState(() {
      _isMinimal = !_isMinimal;
    });
  }

  void _handlePopupItem(PopupItems value) {}

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
              PopupMenuButton<PopupItems>(
                onSelected: _handlePopupItem,
                itemBuilder: (BuildContext context) =>
                    <PopupMenuEntry<PopupItems>>[
                  const PopupMenuItem<PopupItems>(
                    value: PopupItems.rate,
                    child: Text('Rate app'),
                  ),
                  const PopupMenuItem<PopupItems>(
                    value: PopupItems.feedback,
                    child: Text('Feedback'),
                  ),
                  const PopupMenuItem<PopupItems>(
                    value: PopupItems.help,
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
