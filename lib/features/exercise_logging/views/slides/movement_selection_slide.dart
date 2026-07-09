import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../viewmodels/log_exercise_bloc.dart';
import '../../../../core/widgets/app_search_bar.dart';
import '../../../../core/widgets/filter_selection_sheet.dart';
import '../log_exercise_dialog.dart';

class MovementSelectionSlide extends StatefulWidget {
  const MovementSelectionSlide({super.key});

  @override
  State<MovementSelectionSlide> createState() => _MovementSelectionSlideState();
}

class _MovementSelectionSlideState extends State<MovementSelectionSlide> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          BlocBuilder<LogExerciseBloc, LogExerciseState>(
            builder: (context, state) {
              return AppSearchBar(
                controller: _controller,
                focusNode: _focusNode,
                autofocus: false,
                onChanged: (val) => context.read<LogExerciseBloc>().add(SearchMovement(val)),
                hintText: 'Bench Press, Squat...',
                style: AppSearchBarStyle.underlined,
                isFilterActive: state.selectedMovementFilters.isNotEmpty,
                onFilterTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: const Color(0xFF18181B),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                    ),
                    builder: (_) => FilterSelectionSheet(
                      title: 'Filter by Muscle Group',
                      availableFilters: state.availableMuscleGroups,
                      selectedFilters: state.selectedMovementFilters,
                      onSelectionChanged: (filters) {
                        context.read<LogExerciseBloc>().add(ToggleMovementFilters(filters));
                      },
                    ),
                  );
                },
              );
            },
          ),
          const SizedBox(height: 16),
        Expanded(
          child: BlocBuilder<LogExerciseBloc, LogExerciseState>(
            builder: (context, state) {
              return ListView(
                children: [
                  if (state.movementQuery.isEmpty && state.movementSearchResults.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(left: 16, top: 8, bottom: 8),
                      child: Text(
                        state.suggestionLabel,
                        style: const TextStyle(
                          color: Color(0xFFA1A1AA),
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ...state.movementSearchResults.map((m) => ListTile(
                    title: Text(m.name, style: const TextStyle(color: Color(0xFFFAFAFA))),
                    onTap: () => context.read<LogExerciseBloc>().add(SelectMovement(m)),
                  )),
                  ListTile(
                    leading: const Icon(Icons.add, color: Color(0xFFFAFAFA)),
                    title: const Text(
                      'Add custom workout',
                      style: TextStyle(color: Color(0xFFFAFAFA), fontStyle: FontStyle.italic),
                    ),
                    onTap: () {
                      final query = state.movementQuery.trim();
                      Navigator.pop(context);
                      showDialog(
                        context: context,
                        builder: (context) => LogExerciseDialog(
                          createCustom: true,
                          initialEvent: BeginAddCustomMovement(query),
                        ),
                      );
                    },
                  ),

                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
