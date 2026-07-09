import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../viewmodels/dashboard_bloc.dart';
import '../../../core/widgets/app_search_bar.dart';
import '../../../core/widgets/filter_selection_sheet.dart';


class SearchAndActionBar extends StatelessWidget {
  const SearchAndActionBar({super.key});

  void _showFilterSheet(BuildContext context, DashboardLoaded state) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: const Color(0xFF18181B),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) => FilterSelectionSheet(
        title: 'Filter by Muscle Group',
        availableFilters: state.availableMuscleGroups,
        selectedFilters: state.selectedFilters,
        onSelectionChanged: (filters) {
          context.read<DashboardBloc>().add(ToggleDashboardFilters(filters));
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (context, state) {
        final isLoaded = state is DashboardLoaded;
        final selectedFilters = isLoaded ? state.selectedFilters : <String>{};

        return Row(
          children: [
            Expanded(
              child: AppSearchBar(
                hintText: 'Search movements...',
                onChanged: (value) {
                  context.read<DashboardBloc>().add(SearchDashboardLogs(value));
                },
                style: AppSearchBarStyle.boxed,
                isFilterActive: selectedFilters.isNotEmpty,
                onFilterTap: isLoaded ? () => _showFilterSheet(context, state) : null,
              ),
            ),
          ],
        );
      },
    );
  }
}
