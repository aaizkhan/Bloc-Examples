import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/bloc/counter_bloc/counter_bloc.dart';
import 'package:flutter_bloc_example/bloc/image_picker_bloc/bloc/image_picker_bloc.dart';
import 'package:flutter_bloc_example/bloc/todo_bloc/todo_bloc.dart';
import 'package:flutter_bloc_example/ui/counter_example/counter_screen.dart';
import 'package:flutter_bloc_example/ui/equatble/equatable_example.dart';
import 'package:flutter_bloc_example/bloc/switch_slider_bloc/switch_bloc.dart';
import 'package:flutter_bloc_example/ui/image_pick_example/image_picker_screen.dart';
import 'package:flutter_bloc_example/ui/switch_example/switch_example_screen.dart';
import 'package:flutter_bloc_example/ui/todo_example/todo_screen.dart';
import 'package:flutter_bloc_example/utils/image_picker_utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CounterBloc()),
        BlocProvider(create: (context) => SwitchBloc()),
        BlocProvider(create: (context) => ImagePickerBloc(ImagePickerUtils())),
        BlocProvider(create: (context) => TodoBloc())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const ToDoScreen(),
      ),
    );
    // return MaterialApp(
    //   title: 'Flutter Demo',
    //   theme: ThemeData(
    //     colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    //     useMaterial3: true,
    //   ),
    //   home: const CounterScreen(),
    // );
  }
}
