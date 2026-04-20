import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
            context.read<DashboardBloc>().add(LoadDashboardLogs());
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
              const SliverPadding(padding: EdgeInsets.only(bottom: 100)),
            ],
          ),
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
