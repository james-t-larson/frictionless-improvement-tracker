import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/di/service_locator.dart';
import '../../../data/models/workout_log.dart';
import '../../../data/repositories/movement_repository.dart';
import '../../../core/widgets/app_toast.dart';
import '../../exercise_logging/viewmodels/log_exercise_bloc.dart';
import '../../exercise_logging/views/log_exercise_dialog.dart';
import '../viewmodels/dashboard_bloc.dart';
import '../viewmodels/data_management_bloc.dart';
import '../widgets/workout_history_table.dart';
import '../widgets/search_and_action_bar.dart';
import '../widgets/app_sidebar.dart';

class MainDashboardScreen extends StatelessWidget {
  const MainDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<DataManagementBloc>()),
      ],
      child: Scaffold(
        extendBody: true,
        endDrawer: const AppSidebar(),
        body: BlocListener<DashboardBloc, DashboardState>(
          listener: (context, state) {
            if (state is DashboardError) {
              AppToast.show(context, 'Something went wrong', isError: true);
            }
          },
          child: SafeArea(
            bottom: false,
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
                  BlocBuilder<DashboardBloc, DashboardState>(
                    builder: (context, state) {
                      if (state is DashboardLoaded && state.allLogs.isEmpty) {
                        return SliverFillRemaining(
                          hasScrollBody: false,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 32),
                              child: ConstrainedBox(
                                constraints: const BoxConstraints(maxWidth: 300),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    _ActionButton(
                                      onPressed: () => _openNewLiftDialog(context),
                                      icon: Icons.fitness_center_rounded,
                                      label: 'NEW LIFT',
                                      isPrimary: true,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }

                      final hasRecords = state is DashboardLoaded && state.allLogs.isNotEmpty;
                      if (!hasRecords) {
                        return const SliverToBoxAdapter(child: SizedBox.shrink());
                      }
                      return const SliverPersistentHeader(
                        pinned: true,
                        delegate: _SearchHeaderDelegate(),
                      );
                    },
                  ),
                  const WorkoutHistoryTable(),
                  const SliverPadding(padding: EdgeInsets.only(bottom: 120)),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: BlocBuilder<DashboardBloc, DashboardState>(
          builder: (context, state) {
            final hasRecords = state is DashboardLoaded && state.allLogs.isNotEmpty;
            if (!hasRecords) return const SizedBox.shrink();

            return ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  color: const Color(0xFF09090B).withValues(alpha: 0.8),
                  child: SafeArea(
                    child: Builder(
                      builder: (context) {
                        WorkoutLog? lastLog;
                        if (state.allLogs.isNotEmpty) {
                          lastLog = state.allLogs.first;
                        }

                        final screenWidth = MediaQuery.of(context).size.width;
                        final isTablet = screenWidth > 600;

                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(height: 12),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: Divider(
                                color: const Color(0xFFFAFAFA).withValues(alpha: 0.1),
                                height: 1,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
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
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _openNewLiftDialog(BuildContext context) {
    final dashState = context.read<DashboardBloc>().state;
    final todaysMuscleGroupIds = dashState is DashboardLoaded
        ? dashState.todaysMuscleGroupIds
        : const <int>{};

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: Colors.transparent,
      builder: (context) => LogExerciseDialog(
        initialEvent: InitializeFlow(todaysMuscleGroupIds: todaysMuscleGroupIds),
      ),
    );
  }

  void _openAddSetDialog(BuildContext context, WorkoutLog lastLog) async {
    final movement = await getIt<MovementRepository>().getMovementById(lastLog.movementId);
    if (movement == null) return;

    if (!context.mounted) return;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: Colors.transparent,
      builder: (context) => LogExerciseDialog(
        metricsOnly: true,
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
