import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../viewmodels/log_exercise_bloc.dart';

class CustomMovementSlide extends StatefulWidget {
  const CustomMovementSlide({super.key});

  @override
  State<CustomMovementSlide> createState() => _CustomMovementSlideState();
}

class _CustomMovementSlideState extends State<CustomMovementSlide> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.text = context.read<LogExerciseBloc>().state.movementQuery;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 24),
        const Text(
          'Workout Name',
          style: TextStyle(color: Color(0xFFA1A1AA), fontSize: 12, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: _controller,
          autofocus: true,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFFFAFAFA)),
          decoration: const InputDecoration(
            hintText: 'e.g. Incline Bench Press',
            hintStyle: TextStyle(color: Color(0xFF52525B)),
            border: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFF52525B))),
            enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFF52525B))),
            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFFFAFAFA))),
          ),
          onChanged: (val) {
            setState(() {});
          },
        ),
        const Spacer(),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: _controller.text.trim().isNotEmpty ? const Color(0xFFFAFAFA) : const Color(0xFF27272A),
            foregroundColor: _controller.text.trim().isNotEmpty ? const Color(0xFF18181B) : const Color(0xFFA1A1AA),
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          onPressed: _controller.text.trim().isNotEmpty
              ? () {
                  context.read<LogExerciseBloc>().add(AddCustomMovement(_controller.text.trim()));
                }
              : null,
          child: const Text('SAVE WORKOUT', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, letterSpacing: 1)),
        ),
      ],
    );
  }
}
