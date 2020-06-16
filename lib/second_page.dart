import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tugas/bloc_color.dart';


class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ColorBloc bloc = BlocProvider.of<ColorBloc>(context);
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            heroTag: "1",
            onPressed: () {
              bloc.add(ColorEvent.to_amber);
            },
            backgroundColor: Colors.amber,
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            heroTag: "2",
            backgroundColor: Colors.lightBlue,
            onPressed: () {
              bloc.add(ColorEvent.to_light_blue);
            },
          ),
        ],
      ),
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text("Second Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            BlocBuilder<ColorBloc, Color>(
              builder: (context, currentColor) => AnimatedContainer(
                color: currentColor,
                width: 100,
                height: 100,
                duration: Duration(milliseconds: 500),
              ),
            ),
            RaisedButton(
              child: Text("Back"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
