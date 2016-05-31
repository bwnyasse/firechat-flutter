import 'dart:math' show Random;
import 'package:flutter/material.dart';

void main() {
  runApp(
    new MaterialApp(
        title: "Firechat",
        theme: new ThemeData(
            primarySwatch: Colors.purple,
            accentColor: Colors.orangeAccent[400]
        ),
        home: new ChatScreen()
    )
  );
}

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => new _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  InputValue _currentMessage = InputValue.empty;
  String _name = "Guest_${new Random().nextInt(1000)}";

  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
            title: new Text("Chatting as $_name")
        ),
        body: _buildTextComposer()
    );
  }

  Widget _buildTextComposer() {
    ThemeData themeData = Theme.of(context);
    return new Row(
        children: <Widget>[
          new Flexible(
              child: new Input(
                  value: _currentMessage,
                  hintText: 'Enter message',
                  onSubmitted: _handleMessageAdded,
                  onChanged: _handleMessageChanged
              )
          ),
          new Container(
              margin: new EdgeInsets.symmetric(horizontal: 4.0),
              child: new IconButton(
                  icon: Icons.send,
                  onPressed: _isComposing ? () =>
                      _handleMessageAdded(_currentMessage) : null,
                  color: themeData.accentColor
              )
          )
        ]
    );
  }

  bool get _isComposing => _currentMessage.text.length > 0;

  void _handleMessageChanged(InputValue value) {
    setState(() {
      _currentMessage = value;
    });
  }

  void _handleMessageAdded(InputValue value) {
    setState(() {
      _currentMessage = InputValue.empty;
    });
  }
}







class FlutterDemo extends StatefulWidget {
  FlutterDemo({ Key key }) : super(key: key);

  @override
  _FlutterDemoState createState() => new _FlutterDemoState();
}

class _FlutterDemoState extends State<FlutterDemo> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Flutter Demo')
      ),
      body: new Center(
        child: new Text('Button tapped $_counter time${ _counter == 1 ? '' : 's' }.')
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: new Icon(
          icon: Icons.add
        )
      )
    );
  }
}
