import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../viewmodels/log_exercise_bloc.dart';
import '../../../../core/widgets/app_search_bar.dart';

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
          AppSearchBar(
            controller: _controller,
            focusNode: _focusNode,
            autofocus: false,
            onChanged: (val) => context.read<LogExerciseBloc>().add(SearchMovement(val)),
            hintText: 'Bench Press, Squat...',
            style: AppSearchBarStyle.underlined,
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
                  if (state.movementQuery.trim().isNotEmpty && 
                      !state.movementSearchResults.any((m) => m.name.toLowerCase() == state.movementQuery.trim().toLowerCase()))
                    ListTile(
                      leading: const Icon(Icons.add, color: Color(0xFFFAFAFA)),
                      title: const Text(
                        'Add workout',
                        style: TextStyle(color: Color(0xFFFAFAFA), fontStyle: FontStyle.italic),
                      ),
                      onTap: () => context.read<LogExerciseBloc>().add(BeginAddCustomMovement()),
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
