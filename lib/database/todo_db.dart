import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/model/todo_model.dart';

class TodoDatabase {
  //instance of this class without creating an object
  static final TodoDatabase instance = TodoDatabase._init();

//variable of the DB class
  static Database _database;

//creating a private constructor for this class
  TodoDatabase._init();

//creating the DB  and initiating it, for us to perform CRUD we need a dB opened first
  Future<Database> get database async {
    //check if an instance exist
    if (_database != null) return _database;

//initialize if not exist and do that by naming the DB file
    _database = await _initDB('simitodo.db');
    return _database;
  }

//initializing it and storing the db in the default path
  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

//opening the DB with the path for storage, version number...initializing from 1 and then creating the DB with a SCHEMA (since this is and Structured query lang)
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

//creating the Schema fir Db Table
  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT';
    final boolType = 'BOOLEAN NOT NULL';
    final integerType = 'INTEGER NOT NULL';

    await db.execute('''
CREATE TABLE $table ( 
  ${Todo.id} $idType, 
   ${Todo.title} $textType,
  ${Todo.doneState} $boolType,
  ${Todo.description} $textType,
   
  ${Todo.currentDateTime} $textType
  )
''');

    // firstTodo();
  }

//   ${Todo.selectedDate} $textType,
// ${Todo.selectedTime} $textType,
  Future<TodoModelClass> create(TodoModelClass todo) async {
    final db = await instance.database;

    // final json = todo.toJson();
    // final columns =
    //     '${Todo.title}, ${Todo.description},  ${Todo.currentDateTime}, ${Todo.doneState}';
    // final values =
    //     '${json[NoteFields.title]}, ${json[NoteFields.description]}, ${json[NoteFields.time]}';
    // final id = await db
    //     .rawInsert('INSERT INTO table_name ($columns) VALUES ($values)');

    final id = await db.insert(table, todo.toJson());
    return todo.copy(id: id);
  }

  Future<TodoModelClass> readNote(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      table,
      columns: Todo.values,
      where: '${Todo.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return TodoModelClass.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<TodoModelClass>> readAllNotes() async {
    final db = await instance.database;

    final orderBy = '${Todo.currentDateTime} ASC';
    // final result =
    //     await db.rawQuery('SELECT * FROM $tableNotes ORDER BY $orderBy');
    // , orderBy: orderBy
    final result = await db.query(table, orderBy: orderBy);

    return result.map((json) => TodoModelClass.fromJson(json)).toList();
  }

  Future<int> update(TodoModelClass todo) async {
    final db = await instance.database;

    return db.update(
      table,
      todo.toJson(),
      where: '${Todo.id} = ?',
      whereArgs: [todo.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;

    return await db.delete(
      table,
      where: '${Todo.id} = ?',
      whereArgs: [id],
    );
  }

//close the DB
  Future close() async {
    final db = await instance.database;

    db.close();
  }

  // Future firstTodo() async {
  //   final task = TodoModelClass(
  //     title: "Add A New Task",
  //     description: "none",
  //     currentDateTime: DateTime.now(),
  //     // selectedDate: DateTime.now(),
  //     // selectedTime: TimeOfDay.now(),
  //   );
  //   await TodoDatabase.instance.create(task);
  // }
}
