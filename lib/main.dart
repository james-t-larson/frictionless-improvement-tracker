import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'core/di/service_locator.dart';
import 'data/repositories/movement_repository.dart';
import 'features/dashboard/views/main_dashboard_screen.dart';
import 'features/dashboard/viewmodels/dashboard_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Setup DI and wait for DB
  await setupLocator();
  
  // Seed movements if empty
  await getIt<MovementRepository>().seedMovementsIfEmpty();

  runApp(const FrictionlessApp());
}

class FrictionlessApp extends StatelessWidget {
  const FrictionlessApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<DashboardBloc>()..add(LoadDashboardLogs()),
      child: MaterialApp(
        title: 'Frictionless Improvement Tracker',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          scaffoldBackgroundColor: const Color(0xFF09090B),
          colorScheme: const ColorScheme.dark(
            surface: Color(0xFF18181B),
            onSurface: Color(0xFFFAFAFA),
            primary: Color(0xFFFAFAFA),
            onPrimary: Color(0xFF09090B),
            secondary: Color(0xFF27272A),
            onSecondary: Color(0xFFA1A1AA),
          ),
          textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme).copyWith(
            displayLarge: GoogleFonts.inter(fontWeight: FontWeight.w700, color: const Color(0xFFFAFAFA)),
            titleLarge: GoogleFonts.inter(fontWeight: FontWeight.w700, fontSize: 20, color: const Color(0xFFFAFAFA)),
            bodyLarge: GoogleFonts.inter(fontWeight: FontWeight.w600, fontSize: 16, color: const Color(0xFFFAFAFA)),
            bodyMedium: GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: 14, color: const Color(0xFFA1A1AA)),
            labelSmall: GoogleFonts.inter(fontWeight: FontWeight.w400, fontSize: 12, color: const Color(0xFFA1A1AA)),
          ),
          dividerTheme: const DividerThemeData(
            color: Color(0xFF3F3F46),
            thickness: 1,
          ),
        ),
        home: const MainDashboardScreen(),
      ),
    );
  }
}
