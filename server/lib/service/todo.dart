import 'package:protos/protos.dart';

class TodoService extends TodoServiceBase {
  @override
  Future<Todo> getTodo(ServiceCall call, GetTodoByIdRequest request) async {
    final int id = request.id;

    final todo = Todo(id: id, title: "Todo $id", isCompleted: false);
    return todo;
  }
  
  @override
  Stream<Todo> steamTodo(ServiceCall call, GetTodoByIdRequest request) {
    // TODO: implement steamTodo
    throw UnimplementedError();
  }
}
