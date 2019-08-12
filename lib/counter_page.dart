import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_counter_bloc/counter_bloc.dart';
import 'package:flutter_counter_bloc/counter_event.dart';
import 'package:flutter_counter_bloc/theme_bloc.dart';
import 'package:flutter_counter_bloc/theme_event.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CounterBloc counterBloc = BlocProvider.of<CounterBloc>(context);
    final ThemeBloc themeBloc = BlocProvider.of<ThemeBloc>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Counter Dzikir BLoC')),
      body: BlocBuilder<CounterBloc, int>(
        builder: (BuildContext context, int state) {
          return Center(
            child: Text('$state', style: TextStyle(fontSize: 24)),
          );
        },
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingButton(
            icon: Icon(Icons.add),
            onPress: () {
              counterBloc.dispatch(CounterEvent.increment);
            },
          ),
          FloatingButton(
            icon: Icon(Icons.remove),
            onPress: () {
              counterBloc.dispatch(CounterEvent.decrement);
            },
          ),
          FloatingButton(
            icon: Icon(Icons.refresh),
            onPress: () {
              counterBloc.dispatch(CounterEvent.reset);
            },
          ),
          FloatingButton(
            icon: Icon(Icons.brightness_medium),
            onPress: () {
              themeBloc.dispatch(ThemeEvent.toggle);
            },
          )
        ],
      ),
    );
  }
}

class FloatingButton extends StatelessWidget {
  const FloatingButton({
    Key key,
    @required this.icon,
    @required this.onPress
  }) : super(key: key);

  final Icon icon;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      child: FloatingActionButton(
        child: icon,
        onPressed: onPress
      ),
    );
  }
}