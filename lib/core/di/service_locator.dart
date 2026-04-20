import 'package:get_it/get_it.dart';
import 'package:sqflite/sqflite.dart';
import '../../data/repositories/movement_repository.dart';
import '../../data/repositories/workout_repository.dart';
import '../../data/sources/remote_source.dart';
import '../database/database_helper.dart';
import '../../features/dashboard/viewmodels/dashboard_bloc.dart';
import '../../features/exercise_logging/viewmodels/log_exercise_bloc.dart';

final getIt = GetIt.instance;

Future<void> setupLocator() async {
  // Database
  final db = await DatabaseHelper.initDb();
  getIt.registerSingleton<Database>(db);

  // Data Sources
  getIt.registerLazySingleton<RemoteSource>(() => RemoteSource());

  // Repositories
  getIt.registerLazySingleton<MovementRepository>(
    () => MovementRepository(getIt<Database>(), getIt<RemoteSource>()),
  );
  getIt.registerLazySingleton<WorkoutRepository>(
    () => WorkoutRepository(getIt<Database>()),
  );

  // BLoCs
  getIt.registerFactory<DashboardBloc>(
    () => DashboardBloc(getIt<WorkoutRepository>()),
  );
  getIt.registerFactory<LogExerciseBloc>(
    () => LogExerciseBloc(getIt<MovementRepository>(), getIt<WorkoutRepository>()),
  );
}
