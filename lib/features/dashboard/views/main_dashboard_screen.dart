import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/di/service_locator.dart';
import '../../../data/models/workout_log.dart';
import '../../../data/repositories/movement_repository.dart';
import '../../exercise_logging/viewmodels/log_exercise_bloc.dart';
import '../../exercise_logging/views/log_exercise_dialog.dart';
import '../viewmodels/dashboard_bloc.dart';
import '../widgets/workout_history_table.dart';
import '../widgets/search_and_action_bar.dart';

class MainDashboardScreen extends StatelessWidget {
  const MainDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            context.read<DashboardBloc>().add(const LoadDashboardLogs());
          },
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                floating: true,
                backgroundColor: const Color(0xFF09090B),
                title: Text(
                  'FRICTIONLESS',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    letterSpacing: 2,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                centerTitle: false,
              ),
              const SliverPersistentHeader(
                pinned: true,
                delegate: _SearchHeaderDelegate(),
              ),
              const WorkoutHistoryTable(),
              const SliverPadding(padding: EdgeInsets.only(bottom: 24)),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: BlocBuilder<DashboardBloc, DashboardState>(
          builder: (context, state) {
            WorkoutLog? lastLog;
            if (state is DashboardLoaded && state.allLogs.isNotEmpty) {
              lastLog = state.allLogs.first;
            }

            final screenWidth = MediaQuery.of(context).size.width;
            final isTablet = screenWidth > 600;

            return Container(
              color: Colors.transparent, // Maintain background
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 12), // Small space below (12px)
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: isTablet ? 500 : double.infinity),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (lastLog != null) ...[
                      Expanded(
                        child: _ActionButton(
                          onPressed: () => _openAddSetDialog(context, lastLog!),
                          icon: Icons.add_rounded,
                          label: 'ADD SET',
                          isPrimary: false,
                        ),
                      ),
                      const SizedBox(width: 12),
                    ],
                    Expanded(
                      child: _ActionButton(
                        onPressed: () => _openNewLiftDialog(context),
                        icon: Icons.fitness_center_rounded,
                        label: 'NEW LIFT',
                        isPrimary: true,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _openNewLiftDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const LogExerciseDialog(),
    );
  }

  void _openAddSetDialog(BuildContext context, WorkoutLog lastLog) async {
    final movement = await getIt<MovementRepository>().getMovementById(lastLog.movementId);
    if (movement == null) return;

    if (!context.mounted) return;

    showDialog(
      context: context,
      builder: (context) => LogExerciseDialog(
        initialPage: 2,
        initialEvent: InitializeWithPreviousLog(
          movement: movement,
          selectedVariations: lastLog.variations,
        ),
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final String label;
  final bool isPrimary;

  const _ActionButton({
    required this.onPressed,
    required this.icon,
    required this.label,
    required this.isPrimary,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 20),
      label: Text(
        label,
        style: const TextStyle(
          fontWeight: FontWeight.w900,
          letterSpacing: 1.5,
          fontSize: 14,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: isPrimary ? const Color(0xFFFAFAFA) : const Color(0xFF27272A),
        foregroundColor: isPrimary ? const Color(0xFF09090B) : const Color(0xFFFAFAFA),
        minimumSize: const Size.fromHeight(56),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}

class _SearchHeaderDelegate extends SliverPersistentHeaderDelegate {
  const _SearchHeaderDelegate();

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: const Color(0xFF09090B),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: const SearchAndActionBar(),
    );
  }

  @override
  double get maxExtent => 64;

  @override
  double get minExtent => 64;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => false;
}
