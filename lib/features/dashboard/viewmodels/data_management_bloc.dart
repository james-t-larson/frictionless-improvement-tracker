import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import '../../../data/repositories/data_repository.dart';

// --- EVENTS ---

abstract class DataManagementEvent extends Equatable {
  const DataManagementEvent();

  @override
  List<Object?> get props => [];
}

class ExportCsvRequested extends DataManagementEvent {}

class ExportSqlRequested extends DataManagementEvent {}

class ImportRequested extends DataManagementEvent {}

// --- STATES ---

abstract class DataManagementState extends Equatable {
  const DataManagementState();

  @override
  List<Object?> get props => [];
}

class DataOperationInitial extends DataManagementState {}

class DataOperationInProgress extends DataManagementState {}

class DataOperationSuccess extends DataManagementState {
  final String message;
  const DataOperationSuccess(this.message);

  @override
  List<Object?> get props => [message];
}

class DataOperationFailure extends DataManagementState {
  final String error;
  const DataOperationFailure(this.error);

  @override
  List<Object?> get props => [error];
}

// --- BLOC ---

class DataManagementBloc extends Bloc<DataManagementEvent, DataManagementState> {
  final DataRepository _repository;

  DataManagementBloc(this._repository) : super(DataOperationInitial()) {
    on<ExportCsvRequested>(_onExportCsvRequested);
    on<ExportSqlRequested>(_onExportSqlRequested);
    on<ImportRequested>(_onImportRequested);
  }

  Future<void> _onExportCsvRequested(ExportCsvRequested event, Emitter<DataManagementState> emit) async {
    emit(DataOperationInProgress());
    try {
      await _repository.exportToCsv();
      emit(const DataOperationSuccess('CSV exported successfully'));
    } catch (e) {
      emit(DataOperationFailure('Failed to export CSV: $e'));
    }
  }

  Future<void> _onExportSqlRequested(ExportSqlRequested event, Emitter<DataManagementState> emit) async {
    emit(DataOperationInProgress());
    try {
      await _repository.exportToSql();
      emit(const DataOperationSuccess('SQL backup exported successfully'));
    } catch (e) {
      emit(DataOperationFailure('Failed to export SQL: $e'));
    }
  }

  Future<void> _onImportRequested(ImportRequested event, Emitter<DataManagementState> emit) async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['csv', 'sql'],
      );

      if (result != null && result.files.single.path != null) {
        emit(DataOperationInProgress());
        final path = result.files.single.path!;
        final extension = result.files.single.extension?.toLowerCase();

        if (extension == 'csv') {
          final count = await _repository.importCsv(path);
          emit(DataOperationSuccess('Successfully imported $count new logs'));
        } else if (extension == 'sql') {
          await _repository.importSql(path);
          emit(const DataOperationSuccess('Full database restore complete'));
        } else {
          emit(const DataOperationFailure('Unsupported file format'));
        }
      }
    } catch (e) {
      emit(DataOperationFailure('Import failed: $e'));
    }
  }
}
