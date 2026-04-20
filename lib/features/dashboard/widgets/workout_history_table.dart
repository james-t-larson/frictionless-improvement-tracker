import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../viewmodels/dashboard_bloc.dart';
import '../../../data/models/workout_log.dart';

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
                    ...logs.map((log) => _WorkoutLogRow(log: log)),
                    const Divider(indent: 16, endIndent: 16),
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

class _WorkoutLogRow extends StatelessWidget {
  final WorkoutLog log;

  const _WorkoutLogRow({required this.log});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  log.movementName ?? 'Unknown',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                if (log.variations.isNotEmpty) ...[
                  const SizedBox(height: 4),
                  Text(
                    log.variations.map((v) => v.name).join(', ').toUpperCase(),
                    style: Theme.of(context).textTheme.labelSmall,
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
    );
  }
}
