import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../Model/todo_model.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String dbPath = await getDatabasesPath();
    String path = join(dbPath, 'todo_database.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE todos (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        isDone INTEGER,
        time TEXT
      )
    ''');
  }

  // Insert a new todo into the database
  Future<int> insertTodo(Todo todo) async {
    final db = await database;
    return await db.insert('todos', {
      'title': todo.title,
      'isDone': todo.isDone ? 1 : 0,
      'time': todo.time,  // Save time
    });
  }

  // Get all todos from the database
  Future<List<Todo>> getTodos() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('todos');

    return List.generate(maps.length, (i) {
      return Todo(
        id: maps[i]['id'],
        title: maps[i]['title'],
        isDone: maps[i]['isDone'] == 1,
        time: maps[i]['time'],  // Load time
      );
    });
  }

  // Update a todo
  Future<int> updateTodo(Todo todo) async {
    final db = await database;
    return await db.update(
      'todos',
      {
        'title': todo.title,
        'isDone': todo.isDone ? 1 : 0,
        'time': todo.time,  // Update time
      },
      where: 'id = ?',
      whereArgs: [todo.id],
    );
  }

  // Delete a todo
  Future<int> deleteTodo(int id) async {
    final db = await database;
    return await db.delete(
      'todos',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
