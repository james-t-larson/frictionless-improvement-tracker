import 'package:flutter/material.dart';

enum AppSearchBarStyle {
  boxed,
  underlined,
}

class AppSearchBar extends StatefulWidget {
  final String hintText;
  final ValueChanged<String> onChanged;
  final VoidCallback? onClear;
  final VoidCallback? onFilterTap;
  final bool isFilterActive;
  final AppSearchBarStyle style;
  final bool autofocus;
  final TextEditingController? controller;
  final FocusNode? focusNode;

  const AppSearchBar({
    super.key,
    required this.hintText,
    required this.onChanged,
    this.onClear,
    this.onFilterTap,
    this.isFilterActive = false,
    this.style = AppSearchBarStyle.boxed,
    this.autofocus = false,
    this.controller,
    this.focusNode,
  });

  @override
  State<AppSearchBar> createState() => _AppSearchBarState();
}

class _AppSearchBarState extends State<AppSearchBar> {
  late final TextEditingController _controller;
  bool _showClearButton = false;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _showClearButton = _controller.text.isNotEmpty;
    _controller.addListener(_handleTextChanged);
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    } else {
      _controller.removeListener(_handleTextChanged);
    }
    super.dispose();
  }

  void _handleTextChanged() {
    final shouldShow = _controller.text.isNotEmpty;
    if (_showClearButton != shouldShow) {
      setState(() {
        _showClearButton = shouldShow;
      });
    }
  }

  void _clear() {
    _controller.clear();
    widget.onChanged('');
    widget.onClear?.call();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.style == AppSearchBarStyle.boxed) {
      return Container(
        height: 48,
        decoration: BoxDecoration(
          color: const Color(0xFF18181B),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color(0xFF27272A)),
        ),
        child: TextField(
          controller: _controller,
          focusNode: widget.focusNode,
          autofocus: widget.autofocus,
          onChanged: widget.onChanged,
          style: const TextStyle(color: Color(0xFFFAFAFA)),
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: const TextStyle(color: Color(0xFF71717A)),
            prefixIcon: const Icon(Icons.search, color: Color(0xFFA1A1AA), size: 20),
            suffixIcon: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (_showClearButton)
                  IconButton(
                    icon: const Icon(Icons.close_rounded, color: Color(0xFFA1A1AA), size: 20),
                    onPressed: _clear,
                  ),
                if (widget.onFilterTap != null)
                  IconButton(
                    icon: Icon(
                      Icons.tune_rounded, 
                      color: widget.isFilterActive ? const Color(0xFFFAFAFA) : const Color(0xFFA1A1AA), 
                      size: 20
                    ),
                    onPressed: widget.onFilterTap,
                  ),
              ],
            ),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(vertical: 12),
          ),
        ),
      );
    } else {
      // Underlined style
      return TextField(
        controller: _controller,
        focusNode: widget.focusNode,
        autofocus: widget.autofocus,
        onChanged: widget.onChanged,
        style: const TextStyle(color: Color(0xFFFAFAFA)),
        decoration: InputDecoration(
          hintText: widget.hintText,
          suffixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (_showClearButton)
                IconButton(
                  icon: const Icon(Icons.close_rounded, color: Color(0xFFA1A1AA), size: 20),
                  onPressed: _clear,
                ),
              if (widget.onFilterTap != null)
                IconButton(
                  icon: Icon(
                    Icons.tune_rounded, 
                    color: widget.isFilterActive ? const Color(0xFFFAFAFA) : const Color(0xFFA1A1AA), 
                    size: 20
                  ),
                  onPressed: widget.onFilterTap,
                ),
            ],
          ),
          border: const UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFF52525B))),
          enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFF52525B))),
          focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFFFAFAFA))),
        ),
      );
    }
  }
}
