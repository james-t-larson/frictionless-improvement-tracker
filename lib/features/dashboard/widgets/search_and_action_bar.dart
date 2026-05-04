import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../viewmodels/dashboard_bloc.dart';
import '../../../core/widgets/app_search_bar.dart';


class SearchAndActionBar extends StatelessWidget {
  const SearchAndActionBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AppSearchBar(
            hintText: 'Search movements...',
            onChanged: (value) {
              context.read<DashboardBloc>().add(SearchDashboardLogs(value));
            },
            style: AppSearchBarStyle.boxed,
          ),
        ),
      ],
    );
  }
}
