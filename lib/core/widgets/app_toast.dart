import 'package:flutter/material.dart';
import 'dart:ui';

class AppToast extends StatefulWidget {
  final String message;
  final bool isError;
  final VoidCallback onDismissed;

  const AppToast({
    super.key,
    required this.message,
    this.isError = false,
    required this.onDismissed,
  });

  static void show(BuildContext context, String message, {bool isError = false}) {
    final overlay = Overlay.of(context);
    late OverlayEntry entry;
    entry = OverlayEntry(
      builder: (context) => AppToast(
        message: message,
        isError: isError,
        onDismissed: () {
          entry.remove();
        },
      ),
    );
    overlay.insert(entry);
  }

  @override
  State<AppToast> createState() => _AppToastState();
}

class _AppToastState extends State<AppToast> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 3500),
      vsync: this,
    );

    _offsetAnimation = TweenSequence<Offset>([
      // Slide in from left
      TweenSequenceItem(
        tween: Tween<Offset>(begin: const Offset(-1.2, 0), end: Offset.zero)
            .chain(CurveTween(curve: Curves.easeOutCubic)),
        weight: 15,
      ),
      // Stay
      TweenSequenceItem(
        tween: ConstantTween<Offset>(Offset.zero),
        weight: 70,
      ),
      // Slide out to right
      TweenSequenceItem(
        tween: Tween<Offset>(begin: Offset.zero, end: const Offset(1.2, 0))
            .chain(CurveTween(curve: Curves.easeInCubic)),
        weight: 15,
      ),
    ]).animate(_controller);

    _controller.forward().then((_) {
      if (mounted) widget.onDismissed();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isLargeScreen = screenWidth > 600;
    
    final color = widget.isError ? const Color(0xFFEF4444) : const Color(0xFF10B981);
    
    return Positioned(
      top: MediaQuery.of(context).padding.top + 20,
      left: isLargeScreen ? 20 : 0,
      right: isLargeScreen ? null : 0,
      child: Material(
        color: Colors.transparent,
        child: SlideTransition(
          position: _offsetAnimation,
          child: Container(
            width: isLargeScreen ? 400 : screenWidth,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            decoration: BoxDecoration(
              color: const Color(0xFF18181B).withValues(alpha: 0.95),
              border: Border(
                left: BorderSide(color: color, width: 4),
                bottom: BorderSide(color: const Color(0xFF27272A), width: 1),
                top: BorderSide(color: const Color(0xFF27272A), width: 1),
                right: isLargeScreen ? BorderSide(color: const Color(0xFF27272A), width: 1) : BorderSide.none,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.4),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
              borderRadius: isLargeScreen ? BorderRadius.circular(12) : null,
            ),
            child: ClipRRect(
              borderRadius: isLargeScreen ? BorderRadius.circular(12) : BorderRadius.zero,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                child: Row(
                  children: [
                    Icon(
                      widget.isError ? Icons.error_outline_rounded : Icons.check_circle_outline_rounded,
                      color: color,
                      size: 24,
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        widget.message,
                        style: const TextStyle(
                          color: Color(0xFFFAFAFA),
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.2,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
