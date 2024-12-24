import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/bloc/counter_bloc/counter_bloc.dart';
import 'package:flutter_bloc_example/bloc/counter_bloc/counter_event.dart';
import 'package:flutter_bloc_example/bloc/counter_bloc/counter_state.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Counter",
          style: TextStyle(
              fontWeight: FontWeight.w700, fontSize: 25, color: Colors.blue),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BlocBuilder<CounterBloc, CounterState>(builder: (context, state) {
              return Text(
                state.counter.toString(),
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 40),
              );
            }),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      context.read<CounterBloc>().add(IncrementCounter());
                    },
                    child: Text(
                      "+",
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 30),
                    )),
                SizedBox(
                  width: 30,
                ),
                ElevatedButton(
                    onPressed: () {
                      context.read<CounterBloc>().add(DecrementCounter());
                    },
                    child: Text(
                      "-",
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 30),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
