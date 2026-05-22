import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../viewmodels/log_exercise_bloc.dart';
import '../../../../core/widgets/app_search_bar.dart';

class VariationSelectionSlide extends StatefulWidget {
  const VariationSelectionSlide({super.key});

  @override
  State<VariationSelectionSlide> createState() => _VariationSelectionSlideState();
}

class _VariationSelectionSlideState extends State<VariationSelectionSlide> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LogExerciseBloc, LogExerciseState>(
      builder: (context, state) {
        if (state.selectedMovement == null || state.selectedMovement!.id == null) {
          return const SizedBox.shrink();
        }
        
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (state.selectedMovement != null)
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: _SelectedMovementLabel(name: state.selectedMovement!.name),
                ),
              ),
            AppSearchBar(
              controller: _controller,
              autofocus: false,
              onChanged: (val) => context.read<LogExerciseBloc>().add(SearchVariation(val)),
              hintText: 'Incline, Dumbbell...',
              style: AppSearchBarStyle.underlined,
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Builder(
                builder: (context) {
                  final query = state.variationQuery.trim().toLowerCase();
                  final allVariations = state.availableVariations;
                  final variations = query.isEmpty 
                      ? allVariations 
                      : allVariations.where((v) => v.toLowerCase().contains(query)).toList();

                  if (variations.isEmpty) {
                    return const Center(
                      child: Text('No variations available.', style: TextStyle(color: Color(0xFFA1A1AA))),
                    );
                  }

                  return GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      childAspectRatio: 2.5,
                    ),
                    itemCount: variations.length,
                    itemBuilder: (context, index) {
                      final vr = variations[index];
                      final isSelected = state.selectedVariations.contains(vr);
                      return GestureDetector(
                        onTap: () => context.read<LogExerciseBloc>().add(ToggleVariation(vr)),
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: isSelected ? const Color(0xFF52525B) : const Color(0xFF27272A),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            vr.toUpperCase(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: isSelected ? const Color(0xFFFAFAFA) : const Color(0xFFA1A1AA),
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () => context.read<LogExerciseBloc>().add(const AdvanceFromVariations()),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFAFAFA),
                  foregroundColor: const Color(0xFF09090B),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: const Text('NEXT', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, letterSpacing: 1)),
              ),
            ),
          ],
        );
      },
    );
  }
}



class _SelectedMovementLabel extends StatelessWidget {
  final String name;

  const _SelectedMovementLabel({required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: const Color(0xFF27272A),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: const Color(0xFF3F3F46), width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.fitness_center_rounded,
            color: Color(0xFF71717A),
            size: 12,
          ),
          const SizedBox(width: 6),
          Text(
            name,
            style: const TextStyle(
              color: Color(0xFFA1A1AA),
              fontSize: 12,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.3,
            ),
          ),
        ],
      ),
    );
  }
}
