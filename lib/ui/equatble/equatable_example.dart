import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class EquatableExample extends StatefulWidget {
  const EquatableExample({super.key});

  @override
  State<EquatableExample> createState() => _EquatableExampleState();
}

class _EquatableExampleState extends State<EquatableExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        Person person = Person(name: "Aizaz", age: 27);
        Person person1 = Person(name: "Aizaz", age: 27);
        print(person.hashCode.toString());
        print(person1.hashCode.toString());
        print(person == person1);
      }),
    );
  }
}

class Person extends Equatable {
  final String name;
  final int age;
  const Person({required this.name, required this.age});

  @override
  List<Object?> get props => [name, age];
}
