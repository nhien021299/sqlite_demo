final initialScript = [
  '''
          CREATE TABLE Drinks (
            id INTEGER PRIMARY KEY AUTOINCREMENT, 
            name TEXT, price INTEGER, 
            quantity INTEGER
          );
      ''',
];

final migrationScripts = <String>[];
