import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../viewmodels/log_exercise_bloc.dart';

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
  Timer? _debounceTimer;

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
    if (state.currentStep == ExerciseLogStep.details) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _weightFocusNode.requestFocus();
      });
    }
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
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

  void _onWeightChanged(String value) {
    _update();
    
    _debounceTimer?.cancel();
    
    if (_weightFocusNode.hasFocus && value.isNotEmpty) {
      if (value.replaceAll('.', '').length >= 3) {
        _moveToReps();
      } else {
        _debounceTimer = Timer(const Duration(milliseconds: 1000), () {
          if (mounted && _weightFocusNode.hasFocus) {
            _moveToReps();
          }
        });
      }
    }
  }

  void _moveToReps() {
    if (_weightFocusNode.hasFocus) {
      _repsFocusNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LogExerciseBloc, LogExerciseState>(
      listenWhen: (previous, current) => 
          previous.currentStep != current.currentStep || 
          (previous.weight != current.weight && previous.weight == 0) || 
          (previous.reps != current.reps && previous.reps == 0) ||
          (previous.editingLogId != current.editingLogId),
      listener: (context, state) {
        // Auto-focus weight when moving to metrics slide, but only if focus isn't already set
        if (state.currentStep == ExerciseLogStep.details && !_weightFocusNode.hasFocus && !_repsFocusNode.hasFocus) {
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
                  Text(
                    state.lastPerformanceHint ?? '',
                    style: const TextStyle(color: Color(0xFFA1A1AA), fontSize: 13),
                  ),
                ],
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
                  onChanged: _onWeightChanged,
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
                      activeColor: const Color(0xFFEF4444),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _PainToggleButton(
                      label: 'NO',
                      isSelected: !state.painFelt,
                      onTap: () => context.read<LogExerciseBloc>().add(const TogglePain(false)),
                      activeColor: const Color(0xFF22C55E),
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
                  onPressed: (state.isSaving || state.weight < 0 || state.reps <= 0) 
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
          color: isSelected ? activeColor.withValues(alpha: 0.2) : const Color(0xFF27272A),
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
