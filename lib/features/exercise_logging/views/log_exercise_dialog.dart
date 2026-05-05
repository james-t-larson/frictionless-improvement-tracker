import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/di/service_locator.dart';
import '../../../core/widgets/app_toast.dart';
import '../../dashboard/viewmodels/dashboard_bloc.dart';
import '../viewmodels/log_exercise_bloc.dart';
import 'carousel_slides.dart';

class LogExerciseDialog extends StatefulWidget {
  final int initialPage;
  final LogExerciseEvent? initialEvent;

  const LogExerciseDialog({
    super.key,
    this.initialPage = 0,
    this.initialEvent,
  });

  @override
  State<LogExerciseDialog> createState() => _LogExerciseDialogState();
}

class _LogExerciseDialogState extends State<LogExerciseDialog> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.initialPage);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LogExerciseBloc>()..add(widget.initialEvent ?? const InitializeFlow()),
      child: BlocListener<LogExerciseBloc, LogExerciseState>(
        listenWhen: (previous, current) =>
            previous.currentStep != current.currentStep || current.isSuccess,
        listener: (context, state) {
          if (state.isSuccess) {
            context.read<DashboardBloc>().add(LoadDashboardLogs());
            AppToast.show(context, 'Log saved successfully');
            Navigator.pop(context);

          } else {
            if (state.currentStep == ExerciseLogStep.variation) {
              FocusScope.of(context).unfocus();
            }
            _pageController.animateToPage(
              state.currentStep.slideIndex,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          }
        },
        child: Material(
          color: const Color(0xFF18181B),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height -
                    MediaQuery.of(context).viewInsets.bottom -
                    MediaQuery.of(context).padding.top,
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                children: [
                  BlocBuilder<LogExerciseBloc, LogExerciseState>(
                    builder: (context, state) {
                      String title = '';
                      switch (state.currentStep) {
                        case ExerciseLogStep.movement:
                          title = 'MOVEMENT';
                          break;
                        case ExerciseLogStep.variation:
                          title = 'VARIATION';
                          break;
                        case ExerciseLogStep.details:
                          title = 'METRICS';
                          break;
                      }

                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              if (state.currentStep.slideIndex > 0)
                                IconButton(
                                  icon: const Icon(Icons.chevron_left, color: Color(0xFFA1A1AA), size: 28),
                                  onPressed: () => context.read<LogExerciseBloc>().add(PreviousStepRequested()),
                                )
                              else
                                const SizedBox(width: 48),
                              const Spacer(),
                              Text(
                                title,
                                style: const TextStyle(
                                  color: Color(0xFFFAFAFA),
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 2,
                                ),
                              ),
                              const Spacer(),
                              IconButton(
                                icon: const Icon(Icons.close, color: Color(0xFFA1A1AA), size: 24),
                                onPressed: () => Navigator.pop(context),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Divider(color: const Color(0xFFFAFAFA).withValues(alpha: 0.1), height: 1),
                          const SizedBox(height: 16),
                        ],
                      );
                    },
                  ),
                  Expanded(
                    child: PageView(
                      controller: _pageController,
                      physics: const NeverScrollableScrollPhysics(),
                      children: const [
                        MovementSelectionSlide(),
                        VariationSelectionSlide(),
                        MetricsAndFeedbackSlide(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
  }
}
