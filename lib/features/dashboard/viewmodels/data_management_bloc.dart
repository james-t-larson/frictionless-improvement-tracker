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
    on<ImportRequested>(_onImportRequested);
  }

  Future<void> _onExportCsvRequested(ExportCsvRequested event, Emitter<DataManagementState> emit) async {
    emit(DataOperationInProgress());
    try {
      await _repository.exportToCsv();
      emit(const DataOperationSuccess('CSV exported successfully'));
    } catch (e) {
      emit(DataOperationFailure('Export failed: $e'));
    }
  }

  Future<void> _onImportRequested(ImportRequested event, Emitter<DataManagementState> emit) async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.any,
      );

      if (result != null && result.files.single.path != null) {
        emit(DataOperationInProgress());
        final path = result.files.single.path!;
        final fileName = result.files.single.name;
        
        // Try to get extension from PlatformFile, then fallback to filename, then fallback to path
        String? extension = result.files.single.extension?.toLowerCase();
        
        if (extension == null || extension.isEmpty) {
          final fileNameParts = fileName.split('.');
          if (fileNameParts.length > 1) {
            extension = fileNameParts.last.toLowerCase();
          }
        }

        if (extension == null || extension.isEmpty) {
          final pathParts = path.split('.');
          if (pathParts.length > 1) {
            extension = pathParts.last.toLowerCase();
          }
        }

        if (extension == 'csv') {
          final count = await _repository.importCsv(path);
          emit(DataOperationSuccess('Successfully imported $count new logs'));
        } else {
          emit(DataOperationFailure('Unsupported file: "$fileName". Expected .csv, got: .${extension ?? 'none'}'));
        }
      }
    } catch (e) {
      emit(DataOperationFailure('Import process failed: $e'));
    }
  }
}
