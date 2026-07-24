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
  static const double _weightStep = 5;

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

  void _adjustWeight(double delta) {
    _debounceTimer?.cancel();
    final current = double.tryParse(_weightController.text) ?? 0.0;
    final next = (current + delta).clamp(0.0, double.infinity);
    final text = next.toStringAsFixed(1);
    _weightController.value = TextEditingValue(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
    );
    _update();
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
                  onDecrement: () => _adjustWeight(-_weightStep),
                  onIncrement: () => _adjustWeight(_weightStep),
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

const double _stepButtonSize = 22;

class _MetricInput extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final TextInputType keyboardType;
  final Function(String) onChanged;
  final VoidCallback? onDecrement;
  final VoidCallback? onIncrement;

  const _MetricInput({
    required this.label,
    required this.controller,
    this.focusNode,
    this.keyboardType = const TextInputType.numberWithOptions(decimal: true),
    required this.onChanged,
    this.onDecrement,
    this.onIncrement,
  });

  @override
  Widget build(BuildContext context) {
    final hasSteppers = onDecrement != null || onIncrement != null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Color(0xFFA1A1AA), fontSize: 12, fontWeight: FontWeight.bold)),
        if (hasSteppers)
          _SteppedMetricField(
            controller: controller,
            focusNode: focusNode,
            keyboardType: keyboardType,
            onChanged: onChanged,
            onDecrement: onDecrement,
            onIncrement: onIncrement,
          )
        else
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

/// The weight field's input + step buttons, laid out as Row siblings (not a
/// Stack overlay) so the buttons can never visually overlap the digits —
/// each has its own non-overlapping slice of the width, and the text field's
/// portion simply clips/scrolls like any input if a value gets too wide.
/// The underline is drawn manually across the whole row so it reads as one
/// input the same size as the reps field, since the TextField itself is
/// borderless here.
class _SteppedMetricField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode? focusNode;
  final TextInputType keyboardType;
  final Function(String) onChanged;
  final VoidCallback? onDecrement;
  final VoidCallback? onIncrement;

  const _SteppedMetricField({
    required this.controller,
    this.focusNode,
    required this.keyboardType,
    required this.onChanged,
    this.onDecrement,
    this.onIncrement,
  });

  @override
  Widget build(BuildContext context) {
    final row = Row(
      children: [
        if (onDecrement != null) _StepButton(icon: Icons.remove_rounded, onTap: onDecrement!),
        if (onDecrement != null) const SizedBox(width: 8),
        Expanded(
          child: TextField(
            controller: controller,
            focusNode: focusNode,
            keyboardType: keyboardType,
            onChanged: onChanged,
            textAlign: TextAlign.center,
            style: GoogleFonts.robotoMono(fontSize: 32, fontWeight: FontWeight.bold, color: const Color(0xFFFAFAFA)),
            decoration: const InputDecoration(
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              isCollapsed: true,
              contentPadding: EdgeInsets.symmetric(vertical: 8),
            ),
          ),
        ),
        if (onIncrement != null) const SizedBox(width: 8),
        if (onIncrement != null) _StepButton(icon: Icons.add_rounded, onTap: onIncrement!),
      ],
    );

    final node = focusNode;
    if (node == null) {
      return _underlined(row, focused: false);
    }
    return AnimatedBuilder(
      animation: node,
      builder: (context, _) => _underlined(row, focused: node.hasFocus),
    );
  }

  Widget _underlined(Widget child, {required bool focused}) {
    // foregroundDecoration (not decoration) so the border paints over the box
    // without reserving extra layout space for its stroke width — otherwise
    // this field ends up 1px taller than the reps field's UnderlineInputBorder,
    // which is drawn within the input decorator's existing bounds.
    return Container(
      key: const ValueKey('steppedMetricFieldBox'),
      foregroundDecoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: focused ? const Color(0xFFFAFAFA) : const Color(0xFF52525B)),
        ),
      ),
      child: child,
    );
  }
}

class _StepButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _StepButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFF27272A),
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: SizedBox(
          width: _stepButtonSize,
          height: _stepButtonSize,
          child: Icon(icon, color: const Color(0xFFFAFAFA), size: 12),
        ),
      ),
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
