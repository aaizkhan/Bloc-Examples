import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final List<String> toDoList = [];
  TodoBloc() : super(TodoState()) {
    on<AddTodoEvent>(_addToDoEvent);
    on<RemoveTodoEvent>(_removeToDoEvent);
  }
  void _addToDoEvent(AddTodoEvent event, Emitter<TodoState> emit) {
    toDoList.add(event.task);
    emit(state.copyWith(todosList: List.from(toDoList)));
  }

  void _removeToDoEvent(RemoveTodoEvent event, Emitter<TodoState> emit) {
    toDoList.remove(event.task);
    emit(state.copyWith(todosList: List.from(toDoList)));
  }
}
