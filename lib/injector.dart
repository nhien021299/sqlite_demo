import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:logger/logger.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:sqflite_migration/sqflite_migration.dart';
import 'package:sqlite_demo/configs/app_config.dart';
import 'package:sqlite_demo/configs/backend_config.dart';
import 'package:sqlite_demo/configs/database_config.dart';
import 'package:sqlite_demo/migrations.dart';
import 'package:suga_core/suga_core.dart';
import 'package:dio/dio.dart';
import 'package:path/path.dart' as path;

import 'injector.config.dart';

final injector = GetIt.instance;

@injectableInit
Future setupInjector() => $initGetIt(injector, environment: Environment.dev);

@module
abstract class MainModule {
  @lazySingleton
  @preResolve
  Future<SharedPreferences> getSharePreferences() async => SharedPreferences.getInstance();

  @lazySingleton
  Logger getLogger() => Logger(
        level: AppConfig.LOG_LEVEL,
      );

  @lazySingleton
  HttpClientWrapper getHttpClientWrapper(Logger logger) {
    final HttpClientWrapper wrapper = HttpClientWrapper(
      options: BaseOptions(
        baseUrl: BackendConfig.BASE_URL,
        connectTimeout: BackendConfig.CONNECT_TIMEOUT,
        receiveTimeout: BackendConfig.RECEIVE_TIMEOUT,
      ),
      logger: logger,
      verbose: false,
    );
    return wrapper;
  }

  @lazySingleton
  @preResolve
  Future<Database> getDatabase() async {
    final databasesPath = await getDatabasesPath();
    final String databaseFile = path.join(databasesPath, DatabaseConfig.DB_NAME);
    final config = MigrationConfig(initializationScript: initialScript, migrationScripts: migrationScripts);
    return openDatabaseWithMigration(databaseFile, config);
  }
}
