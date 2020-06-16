import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tugas/bloc_color.dart';
import 'package:tugas/main_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ColorBloc>(
      create: (context) => ColorBloc(),
      child: MaterialApp(
        home: BlocProvider<ColorBloc>(
            create: (context) => ColorBloc(), child: MainPage()),
      ),
    );
  }
}
