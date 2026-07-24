import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/di/service_locator.dart';
import '../viewmodels/set_counter_bloc.dart';
import '../viewmodels/set_counter_event.dart';
import '../viewmodels/set_counter_state.dart';

class SetCounterScreen extends StatelessWidget {
  const SetCounterScreen({super.key});

  static const List<String> _primaryMuscleGroups = [
    'Chest',
    'Back',
    'Shoulders',
    'Arms',
    'Biceps',
    'Legs',
    'Core',
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<SetCounterBloc>()..add(const LoadSetCounterData()),
      child: Scaffold(
        backgroundColor: const Color(0xFF09090B),
        appBar: AppBar(
          backgroundColor: const Color(0xFF09090B),
          elevation: 0,
          title: const Text(
            'SET COUNTER',
            style: TextStyle(
              letterSpacing: 1.5,
              fontWeight: FontWeight.w900,
              color: Color(0xFFFAFAFA),
            ),
          ),
          iconTheme: const IconThemeData(color: Color(0xFFFAFAFA)),
        ),
        body: BlocBuilder<SetCounterBloc, SetCounterState>(
          builder: (context, state) {
            if (state is SetCounterLoading || state is SetCounterInitial) {
              return const Center(child: CircularProgressIndicator(color: Color(0xFFFAFAFA)));
            } else if (state is SetCounterError) {
              return Center(
                child: Text(
                  state.message,
                  style: const TextStyle(color: Color(0xFFEF4444)),
                ),
              );
            } else if (state is SetCounterLoaded) {
              final counts = state.setCounts;
              return ListView(
                padding: const EdgeInsets.all(16.0),
                children: [
                  GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 1.1,
                    children: [
                      for (final group in _primaryMuscleGroups)
                        _buildMuscleGroupCard(group, counts[group] ?? 0),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Counts sets logged in the last 7 days (a rolling window, not the calendar week) grouped by each exercise\'s primary muscle group.',
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

  Widget _buildMuscleGroupCard(String groupName, int setCount) {
    return Card(
      color: const Color(0xFF18181B),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              groupName.toUpperCase(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xFFA1A1AA),
                fontSize: 12,
                fontWeight: FontWeight.w800,
                letterSpacing: 1.5,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '$setCount',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xFFFAFAFA),
                fontSize: 36,
                fontWeight: FontWeight.w900,
              ),
            ),
            Text(
              setCount == 1 ? 'SET IN LAST 7 DAYS' : 'SETS IN LAST 7 DAYS',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xFFA1A1AA),
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
