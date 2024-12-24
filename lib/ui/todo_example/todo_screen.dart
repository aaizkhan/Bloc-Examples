import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/bloc/todo_bloc/todo_bloc.dart';

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({super.key});

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "TODO Example",
          style: TextStyle(
              fontWeight: FontWeight.w700, fontSize: 25, color: Colors.blue),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          for (int i = 0; i < 5; i++) {
            context
                .read<TodoBloc>()
                .add(AddTodoEvent(task: "Task - " + i.toString()));
          }
        },
        child: Icon(Icons.add),
      ),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state.todoList.isEmpty) {
            return Center(
              child: Text("No Items found"),
            );
          } else if (state.todoList.isNotEmpty) {
            return ListView.builder(
                itemCount: state.todoList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(state.todoList[index]),
                    trailing: IconButton(
                        onPressed: () {
                          context.read<TodoBloc>().add(
                              RemoveTodoEvent(task: state.todoList[index]));
                        },
                        icon: Icon(Icons.delete)),
                  );
                });
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }
}
