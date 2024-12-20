import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/switch_example/bloc/switch_bloc.dart';
import 'package:flutter_bloc_example/switch_example/bloc/switch_event.dart';
import 'package:flutter_bloc_example/switch_example/bloc/switch_state.dart';

class SwitchButtonExample extends StatefulWidget {
  const SwitchButtonExample({super.key});

  @override
  State<SwitchButtonExample> createState() => _SwitchButtonExampleState();
}

class _SwitchButtonExampleState extends State<SwitchButtonExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Switch Example",
          style: TextStyle(
              fontWeight: FontWeight.w700, fontSize: 25, color: Colors.blue),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Notifications"),
                SizedBox(
                  child: BlocBuilder<SwitchBloc, SwitchState>(
                      buildWhen: (previous, current) =>
                          previous.isSwitch != current.isSwitch,
                      builder: (context, state) {
                        print("Notification");
                        return Switch(
                            value: state.isSwitch,
                            onChanged: (value) {
                              context.read<SwitchBloc>().add(SwitchedClass());
                            });
                      }),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            BlocBuilder<SwitchBloc, SwitchState>(
                buildWhen: (previous, current) =>
                    previous.slider != current.slider,
                builder: (context, state) {
                  return Container(
                    height: 250,
                    color: Colors.red.withValues(alpha: state.slider),
                  );
                }),
            const SizedBox(
              height: 40,
            ),
            BlocBuilder<SwitchBloc, SwitchState>(
                buildWhen: (previous, current) =>
                    previous.slider != current.slider,
                builder: (context, state) {
                  print("Slider");
                  return Slider(
                      value: state.slider,
                      onChanged: (value) {
                        context
                            .read<SwitchBloc>()
                            .add(SliderClass(slider: value));
                      });
                })
          ],
        ),
      ),
    );
  }
}
