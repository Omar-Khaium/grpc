import 'dart:math';

import 'package:flutter/material.dart';
import 'package:protos/protos.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  late ClientChannel _channel;
  late TodoServiceClient _stub;

  Todo? todo;

  @override
  void initState() {
    super.initState();

    _channel = ClientChannel(
      'localhost',
      port: 8080,
      options: const ChannelOptions(
        credentials: ChannelCredentials.insecure(),
      ),
    );

    _stub = TodoServiceClient(_channel);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (todo != null) ...[
                Text("ID: ${todo!.id}"),
                Text("TITLE: ${todo!.title}"),
                Text("COMPLETED: ${todo!.isCompleted}"),
              ] else
                const Text("Empty"),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _getTodo,
          child: const Icon(Icons.start_rounded),
        ),
      ),
    );
  }

  void _getTodo() async {
    final int id = Random().nextInt(100);
    final newTodo = await _stub.getTodo(GetTodoByIdRequest(id: id));
    setState(() {
      todo = newTodo;
    });
  }
}
