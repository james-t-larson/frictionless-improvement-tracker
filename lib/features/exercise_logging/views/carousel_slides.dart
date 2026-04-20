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

// --- Slide 2: Equipment Selection ---
class EquipmentSelectionSlide extends StatelessWidget {
  const EquipmentSelectionSlide({super.key});

  static const equipments = [
    'Dumbbell', 'Barbell', 'Cables', 'Machine', 'Bodyweight', 'Kettlebell', 'Assisted'
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 2.5,
            ),
            itemCount: equipments.length,
            itemBuilder: (context, index) {
              final eq = equipments[index];
              return BlocBuilder<LogExerciseBloc, LogExerciseState>(
                builder: (context, state) {
                  final isSelected = state.selectedEquipment == eq;
                  return GestureDetector(
                    onTap: () => context.read<LogExerciseBloc>().add(SelectEquipment(eq)),
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: isSelected ? const Color(0xFF52525B) : const Color(0xFF27272A),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        eq.toUpperCase(),
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
      ],
    );
  }
}

// --- Slide 3: Metrics Entry ---
class MetricsEntrySlide extends StatefulWidget {
  const MetricsEntrySlide({super.key});

  @override
  State<MetricsEntrySlide> createState() => _MetricsEntrySlideState();
}

class _MetricsEntrySlideState extends State<MetricsEntrySlide> {
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _repsController = TextEditingController();

  @override
  void dispose() {
    _weightController.dispose();
    _repsController.dispose();
    super.dispose();
  }

  void _update() {
    final w = double.tryParse(_weightController.text) ?? 0.0;
    final r = int.tryParse(_repsController.text) ?? 0;
    context.read<LogExerciseBloc>().add(UpdateMetrics(w, r));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        BlocBuilder<LogExerciseBloc, LogExerciseState>(
          builder: (context, state) {
            return Text(
              state.lastPerformanceHint ?? '',
              style: const TextStyle(color: Color(0xFFA1A1AA), fontSize: 13),
            );
          },
        ),
        const SizedBox(height: 32),
        Row(
          children: [
            Expanded(
              child: _MetricInput(
                label: 'WEIGHT (LBS)',
                controller: _weightController,
                onChanged: (_) => _update(),
              ),
            ),
            const SizedBox(width: 24),
            Expanded(
              child: _MetricInput(
                label: 'REPS',
                controller: _repsController,
                onChanged: (_) => _update(),
              ),
            ),
          ],
        ),
        const Spacer(),
        SizedBox(
          width: double.infinity,
          height: 56,
          child: ElevatedButton(
            onPressed: () => context.read<LogExerciseBloc>().add(AdvanceSlide()),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFAFAFA),
              foregroundColor: const Color(0xFF09090B),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            child: const Text('NEXT', style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1)),
          ),
        ),
      ],
    );
  }
}

class _MetricInput extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final Function(String) onChanged;

  const _MetricInput({required this.label, required this.controller, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Color(0xFFA1A1AA), fontSize: 12, fontWeight: FontWeight.bold)),
        TextField(
          controller: controller,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
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

// --- Slide 4: Feedback & Save ---
class FeedbackAndSaveSlide extends StatelessWidget {
  const FeedbackAndSaveSlide({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        const Text(
          'Did you feel any abnormal pain during this set?',
          style: TextStyle(color: Color(0xFFFAFAFA), fontSize: 16),
        ),
        const SizedBox(height: 24),
        BlocBuilder<LogExerciseBloc, LogExerciseState>(
          builder: (context, state) {
            return Row(
              children: [
                Expanded(
                  child: _PainToggle(
                    label: 'YES',
                    isSelected: state.hasPain,
                    onTap: () => context.read<LogExerciseBloc>().add(const UpdatePain(true)),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _PainToggle(
                    label: 'NO',
                    isSelected: !state.hasPain, // Note: Logic might need refinement if null
                    onTap: () => context.read<LogExerciseBloc>().add(const UpdatePain(false)),
                  ),
                ),
              ],
            );
          },
        ),
        const Spacer(),
        BlocBuilder<LogExerciseBloc, LogExerciseState>(
          builder: (context, state) {
            return SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: state.isSaving ? null : () => context.read<LogExerciseBloc>().add(SaveLog()),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFAFAFA),
                  foregroundColor: const Color(0xFF09090B),
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
    );
  }
}

class _PainToggle extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _PainToggle({required this.label, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? (label == 'YES' ? const Color(0xFFEF4444).withAlpha(51) : const Color(0xFF52525B)) : const Color(0xFF27272A),
          borderRadius: BorderRadius.circular(8),
          border: isSelected ? Border.all(color: label == 'YES' ? const Color(0xFFEF4444) : const Color(0xFFFAFAFA)) : null,
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? const Color(0xFFFAFAFA) : const Color(0xFFA1A1AA),
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
