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
            return const SliverToBoxAdapter(child: SizedBox.shrink());
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
                    ...logs.asMap().entries.map((entry) {
                      final itemIndex = entry.key;
                      final item = entry.value;
                      // Only bounce the very first item of the very first date
                      final shouldBounce = !state.hasSwipedBefore && index == 0 && itemIndex == 0;
                      
                      if (item is SingleLogItem) {
                        return _WorkoutLogRow(
                          log: item.log,
                          shouldBounce: shouldBounce,
                          showCopyAction: true,
                        );
                      } else if (item is GroupedLogsItem) {
                        return _GroupedWorkoutLogRow(
                          group: item,
                          shouldBounce: shouldBounce,
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
  final bool shouldBounce;

  const _GroupedWorkoutLogRow({
    required this.group,
    this.shouldBounce = false,
  });

  @override
  State<_GroupedWorkoutLogRow> createState() => _GroupedWorkoutLogRowState();
}

class _GroupedWorkoutLogRowState extends State<_GroupedWorkoutLogRow> with TickerProviderStateMixin {
  late AnimationController _controller;
  late SlidableController _slidableController;
  late Animation<double> _heightFactor;
  bool _isExpanded = false;
  bool _isFullyClosed = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _heightFactor = _controller.drive(CurveTween(curve: Curves.easeInOut));

    _controller.addStatusListener((status) {
      final isNowFullyClosed = status == AnimationStatus.dismissed;
      if (isNowFullyClosed != _isFullyClosed) {
        setState(() {
          _isFullyClosed = isNowFullyClosed;
        });
      }
    });

    _slidableController = SlidableController(this);
    _slidableController.animation.addListener(_onSlidableAnimationChanged);
  }

  @override
  void didUpdateWidget(_GroupedWorkoutLogRow oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  void _onSlidableAnimationChanged() {
    if (_slidableController.ratio != 0) {
      context.read<DashboardBloc>().add(RecordSwipeAction());
      _slidableController.animation.removeListener(_onSlidableAnimationChanged);
    }
  }

  @override
  void dispose() {
    _slidableController.animation.removeListener(_onSlidableAnimationChanged);
    _slidableController.dispose();
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

  void _onDeleteAll(BuildContext context) {
    final dashboardBloc = context.read<DashboardBloc>();
    dashboardBloc.add(RecordSwipeAction());
    final logIds = widget.group.logs.map((log) => log.id!).toList();
    dashboardBloc.add(DashboardWorkoutGroupDeleted(logIds));
    AppToast.show(context, 'Group deleted');
  }

  void _onCopyLast(BuildContext context) {
    if (widget.group.logs.isNotEmpty) {
      final dashboardBloc = context.read<DashboardBloc>();
      dashboardBloc.add(RecordSwipeAction());
      dashboardBloc.add(DashboardDuplicateLastSet(widget.group.logs.first));
      AppToast.show(context, 'Set duplicated');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: ValueKey('group_${widget.group.logs.first.id}'),
      controller: _slidableController,
      endActionPane: ActionPane(
        extentRatio: 0.6,
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) => _onCopyLast(context),
            backgroundColor: const Color(0xFF3B82F6),
            foregroundColor: Colors.white,
            icon: Icons.copy_rounded,
            label: 'Copy Last',
          ),
          SlidableAction(
            onPressed: (context) => _onDeleteAll(context),
            backgroundColor: const Color(0xFFEF4444),
            foregroundColor: Colors.white,
            icon: Icons.delete_sweep_rounded,
            label: 'Delete all',
          ),
        ],
      ),
      child: _BouncingSwipeIndicator(
        enabled: widget.shouldBounce && _isFullyClosed,
        background: Row(
          children: [
            const Spacer(flex: 40),
            Expanded(
              flex: 30,
              child: Container(
                color: const Color(0xFF3B82F6),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.copy_rounded, color: Colors.white, size: 18),
                    SizedBox(height: 4),
                    Text('Copy Last', style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 30,
              child: Container(
                color: const Color(0xFFEF4444),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.delete_sweep_rounded, color: Colors.white, size: 18),
                    SizedBox(height: 4),
                    Text('Delete all', style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
          ],
        ),
        child: Column(
          children: [
            InkWell(
              onTap: _toggleExpansion,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                decoration: const BoxDecoration(
                  color: Color(0xFF18181B),
                  border: Border(
                    bottom: BorderSide(
                      color: Color(0xFF27272A),
                      width: 0.5,
                    ),
                  ),
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
        ),
      ),
    );
  }
}

class _WorkoutLogRow extends StatefulWidget {
  final WorkoutLog log;
  final bool shouldBounce;
  final bool showCopyAction;

  const _WorkoutLogRow({
    required this.log,
    this.shouldBounce = false,
    this.showCopyAction = false,
  });

  @override
  State<_WorkoutLogRow> createState() => _WorkoutLogRowState();
}

class _WorkoutLogRowState extends State<_WorkoutLogRow> with SingleTickerProviderStateMixin {
  late SlidableController _slidableController;

  @override
  void initState() {
    super.initState();
    _slidableController = SlidableController(this);
    _slidableController.animation.addListener(_onSlidableAnimationChanged);
  }

  void _onSlidableAnimationChanged() {
    if (_slidableController.ratio != 0) {
      context.read<DashboardBloc>().add(RecordSwipeAction());
      _slidableController.animation.removeListener(_onSlidableAnimationChanged);
    }
  }

  @override
  void dispose() {
    _slidableController.animation.removeListener(_onSlidableAnimationChanged);
    _slidableController.dispose();
    super.dispose();
  }

  void _onEdit(BuildContext context) async {
    // Fetch movement data first to match the "Add Set" logic and avoid carousel glitches
    final movement = await getIt<MovementRepository>().getMovementById(widget.log.movementId);
    if (movement == null) return;
    
    if (!context.mounted) return;

    context.read<DashboardBloc>().add(RecordSwipeAction());

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: Colors.transparent,
      builder: (_) => LogExerciseDialog(
        initialPage: 2,
        initialEvent: InitializeFlowForEdit(widget.log, movement: movement),
      ),
    );
  }

  void _onDelete(BuildContext context) {
    if (widget.log.id == null) return;
    
    // Show a snackbar with "Undo" is optional but recommended by spec
    final dashboardBloc = context.read<DashboardBloc>();
    dashboardBloc.add(RecordSwipeAction());
    dashboardBloc.add(DashboardWorkoutDeleted(widget.log.id!));
    
    AppToast.show(context, 'Log deleted');
  }

  void _onCopy(BuildContext context) {
    final dashboardBloc = context.read<DashboardBloc>();
    dashboardBloc.add(RecordSwipeAction());
    dashboardBloc.add(DashboardDuplicateLastSet(widget.log));
    AppToast.show(context, 'Set duplicated');
  }

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: ValueKey(widget.log.id),
      controller: _slidableController,
      endActionPane: ActionPane(
        extentRatio: widget.showCopyAction ? 0.75 : 0.6,
        motion: const ScrollMotion(),
        children: [
          if (widget.showCopyAction)
            SlidableAction(
              onPressed: (context) => _onCopy(context),
              backgroundColor: const Color(0xFF3B82F6),
              foregroundColor: Colors.white,
              icon: Icons.copy_rounded,
              label: 'Copy',
            ),
          SlidableAction(
            onPressed: (context) => _onEdit(context),
            backgroundColor: widget.showCopyAction ? const Color(0xFF6366F1) : const Color(0xFF3B82F6),
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
      child: _BouncingSwipeIndicator(
        enabled: widget.shouldBounce,
        background: Row(
          children: [
            const Spacer(flex: 30),
            if (widget.showCopyAction)
              Expanded(
                flex: 23,
                child: Container(
                  color: const Color(0xFF3B82F6),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.copy_rounded, color: Colors.white, size: 18),
                      SizedBox(height: 4),
                      Text('Copy', style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
            Expanded(
              flex: 23,
              child: Container(
                color: widget.showCopyAction ? const Color(0xFF6366F1) : const Color(0xFF3B82F6),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.edit, color: Colors.white, size: 18),
                    SizedBox(height: 4),
                    Text('Edit', style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 23,
              child: Container(
                color: const Color(0xFFEF4444),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.delete, color: Colors.white, size: 18),
                    SizedBox(height: 4),
                    Text('Delete', style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          decoration: const BoxDecoration(
            color: Color(0xFF18181B), // Match dashboard background
            border: Border(
              bottom: BorderSide(
                color: Color(0xFF27272A),
                width: 0.5,
              ),
            ),
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
                          widget.log.movementName ?? 'Unknown',
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: const Color(0xFFFAFAFA),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        if (widget.log.painFelt) ...[
                          const SizedBox(width: 8),
                          const Icon(Icons.warning_amber_rounded, color: Colors.orange, size: 16),
                        ],
                      ],
                    ),
                    if (widget.log.variations.isNotEmpty) ...[
                      const SizedBox(height: 4),
                      Text(
                        widget.log.variations.map((v) => v.name).join(', ').toUpperCase(),
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
                    '${widget.log.weight.toStringAsFixed(1)} lbs',
                    style: GoogleFonts.robotoMono(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: const Color(0xFFFAFAFA),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${widget.log.reps} REPS',
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

class _BouncingSwipeIndicator extends StatefulWidget {
  final Widget child;
  final Widget background;
  final bool enabled;

  const _BouncingSwipeIndicator({
    required this.child,
    required this.background,
    required this.enabled,
  });

  @override
  State<_BouncingSwipeIndicator> createState() => _BouncingSwipeIndicatorState();
}

class _BouncingSwipeIndicatorState extends State<_BouncingSwipeIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
       // Slower duration for a more premium feel
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    );
    _animation = TweenSequence<double>([
      TweenSequenceItem(
        // Larger bounce to show there's an action underneath
        tween: Tween(begin: 0.0, end: -40.0).chain(CurveTween(curve: Curves.easeInOutExpo)),
        weight: 20,
      ),
      TweenSequenceItem(
        tween: Tween(begin: -40.0, end: 0.0).chain(CurveTween(curve: Curves.bounceIn)),
        weight: 15,
      ),
      TweenSequenceItem(
        tween: ConstantTween<double>(0.0),
        weight: 65,
      ),
    ]).animate(_controller);

    if (widget.enabled) {
      _controller.repeat();
    }
  }

  @override
  void didUpdateWidget(_BouncingSwipeIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.enabled && !_controller.isAnimating) {
      _controller.repeat();
    } else if (!widget.enabled && _controller.isAnimating) {
      _controller.stop();
      _controller.value = 0;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.enabled) return widget.child;
    return Stack(
      children: [
        // Reveal the provided background behind the bouncing row
        Positioned.fill(child: widget.background),
        AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(_animation.value, 0),
              child: child,
            );
          },
          child: widget.child,
        ),
      ],
    );
  }
}
