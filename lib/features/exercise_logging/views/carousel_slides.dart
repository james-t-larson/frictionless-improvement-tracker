import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../viewmodels/log_exercise_bloc.dart';

// --- Slide 1: Movement Selection ---
class MovementSelectionSlide extends StatefulWidget {
  const MovementSelectionSlide({super.key});

  @override
  State<MovementSelectionSlide> createState() => _MovementSelectionSlideState();
}

class _MovementSelectionSlideState extends State<MovementSelectionSlide> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        TextField(
          controller: _controller,
          autofocus: true,
          onChanged: (val) => context.read<LogExerciseBloc>().add(SearchMovement(val)),
          decoration: const InputDecoration(
            hintText: 'Bench Press, Squat...',
            border: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFF52525B))),
            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFFFAFAFA))),
          ),
        ),
        const SizedBox(height: 16),
        Expanded(
          child: BlocBuilder<LogExerciseBloc, LogExerciseState>(
            builder: (context, state) {
              final isNew = state.movementQuery.isNotEmpty && 
                  !state.movementSearchResults.any((m) => m.name.toLowerCase() == state.movementQuery.toLowerCase());

              return ListView(
                children: [
                  if (state.movementQuery.isEmpty && state.movementSearchResults.isNotEmpty)
                    const Padding(
                      padding: EdgeInsets.only(left: 16, top: 8, bottom: 8),
                      child: Text(
                        'SUGGESTED',
                        style: TextStyle(
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
                  if (isNew)
                    ListTile(
                      leading: const Icon(Icons.add, color: Color(0xFFFAFAFA)),
                      title: Text('Add "${state.movementQuery}"', style: const TextStyle(color: Color(0xFFFAFAFA))),
                      onTap: () => context.read<LogExerciseBloc>().add(CreateAndSelectMovement(state.movementQuery)),
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

// --- Slide 2: Variation Selection ---
class VariationSelectionSlide extends StatelessWidget {
  const VariationSelectionSlide({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LogExerciseBloc, LogExerciseState>(
      builder: (context, state) {
        if (state.selectedMovement == null || state.selectedMovement!.id == null) {
          return const SizedBox.shrink();
        }
        
        return Column(
          children: [
            Expanded(
              child: Builder(
                builder: (context) {
                  final variations = state.availableVariations;
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
                    itemCount: variations.length + 1,
                    itemBuilder: (context, index) {
                      if (index == variations.length) {
                        return const _AddVariationButton();
                      }
                      final vr = variations[index];
                      // Check if variation is in selectedVariations
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

// --- Slide 3: Metrics & Feedback ---
class MetricsAndFeedbackSlide extends StatefulWidget {
  const MetricsAndFeedbackSlide({super.key});

  @override
  State<MetricsAndFeedbackSlide> createState() => _MetricsAndFeedbackSlideState();
}

class _MetricsAndFeedbackSlideState extends State<MetricsAndFeedbackSlide> {
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _repsController = TextEditingController();
  final FocusNode _weightFocusNode = FocusNode();
  final FocusNode _repsFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    final state = context.read<LogExerciseBloc>().state;
    // Pre-fill if we have data or we are in edit mode
    if (state.weight > 0 || state.editingLogId != null) {
      _weightController.text = state.weight.toStringAsFixed(1);
    }
    if (state.reps > 0 || state.editingLogId != null) {
      _repsController.text = state.reps.toString();
    }

    // Auto-focus weight input if this slide is active on initialization
    if (state.currentSlideIndex == 2) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _weightFocusNode.requestFocus();
      });
    }
  }

  @override
  void dispose() {
    _weightController.dispose();
    _repsController.dispose();
    _weightFocusNode.dispose();
    _repsFocusNode.dispose();
    super.dispose();
  }

  void _update() {
    final w = double.tryParse(_weightController.text) ?? 0.0;
    final r = int.tryParse(_repsController.text) ?? 0;
    context.read<LogExerciseBloc>().add(UpdateMetrics(w, r));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LogExerciseBloc, LogExerciseState>(
      listenWhen: (previous, current) => 
          previous.currentSlideIndex != current.currentSlideIndex || 
          (previous.weight != current.weight && previous.weight == 0) || 
          (previous.reps != current.reps && previous.reps == 0) ||
          (previous.editingLogId != current.editingLogId),
      listener: (context, state) {
        // Auto-focus weight when moving to metrics slide
        if (state.currentSlideIndex == 2) {
          _weightFocusNode.requestFocus();
        }

        // Only update if the field is currently empty or we just switched to edit mode
        if ((state.weight > 0 || state.editingLogId != null) && _weightController.text.isEmpty) {
          _weightController.text = state.weight.toStringAsFixed(1);
        }
        if ((state.reps > 0 || state.editingLogId != null) && _repsController.text.isEmpty) {
          _repsController.text = state.reps.toString();
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocBuilder<LogExerciseBloc, LogExerciseState>(
            builder: (context, state) {
              return Text(
                state.lastPerformanceHint ?? '',
                style: const TextStyle(color: Color(0xFFA1A1AA), fontSize: 13),
              );
            },
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: _MetricInput(
                  label: 'WEIGHT (LBS)',
                  controller: _weightController,
                  focusNode: _weightFocusNode,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  onChanged: (_) => _update(),
                ),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: _MetricInput(
                  label: 'REPS',
                  controller: _repsController,
                  focusNode: _repsFocusNode,
                  keyboardType: TextInputType.number,
                  onChanged: (_) => _update(),
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          const Text(
            'WAS THERE PAIN?',
            style: TextStyle(
              color: Color(0xFFA1A1AA),
              fontSize: 12,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 16),
          BlocBuilder<LogExerciseBloc, LogExerciseState>(
            builder: (context, state) {
              return Row(
                children: [
                  Expanded(
                    child: _PainToggleButton(
                      label: 'YES',
                      isSelected: state.painFelt,
                      onTap: () => context.read<LogExerciseBloc>().add(const TogglePain(true)),
                      activeColor: const Color(0xFFEF4444), // Red for pain
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _PainToggleButton(
                      label: 'NO',
                      isSelected: !state.painFelt,
                      onTap: () => context.read<LogExerciseBloc>().add(const TogglePain(false)),
                      activeColor: const Color(0xFF22C55E), // Green for no pain
                    ),
                  ),
                ],
              );
            },
          ),
          const SizedBox(height: 32),
          const Spacer(),
          BlocBuilder<LogExerciseBloc, LogExerciseState>(
            builder: (context, state) {
              return SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: (state.isSaving || state.weight <= 0 || state.reps <= 0) 
                      ? null 
                      : () => context.read<LogExerciseBloc>().add(const SaveLog()),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFAFAFA),
                    foregroundColor: const Color(0xFF09090B),
                    disabledBackgroundColor: const Color(0xFF27272A),
                    disabledForegroundColor: const Color(0xFF52525B),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: state.isSaving
                      ? const SizedBox(
                          height: 24,
                          width: 24,
                          child: CircularProgressIndicator(color: Color(0xFF09090B), strokeWidth: 2),
                        )
                      : const Text('SAVE SET', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, letterSpacing: 1)),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _MetricInput extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final TextInputType keyboardType;
  final Function(String) onChanged;

  const _MetricInput({
    required this.label,
    required this.controller,
    this.focusNode,
    this.keyboardType = const TextInputType.numberWithOptions(decimal: true),
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Color(0xFFA1A1AA), fontSize: 12, fontWeight: FontWeight.bold)),
        TextField(
          controller: controller,
          focusNode: focusNode,
          keyboardType: keyboardType,
          onChanged: onChanged,
          textAlign: TextAlign.center,
          style: GoogleFonts.robotoMono(fontSize: 32, fontWeight: FontWeight.bold, color: const Color(0xFFFAFAFA)),
          decoration: const InputDecoration(
            border: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFF52525B))),
            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFFFAFAFA))),
          ),
        ),
      ],
    );
  }
}

class _PainToggleButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final Color activeColor;

  const _PainToggleButton({
    required this.label,
    required this.isSelected,
    required this.onTap,
    required this.activeColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 48,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? activeColor.withOpacity(0.2) : const Color(0xFF27272A),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? activeColor : Colors.transparent,
            width: 1.5,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? activeColor : const Color(0xFFA1A1AA),
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
      ),
    );
  }
}

class _AddVariationButton extends StatelessWidget {
  const _AddVariationButton();

  @override
  Widget build(BuildContext context) {
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

