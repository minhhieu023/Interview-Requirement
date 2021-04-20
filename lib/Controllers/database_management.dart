import 'package:interview_requirement/Models/order.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseManagement {
  Database database;
  Future<void> initDB() async {
    var databasesPath = await getDatabasesPath();
    String path = databasesPath + 'order.db';
    database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute(
          'CREATE TABLE IF NOT EXISTS Orders (id INTEGER PRIMARY KEY AUTOINCREMENT, cusName TEXT, cusPhone TEXT, cusAddress TEXT, model Text,employeeId int, store Text)');
    });
  }

  Future<void> dropTableIfExists(String table) async {
    await database.rawQuery("DELETE FROM $table");
  }

  Future<void> deleteRecord(String table, String whereClause) async {
    await database.delete("delete from $table  where $whereClause ");
  }

  Future<void> insertDB(String table, String keys, List<String> values) async {
    String record = values.map((e) => "?").toString();
    if (database.isOpen) {
      await database.transaction((txn) async {
        var result = await txn.rawInsert(
            'INSERT INTO $table $keys VALUES $record', values);
        print(result);
      });
    }
  }

  Future<void> closeDB() async {
    await database.close();
  }

  Future<void> getTable(String table) async {
    if (database.isOpen) {
      var result = await database.rawQuery("select * from $table");
      print(result);
    }
  }

  Future<int> updateRecord(
      String table, String setClause, String whereClause) async {
    return await database
        .rawUpdate('update $table set $setClause Where $whereClause');
  }

  void saveOrderTables(Order order) async {
    if (database.isOpen) {
      await database.transaction((txn) async {
        await txn.rawQuery("DELETE FROM Orders");
        await txn.rawQuery("DELETE FROM OrderDetails");
        await txn.rawInsert(
            'Insert into Orders(id,employeeId,date,state,total,discount,voucherId,note) Values (?,?,?,?,?,?,?,?)',
            [
              order.id,
              order.employeeId ?? 'null',
            ]);
      });
    }
  }

  Future<List<Order>> getOrderList() async {
    var orderList;
    List<Order> list = [];
    await database.transaction((txn) async {
      orderList =
          await txn.rawQuery("select * from Orders where state !='closed'");
      print(orderList);
    });
  }
}
