import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class AddEditTaskPage extends StatelessWidget {
  const AddEditTaskPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('New task'),
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.check),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
