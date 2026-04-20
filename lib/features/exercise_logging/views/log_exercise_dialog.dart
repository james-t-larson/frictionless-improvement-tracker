import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/di/service_locator.dart';
import '../../dashboard/viewmodels/dashboard_bloc.dart';
import '../viewmodels/log_exercise_bloc.dart';
import 'carousel_slides.dart';

class LogExerciseDialog extends StatefulWidget {
  const LogExerciseDialog({super.key});

  @override
  State<LogExerciseDialog> createState() => _LogExerciseDialogState();
}

class _LogExerciseDialogState extends State<LogExerciseDialog> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LogExerciseBloc>()..add(InitializeFlow()),
      child: BlocListener<LogExerciseBloc, LogExerciseState>(
        listenWhen: (previous, current) =>
            previous.currentSlideIndex != current.currentSlideIndex || current.isSuccess,
        listener: (context, state) {
          if (state.isSuccess) {
            context.read<DashboardBloc>().add(LoadDashboardLogs());
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Log saved successfully'),
                backgroundColor: Color(0xFF10B981),
                duration: Duration(seconds: 1),
              ),
            );
          } else {
            _pageController.animateToPage(
              state.currentSlideIndex,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          }
        },
        child: Dialog(
          backgroundColor: const Color(0xFF18181B),
          insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Container(
            width: double.infinity,
            constraints: const BoxConstraints(maxHeight: 600),
            padding: const EdgeInsets.all(24),
            child: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                MovementSelectionSlide(),
                EquipmentSelectionSlide(),
                MetricsEntrySlide(),
                FeedbackAndSaveSlide(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
