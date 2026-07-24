import 'package:flutter/material.dart';

class MuscleGroupDetailScreen extends StatelessWidget {
  final String groupName;
  final Map<String, int> muscleCounts;

  const MuscleGroupDetailScreen({
    super.key,
    required this.groupName,
    required this.muscleCounts,
  });

  @override
  Widget build(BuildContext context) {
    final entries = muscleCounts.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    return Scaffold(
      backgroundColor: const Color(0xFF09090B),
      appBar: AppBar(
        backgroundColor: const Color(0xFF09090B),
        elevation: 0,
        title: Text(
          groupName.toUpperCase(),
          style: const TextStyle(
            letterSpacing: 1.5,
            fontWeight: FontWeight.w900,
            color: Color(0xFFFAFAFA),
          ),
        ),
        iconTheme: const IconThemeData(color: Color(0xFFFAFAFA)),
      ),
      body: entries.isEmpty
          ? const Center(
              child: Padding(
                padding: EdgeInsets.all(24.0),
                child: Text(
                  'No sets logged for this muscle group in the last 7 days.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Color(0xFFA1A1AA)),
                ),
              ),
            )
          : ListView.separated(
              padding: const EdgeInsets.all(16.0),
              itemCount: entries.length,
              separatorBuilder: (_, _) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final entry = entries[index];
                return _buildMuscleRow(entry.key, entry.value);
              },
            ),
    );
  }

  Widget _buildMuscleRow(String muscleName, int setCount) {
    return Card(
      color: const Color(0xFF18181B),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              muscleName.toUpperCase(),
              style: const TextStyle(
                color: Color(0xFFA1A1AA),
                fontSize: 13,
                fontWeight: FontWeight.w800,
                letterSpacing: 1.2,
              ),
            ),
            Text(
              '$setCount',
              style: const TextStyle(
                color: Color(0xFFFAFAFA),
                fontSize: 22,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
