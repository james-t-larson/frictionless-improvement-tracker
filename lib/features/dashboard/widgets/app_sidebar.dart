import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/widgets/app_accordion.dart';
import '../../../core/widgets/app_toast.dart';
import '../viewmodels/data_management_bloc.dart';
import '../viewmodels/dashboard_bloc.dart';
import '../../one_rep_max/views/one_rep_max_screen.dart';

class AppSidebar extends StatelessWidget {
  const AppSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    final safeArea = MediaQuery.of(context).padding;

    return BlocListener<DataManagementBloc, DataManagementState>(
      listener: (context, state) {
        if (state is DataOperationSuccess) {
          AppToast.show(context, state.message);
          // Refresh dashboard on success
          context.read<DashboardBloc>().add(const LoadDashboardLogs());
        } else if (state is DataOperationFailure) {
          AppToast.show(context, state.error, isError: true);
        }
      },
      child: Drawer(
        width: MediaQuery.of(context).size.width * 0.8,
        backgroundColor: const Color(0xFF09090B),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: safeArea.top + 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'SETTINGS',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      letterSpacing: 2,
                      fontWeight: FontWeight.w900,
                      fontSize: 24,
                    ),
              ),
            ),
            const SizedBox(height: 32),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    AppAccordion(
                      title: 'Tools',
                      initialExpanded: true,
                      children: [
                        _SidebarActionTile(
                          icon: Icons.calculate_rounded,
                          label: '1RM Estimates',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const OneRepMaxScreen(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    AppAccordion(
                      title: 'Data Management',
                      initialExpanded: true,
                      children: [
                        _SidebarActionTile(
                          icon: Icons.storage_rounded,
                          label: 'Export SQL',
                          onTap: () {
                            context.read<DataManagementBloc>().add(ExportSqlRequested());
                          },
                        ),
                        _SidebarActionTile(
                          icon: Icons.download_rounded,
                          label: 'Import Data',
                          onTap: () => _handleImport(context),
                          isDestructive: false,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Text(
                'v1.0.0',
                style: TextStyle(
                  color: const Color(0xFFA1A1AA).withValues(alpha: 0.5),
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: safeArea.bottom),
          ],
        ),
      ),
    );
  }

  void _handleImport(BuildContext context) async {
    // We don't know if it's SQL or CSV until they pick it, 
    // but the Bloc handles the picking. 
    // However, the spec says SQL import should have a "Destructive Action" warning.
    // Since the Bloc handles picking, we can either:
    // 1. Show warning AFTER picking if it's SQL (Bloc state change?)
    // 2. Just warn that Import MIGHT be destructive if it's a backup.
    
    // Better: Add a generic warning that CSV merges and SQL restores.
    final proceed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF18181B),
        title: const Text('Import Data', style: TextStyle(color: Color(0xFFFAFAFA))),
        content: const Text(
          '• CSV files will be merged with your current data.\n'
          '• SQL files will PERMANENTLY OVERWRITE your current database.\n\n'
          'Do you want to proceed?',
          style: TextStyle(color: Color(0xFFA1A1AA)),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('CANCEL', style: TextStyle(color: Color(0xFFA1A1AA))),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('PROCEED', style: TextStyle(color: Color(0xFFFAFAFA), fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );

    if (proceed == true && context.mounted) {
      context.read<DataManagementBloc>().add(ImportRequested());
    }
  }
}

class _SidebarActionTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool isDestructive;

  const _SidebarActionTile({
    required this.icon,
    required this.label,
    required this.onTap,
    this.isDestructive = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
      leading: Icon(
        icon,
        color: isDestructive 
            ? const Color(0xFFEF4444) 
            : const Color(0xFFFAFAFA),
        size: 20,
      ),
      title: Text(
        label,
        style: TextStyle(
          color: isDestructive ? const Color(0xFFA1A1AA) : const Color(0xFFFAFAFA),
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
