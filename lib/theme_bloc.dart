import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_counter_bloc/theme_event.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeData> {
  @override
  ThemeData get initialState => ThemeData.light();

  @override
  Stream<ThemeData> mapEventToState(ThemeEvent event) async* {
    switch(event) {
      case ThemeEvent.toggle:
        yield currentState == ThemeData.dark()
          ? ThemeData.light()
          : ThemeData.dark();
        break;
    }
  }

}