import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../viewmodels/dashboard_bloc.dart';

class SearchAndActionBar extends StatelessWidget {
  const SearchAndActionBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 48,
            decoration: BoxDecoration(
              color: const Color(0xFF18181B),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color(0xFF27272A)),
            ),
            child: TextField(
              onChanged: (value) {
                context.read<DashboardBloc>().add(SearchDashboardLogs(value));
              },
              decoration: const InputDecoration(
                hintText: 'Search movements...',
                hintStyle: TextStyle(color: Color(0xFF71717A)),
                prefixIcon: Icon(Icons.search, color: Color(0xFFA1A1AA), size: 20),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 12),
              ),
              style: const TextStyle(color: Color(0xFFFAFAFA)),
            ),
          ),
        ),
      ],
    );
  }
}
