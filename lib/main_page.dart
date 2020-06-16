import 'package:flutter/material.dart';
import 'package:tugas/color_bloc.dart';
import 'package:tugas/second_page.dart';


class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  ColorBloc bloc = ColorBloc();
  @override
  void dispose() {
    bloc.dispose;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            heroTag: "1",
            onPressed: () {
              bloc.eventSink.add(ColorEvent.to_amber);
            },
            backgroundColor: Colors.amber,
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            heroTag: "2",
            backgroundColor: Colors.lightBlue,
            onPressed: () {
              bloc.eventSink.add(ColorEvent.to_light_blue);
            },
          ),
        ],
      ),
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("Main Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            StreamBuilder(
              stream: bloc.stateStream,
              initialData: Colors.amber,
              builder: (context, snapshot) {
                return AnimatedContainer(
                  color: snapshot.data,
                  width: 100,
                  height: 100,
                  duration: Duration(milliseconds: 500),
                );
              },
            ),
            RaisedButton(
              child: Text("Go To Second Page"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SecondPage();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
