import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _isMinimal = true;

  void _toggleMinimal() {
    setState(() {
      _isMinimal = !_isMinimal;
    });
  }

  @override
  Widget build(BuildContext context) {
    var _hPadding = (MediaQuery.of(context).size.width - 200) / 2;

    return SafeArea(
      child: Container(
        // width: 200.0,
        // color: Colors.red,
        // padding: _isMinimal ? EdgeInsets.all((MediaQuery.of(context).size.width - 200) / 2) : null,

        padding: _isMinimal
            ? EdgeInsets.symmetric(
                horizontal: _hPadding,
                vertical: _hPadding / MediaQuery.of(context).size.aspectRatio,
              )
            : null,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Hello World'),
            actions: <Widget>[
              // IconButton(
              //   icon: _isMinimal
              //       ? const Icon(Icons.fullscreen)
              //       : const Icon(Icons.fullscreen_exit),
              //   onPressed: () => setState(() {
              //     _isMinimal = !_isMinimal;
              //   }),
              // ),
              PopupMenuButton(
                itemBuilder: (_) => [
                  PopupMenuItem(
                    child: Text('Rate app'),
                  ),
                  PopupMenuItem(
                    child: Text('Send feedback'),
                  ),
                  PopupMenuItem(
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
          ),
        ),
      ),
    );
  }
}
