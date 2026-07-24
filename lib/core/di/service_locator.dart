import 'package:get_it/get_it.dart';
import 'package:sqflite/sqflite.dart';
import '../../data/repositories/movement_repository.dart';
import '../../data/repositories/workout_repository.dart';
import '../../data/repositories/settings_repository.dart';
import '../../data/repositories/data_repository.dart';
import '../../data/sources/exercise_data_source.dart';
import '../database/database_helper.dart';
import '../../features/dashboard/viewmodels/dashboard_bloc.dart';
import '../../features/dashboard/viewmodels/data_management_bloc.dart';
import '../../features/exercise_logging/viewmodels/log_exercise_bloc.dart';
import '../../features/one_rep_max/viewmodels/one_rep_max_bloc.dart';
import '../../features/set_counter/viewmodels/set_counter_bloc.dart';

final getIt = GetIt.instance;

Future<void> setupLocator() async {
  // Database
  final db = await DatabaseHelper.initDb();
  getIt.registerSingleton<Database>(db);

  // Data Sources
  getIt.registerLazySingleton<ExerciseDataSource>(() => ExerciseDataSource());

  // Repositories
  getIt.registerLazySingleton<MovementRepository>(
    () => MovementRepository(getIt<Database>(), getIt<ExerciseDataSource>()),
  );
  getIt.registerLazySingleton<WorkoutRepository>(
    () => WorkoutRepository(getIt<Database>()),
  );
  getIt.registerLazySingleton<SettingsRepository>(
    () => SettingsRepository(getIt<Database>()),
  );
  getIt.registerLazySingleton<DataRepository>(
    () => DataRepository(getIt<Database>()),
  );

  // BLoCs
  getIt.registerFactory<DashboardBloc>(
    () => DashboardBloc(getIt<WorkoutRepository>(), getIt<SettingsRepository>(), getIt<MovementRepository>()),
  );
  getIt.registerFactory<DataManagementBloc>(
    () => DataManagementBloc(getIt<DataRepository>()),
  );
  getIt.registerFactory<LogExerciseBloc>(
    () => LogExerciseBloc(
      getIt<MovementRepository>(),
      getIt<WorkoutRepository>(),
    ),
  );
  getIt.registerFactory<OneRepMaxBloc>(
    () => OneRepMaxBloc(workoutRepository: getIt<WorkoutRepository>()),
  );
  getIt.registerFactory<SetCounterBloc>(
    () => SetCounterBloc(workoutRepository: getIt<WorkoutRepository>()),
  );
}
