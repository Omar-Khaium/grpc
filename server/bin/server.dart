import 'dart:io';

import 'package:protos/protos.dart';
import 'package:server/server.dart';

void main(List<String> arguments) async {
  final server = Server(
    [
      TodoService(),
    ],
  );

  final port = int.parse(Platform.environment["PORT"] ?? '8080');

  await server.serve(port: port);

  print("Server listening on port ${server.port}...");
}
