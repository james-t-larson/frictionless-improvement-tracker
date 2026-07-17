import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/di/service_locator.dart';
import '../../../core/utils/one_rep_max_calculator.dart';
import '../../../data/models/workout_log.dart';
import '../viewmodels/one_rep_max_bloc.dart';
import '../viewmodels/one_rep_max_event.dart';
import '../viewmodels/one_rep_max_state.dart';

class OneRepMaxScreen extends StatelessWidget {
  const OneRepMaxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<OneRepMaxBloc>()..add(const LoadOneRepMaxData()),
      child: Scaffold(
        backgroundColor: const Color(0xFF09090B),
        appBar: AppBar(
          backgroundColor: const Color(0xFF09090B),
          elevation: 0,
          title: const Text(
            '1RM ESTIMATES',
            style: TextStyle(
              letterSpacing: 1.5,
              fontWeight: FontWeight.w900,
              color: Color(0xFFFAFAFA),
            ),
          ),
          iconTheme: const IconThemeData(color: Color(0xFFFAFAFA)),
        ),
        body: BlocBuilder<OneRepMaxBloc, OneRepMaxState>(
          builder: (context, state) {
            if (state is OneRepMaxLoading || state is OneRepMaxInitial) {
              return const Center(child: CircularProgressIndicator(color: Color(0xFFFAFAFA)));
            } else if (state is OneRepMaxError) {
              return Center(
                child: Text(
                  state.message,
                  style: const TextStyle(color: Color(0xFFEF4444)),
                ),
              );
            } else if (state is OneRepMaxLoaded) {
              final logs = state.latestLogs;
              return ListView(
                padding: const EdgeInsets.all(16.0),
                children: [
                  _buildLiftCard('Bench Press', logs['Bench Press']),
                  const SizedBox(height: 16),
                  _buildLiftCard('Squat', logs['Squat']),
                  const SizedBox(height: 16),
                  _buildLiftCard('Deadlift', logs['Deadlift']),
                  const SizedBox(height: 32),
                  const Text(
                    'Estimates based on the Epley formula using your latest barbell sets.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFA1A1AA),
                      fontSize: 12,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }

  Widget _buildLiftCard(String liftName, WorkoutLog? log) {
    if (log == null) {
      return Card(
        color: const Color(0xFF18181B),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Text(
                liftName,
                style: const TextStyle(
                  color: Color(0xFFFAFAFA),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'No barbell sets logged yet.',
                style: TextStyle(color: Color(0xFFA1A1AA)),
              ),
            ],
          ),
        ),
      );
    }

    final oneRepMax = OneRepMaxCalculator.calculate1RM(log.weight, log.reps);
    final percentages = OneRepMaxCalculator.getPercentages(oneRepMax);
    // Determine unit format (assuming lbs if not specified, usually just number)
    // Could format to 1 decimal if needed, but rounding to whole number is often better for plates.
    String formatWeight(double w) => w.toStringAsFixed(1).replaceAll(RegExp(r'\.0$'), '');

    return Card(
      color: const Color(0xFF18181B),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              liftName.toUpperCase(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xFFA1A1AA),
                fontSize: 14,
                fontWeight: FontWeight.w800,
                letterSpacing: 1.5,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '${formatWeight(oneRepMax)}',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xFFFAFAFA),
                fontSize: 48,
                fontWeight: FontWeight.w900,
              ),
            ),
            Text(
              'EST. 1RM (based on ${formatWeight(log.weight)} x ${log.reps})',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xFFA1A1AA),
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 24),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              alignment: WrapAlignment.center,
              children: percentages.entries.skip(1).map((entry) {
                return Container(
                  width: 90,
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFF27272A),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      Text(
                        '${entry.key}%',
                        style: const TextStyle(
                          color: Color(0xFFA1A1AA),
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        formatWeight(entry.value),
                        style: const TextStyle(
                          color: Color(0xFFFAFAFA),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
