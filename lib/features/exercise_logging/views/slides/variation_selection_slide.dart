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
                  final allVariations = {...state.selectedVariations, ...state.availableVariations}.toList();
                  allVariations.sort((a, b) => a.compareTo(b));

                  final query = state.variationQuery.trim().toLowerCase();
                  final variations = query.isEmpty 
                      ? allVariations 
                      : allVariations.where((v) => v.toLowerCase().contains(query)).toList();

                  if (variations.isEmpty && allVariations.isNotEmpty) {
                    return const Center(
                      child: Text('No variations match your search.', style: TextStyle(color: Color(0xFFA1A1AA))),
                    );
                  } else if (variations.isEmpty) {
                    return const Center(
                      child: Text('No variations available.', style: TextStyle(color: Color(0xFFA1A1AA))),
                    );
                  }

                  return _AnimatedVariationsGrid(
                    variations: variations,
                    selectedVariations: state.selectedVariations,
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

class _AnimatedVariationsGrid extends StatefulWidget {
  final List<String> variations;
  final List<String> selectedVariations;

  const _AnimatedVariationsGrid({
    required this.variations,
    required this.selectedVariations,
  });

  @override
  State<_AnimatedVariationsGrid> createState() => _AnimatedVariationsGridState();
}

class _AnimatedVariationsGridState extends State<_AnimatedVariationsGrid> {
  final GlobalKey<AnimatedGridState> _gridKey = GlobalKey<AnimatedGridState>();
  late List<String> _currentVariations;

  @override
  void initState() {
    super.initState();
    _currentVariations = List.from(widget.variations);
  }

  @override
  void didUpdateWidget(_AnimatedVariationsGrid oldWidget) {
    super.didUpdateWidget(oldWidget);
    _updateList(widget.variations);
  }

  void _updateList(List<String> newList) {
    // 1. Remove items
    for (int i = _currentVariations.length - 1; i >= 0; i--) {
      if (!newList.contains(_currentVariations[i])) {
        final removedItem = _currentVariations[i];
        final removeIndex = i;
        _currentVariations.removeAt(i);
        _gridKey.currentState?.removeItem(
          removeIndex,
          (context, animation) => _buildItem(context, removedItem, false, animation), 
          duration: const Duration(milliseconds: 300),
        );
      }
    }
    
    // 2. Insert items
    for (int i = 0; i < newList.length; i++) {
      if (i >= _currentVariations.length || _currentVariations[i] != newList[i]) {
        _currentVariations.insert(i, newList[i]);
        _gridKey.currentState?.insertItem(i, duration: const Duration(milliseconds: 300));
      }
    }
  }

  Widget _buildItem(BuildContext context, String vr, bool isSelected, Animation<double> animation) {
    return ScaleTransition(
      scale: CurvedAnimation(parent: animation, curve: Curves.easeOutBack),
      child: FadeTransition(
        opacity: animation,
        child: GestureDetector(
          onTap: () => context.read<LogExerciseBloc>().add(ToggleVariation(vr)),
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isSelected ? const Color(0xFF52525B) : const Color(0xFF27272A),
              borderRadius: BorderRadius.circular(8),
              border: isSelected ? Border.all(color: const Color(0xFFFAFAFA), width: 1.5) : null,
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
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedGrid(
      key: _gridKey,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 2.5,
      ),
      initialItemCount: _currentVariations.length,
      itemBuilder: (context, index, animation) {
        final vr = _currentVariations[index];
        final isSelected = widget.selectedVariations.contains(vr);
        return _buildItem(context, vr, isSelected, animation);
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
