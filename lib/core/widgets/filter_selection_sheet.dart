import 'package:flutter/material.dart';

class FilterSelectionSheet extends StatefulWidget {
  final List<String> availableFilters;
  final Set<String> selectedFilters;
  final ValueChanged<Set<String>> onSelectionChanged;
  final String title;

  const FilterSelectionSheet({
    super.key,
    required this.availableFilters,
    required this.selectedFilters,
    required this.onSelectionChanged,
    this.title = 'Filter',
  });

  @override
  State<FilterSelectionSheet> createState() => _FilterSelectionSheetState();
}

class _FilterSelectionSheetState extends State<FilterSelectionSheet> {
  late Set<String> _currentSelection;

  @override
  void initState() {
    super.initState();
    _currentSelection = Set.from(widget.selectedFilters);
  }

  void _toggleFilter(String filter) {
    setState(() {
      if (_currentSelection.contains(filter)) {
        _currentSelection.remove(filter);
      } else {
        _currentSelection.add(filter);
      }
    });
    widget.onSelectionChanged(_currentSelection);
  }

  void _clearFilters() {
    setState(() {
      _currentSelection.clear();
    });
    widget.onSelectionChanged(_currentSelection);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).padding.bottom + 16,
        left: 16,
        right: 16,
        top: 24,
      ),
      // Set max height so it can scroll if there are many filters
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.7,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.title,
                style: const TextStyle(
                  color: Color(0xFFFAFAFA),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (_currentSelection.isNotEmpty)
                TextButton(
                  onPressed: _clearFilters,
                  child: const Text(
                    'Clear All',
                    style: TextStyle(
                      color: Color(0xFFA1A1AA),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: widget.availableFilters.isEmpty
                ? const Center(
                    child: Text(
                      'No filters available.',
                      style: TextStyle(color: Color(0xFFA1A1AA)),
                    ),
                  )
                : GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      childAspectRatio: 2.5,
                    ),
                    itemCount: widget.availableFilters.length,
                    itemBuilder: (context, index) {
                      final filter = widget.availableFilters[index];
                      final isSelected = _currentSelection.contains(filter);
                      return GestureDetector(
                        onTap: () => _toggleFilter(filter),
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: isSelected ? const Color(0xFF52525B) : const Color(0xFF27272A),
                            borderRadius: BorderRadius.circular(8),
                            border: isSelected ? Border.all(color: const Color(0xFFFAFAFA), width: 1.5) : null,
                          ),
                          child: Text(
                            filter.toUpperCase(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: isSelected ? const Color(0xFFFAFAFA) : const Color(0xFFA1A1AA),
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFAFAFA),
                foregroundColor: const Color(0xFF09090B),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              child: const Text(
                'APPLY',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, letterSpacing: 1),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
