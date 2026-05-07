import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../viewmodels/dashboard_bloc.dart';
import 'workout_history_list_item.dart';

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
                final isExpanded = state.expandedDates.contains(date);

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        context.read<DashboardBloc>().add(ToggleDateExpansion(date));
                      },
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              date.toUpperCase(),
                              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                    fontSize: 14,
                                    letterSpacing: 1.5,
                                    color: const Color(0xFFA1A1AA),
                                  ),
                            ),
                            AnimatedRotation(
                              turns: isExpanded ? 0.5 : 0,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                              child: const Icon(
                                Icons.keyboard_arrow_down_rounded,
                                size: 20,
                                color: Color(0xFFA1A1AA),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    AnimatedSize(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      alignment: Alignment.topCenter,
                      child: isExpanded
                          ? Column(
                              children: [
                                ...logs.asMap().entries.map((entry) {
                                  final itemIndex = entry.key;
                                  final item = entry.value;
                                  // Only bounce the very first item of the very first date
                                  final shouldBounce = !state.hasSwipedBefore && index == 0 && itemIndex == 0;
                                  
                                  if (item is SingleLogItem) {
                                    return WorkoutLogRow(
                                      log: item.log,
                                      shouldBounce: shouldBounce,
                                      showCopyAction: true,
                                    );
                                  } else if (item is GroupedLogsItem) {
                                    return GroupedWorkoutLogRow(
                                      group: item,
                                      shouldBounce: shouldBounce,
                                    );
                                  }
                                  return const SizedBox.shrink();
                                }),
                                const Divider(indent: 16, endIndent: 16, color: Color(0xFF27272A)),
                              ],
                            )
                          : const SizedBox.shrink(),
                    ),
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
