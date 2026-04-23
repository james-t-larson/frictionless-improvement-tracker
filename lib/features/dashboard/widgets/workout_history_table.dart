import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/di/service_locator.dart';
import '../../../core/widgets/app_toast.dart';
import '../../../data/repositories/movement_repository.dart';
import '../viewmodels/dashboard_bloc.dart';
import '../../../data/models/workout_log.dart';
import '../../exercise_logging/viewmodels/log_exercise_bloc.dart';
import '../../exercise_logging/views/log_exercise_dialog.dart';

class WorkoutHistoryTable extends StatelessWidget {
  const WorkoutHistoryTable({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (context, state) {
        if (state is DashboardLoading) {
          return const SliverFillRemaining(
            child: Center(child: CircularProgressIndicator(color: Color(0xFFFAFAFA))),
          );
        }

        if (state is DashboardLoaded) {
          if (state.groupedLogs.isEmpty) {
            return const SliverFillRemaining(
              child: Center(
                child: Text(
                  'No logs found. Tap [+] to start.',
                  style: TextStyle(color: Color(0xFF71717A)),
                ),
              ),
            );
          }

          final dates = state.groupedLogs.keys.toList();

          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final date = dates[index];
                final logs = state.groupedLogs[date]!;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
                      child: Text(
                        date.toUpperCase(),
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontSize: 14,
                              letterSpacing: 1.5,
                              color: const Color(0xFFA1A1AA),
                            ),
                      ),
                    ),
                    ...logs.map((item) {
                      if (item is SingleLogItem) {
                        return _WorkoutLogRow(log: item.log);
                      } else if (item is GroupedLogsItem) {
                        return _GroupedWorkoutLogRow(
                          group: item,
                          query: state.query,
                        );
                      }
                      return const SizedBox.shrink();
                    }),
                    const Divider(indent: 16, endIndent: 16, color: Color(0xFF27272A)),
                  ],
                );
              },
              childCount: dates.length,
            ),
          );
        }

        return const SliverToBoxAdapter(child: SizedBox.shrink());
      },
    );
  }
}

class _GroupedWorkoutLogRow extends StatefulWidget {
  final GroupedLogsItem group;
  final String query;

  const _GroupedWorkoutLogRow({
    required this.group,
    required this.query,
  });

  @override
  State<_GroupedWorkoutLogRow> createState() => _GroupedWorkoutLogRowState();
}

class _GroupedWorkoutLogRowState extends State<_GroupedWorkoutLogRow> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _heightFactor;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _heightFactor = _controller.drive(CurveTween(curve: Curves.easeInOut));
    
    // Auto-expand if search query is present on init
    if (widget.query.isNotEmpty) {
      _isExpanded = true;
      _controller.value = 1.0;
    }
  }

  @override
  void didUpdateWidget(_GroupedWorkoutLogRow oldWidget) {
    super.didUpdateWidget(oldWidget);
    
    // If query changed
    if (widget.query != oldWidget.query) {
      if (widget.query.isNotEmpty) {
        // Auto-expand if search query is now present
        if (!_isExpanded) {
          setState(() {
            _isExpanded = true;
            _controller.forward();
          });
        }
      } else {
        // Auto-collapse when search is cleared
        if (_isExpanded) {
          setState(() {
            _isExpanded = false;
            _controller.reverse();
          });
        }
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleExpansion() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: _toggleExpansion,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: const BoxDecoration(
              color: Color(0xFF18181B),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            widget.group.movementName,
                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: const Color(0xFFFAFAFA),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              color: const Color(0xFF27272A),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              '${widget.group.totalSets} SETS',
                              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                color: const Color(0xFFA1A1AA),
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(width: 4),
                          AnimatedRotation(
                            turns: _isExpanded ? 0.5 : 0,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                            child: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              size: 22,
                              color: const Color(0xFFFAFAFA).withValues(alpha: 0.4),
                            ),
                          ),
                          if (widget.group.painFelt) ...[
                            const SizedBox(width: 8),
                            const Icon(Icons.warning_amber_rounded, color: Colors.orange, size: 16),
                          ],
                        ],
                      ),
                      if (widget.group.variations.isNotEmpty) ...[
                        const SizedBox(height: 4),
                        Text(
                          widget.group.variations.map((v) => v.name).join(', ').toUpperCase(),
                          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: const Color(0xFF71717A),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '${widget.group.maxWeight.toStringAsFixed(1)} lbs',
                      style: GoogleFonts.robotoMono(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: const Color(0xFFFAFAFA),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'MAX WEIGHT',
                      style: GoogleFonts.robotoMono(
                        fontWeight: FontWeight.w500,
                        fontSize: 10,
                        color: const Color(0xFF71717A),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizeTransition(
          sizeFactor: _heightFactor,
          axisAlignment: -1.0, // Top aligned
          child: Container(
            decoration: const BoxDecoration(
              color: Color(0xFF18181B),
            ),
            child: IntrinsicHeight(
              child: Row(
                children: [
                  const SizedBox(width: 16),
                  Container(
                    width: 2,
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFAFAFA).withValues(alpha: 0.3),
                      borderRadius: BorderRadius.circular(1),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: widget.group.logs.map((log) => _WorkoutLogRow(log: log)).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _WorkoutLogRow extends StatelessWidget {
  final WorkoutLog log;

  const _WorkoutLogRow({required this.log});

  void _onEdit(BuildContext context) async {
    // Fetch movement data first to match the "Add Set" logic and avoid carousel glitches
    final movement = await getIt<MovementRepository>().getMovementById(log.movementId);
    if (movement == null) return;
    
    if (!context.mounted) return;

    showDialog(
      context: context,
      builder: (_) => LogExerciseDialog(
        initialPage: 2,
        initialEvent: InitializeFlowForEdit(log, movement: movement),
      ),
    );
  }

  void _onDelete(BuildContext context) {
    if (log.id == null) return;
    
    // Show a snackbar with "Undo" is optional but recommended by spec
    final dashboardBloc = context.read<DashboardBloc>();
    dashboardBloc.add(DashboardWorkoutDeleted(log.id!));
    
    AppToast.show(context, 'Log deleted');

  }

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: ValueKey(log.id),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) => _onEdit(context),
            backgroundColor: const Color(0xFF3B82F6),
            foregroundColor: Colors.white,
            icon: Icons.edit,
            label: 'Edit',
          ),
          SlidableAction(
            onPressed: (context) => _onDelete(context),
            backgroundColor: const Color(0xFFEF4444),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
      child: InkWell(
        onTap: () => _onEdit(context),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: const BoxDecoration(
            color: Color(0xFF18181B), // Match dashboard background
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          log.movementName ?? 'Unknown',
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: const Color(0xFFFAFAFA),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        if (log.painFelt) ...[
                          const SizedBox(width: 8),
                          const Icon(Icons.warning_amber_rounded, color: Colors.orange, size: 16),
                        ],
                      ],
                    ),
                    if (log.variations.isNotEmpty) ...[
                      const SizedBox(height: 4),
                      Text(
                        log.variations.map((v) => v.name).join(', ').toUpperCase(),
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: const Color(0xFF71717A),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '${log.weight.toStringAsFixed(1)} lbs',
                    style: GoogleFonts.robotoMono(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: const Color(0xFFFAFAFA),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${log.reps} REPS',
                    style: GoogleFonts.robotoMono(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: const Color(0xFFA1A1AA),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
