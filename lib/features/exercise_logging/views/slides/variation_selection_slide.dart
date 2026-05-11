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
          children: [
            const SizedBox(height: 8),
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
                      : allVariations.where((v) => v.name.toLowerCase().contains(query)).toList();

                  final isNew = query.isNotEmpty && 
                      !variations.any((v) => v.name.toLowerCase() == query);

                  if (variations.isEmpty && !isNew) {
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
                    itemCount: variations.length + 1,
                    itemBuilder: (context, index) {
                      if (index == variations.length) {
                        return isNew 
                          ? _AddVariationButton(initialQuery: state.variationQuery)
                          : const _AddVariationButton();
                      }
                      final vr = variations[index];
                      final isSelected = state.selectedVariations.any((v) => v.id == vr.id && v.name == vr.name);
                      return GestureDetector(
                        onTap: () => context.read<LogExerciseBloc>().add(ToggleVariation(vr)),
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: isSelected ? const Color(0xFF52525B) : const Color(0xFF27272A),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            vr.name.toUpperCase(),
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

class _AddVariationButton extends StatelessWidget {
  final String? initialQuery;

  const _AddVariationButton({this.initialQuery});

  @override
  Widget build(BuildContext context) {
    if (initialQuery != null && initialQuery!.isNotEmpty) {
      return GestureDetector(
        onTap: () {
          context.read<LogExerciseBloc>().add(CreateAndSelectVariation(initialQuery!.trim()));
          context.read<LogExerciseBloc>().add(const SearchVariation('')); // clear search
        },
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: const Color(0xFF27272A),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: const Color(0xFF3F3F46),
              width: 1,
              style: BorderStyle.solid,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.add_rounded, color: Color(0xFFFAFAFA), size: 24),
              const SizedBox(height: 4),
              Text(
                'Add "$initialQuery"',
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Color(0xFFFAFAFA),
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: () => _showAddVariationDialog(context),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: const Color(0xFF27272A),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: const Color(0xFF3F3F46),
            width: 1,
            style: BorderStyle.solid,
          ),
        ),
        child: const Icon(
          Icons.add_rounded,
          color: Color(0xFFA1A1AA),
          size: 32,
        ),
      ),
    );
  }

  void _showAddVariationDialog(BuildContext context) {
    final controller = TextEditingController();
    final bloc = context.read<LogExerciseBloc>();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF18181B),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        title: const Text(
          'NEW VARIATION',
          style: TextStyle(
            color: Color(0xFFFAFAFA),
            fontSize: 14,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
        content: TextField(
          controller: controller,
          autofocus: true,
          style: const TextStyle(color: Color(0xFFFAFAFA)),
          cursorColor: const Color(0xFFFAFAFA),
          decoration: const InputDecoration(
            hintText: 'e.g. Incline, Wide Grip...',
            hintStyle: TextStyle(color: Color(0xFF52525B)),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF3F3F46)),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFFAFAFA)),
            ),
          ),
          onSubmitted: (val) {
            if (val.trim().isNotEmpty) {
              bloc.add(CreateAndSelectVariation(val.trim()));
              Navigator.pop(context);
            }
          },
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'CANCEL',
              style: TextStyle(color: Color(0xFFA1A1AA), fontWeight: FontWeight.bold),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (controller.text.trim().isNotEmpty) {
                bloc.add(CreateAndSelectVariation(controller.text.trim()));
                Navigator.pop(context);
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFAFAFA),
              foregroundColor: const Color(0xFF09090B),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
            ),
            child: const Text('ADD'),
          ),
        ],
      ),
    );
  }
}
