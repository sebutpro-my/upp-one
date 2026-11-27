import 'package:material_ui/material_ui.dart';

void main() {
  runApp(const MyApp());
}

class AppAssets {
  static const String logoPrimary =
      'assets/logos/logo_primary.png';

  static const String logoWhite =
      'assets/logos/logo_white.PNG';

  static const String logoHorizontal =
      'assets/logos/logo_horizontal.png';

  static const String logoHorizontalWhite =
      'assets/logos/logo_horizontal_white.png';

  static const String logoMonogram =
      'assets/logos/logo_monogram.png';

  static const String logoMonogramWhite =
      'assets/logos/logo_monogram_white.png';
}

class AppColors {
  static const Color navy = Color(0xFF102B46);
  static const Color gold = Color(0xFFD4B577);
  static const Color lightBackground = Color(0xFFF5F7FA);
  static const Color darkBackground = Color(0xFF101C2C);
  static const Color darkSurface = Color(0xFF1C2D41);
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDarkMode = false;

  void _toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UPP ONE',
      debugShowCheckedModeBanner: false,
      themeMode:
          _isDarkMode ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.navy,
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor:
            AppColors.lightBackground,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.gold,
          brightness: Brightness.dark,
        ),
        scaffoldBackgroundColor:
            AppColors.darkBackground,
      ),
      home: LogoPreviewPage(
        isDarkMode: _isDarkMode,
        onToggleTheme: _toggleTheme,
      ),
    );
  }
}

class LogoPreviewPage extends StatelessWidget {
  final bool isDarkMode;
  final VoidCallback onToggleTheme;

  const LogoPreviewPage({
    super.key,
    required this.isDarkMode,
    required this.onToggleTheme,
  });

  @override
  Widget build(BuildContext context) {
    final Color textColor =
        isDarkMode ? Colors.white : AppColors.navy;

    final Color surfaceColor =
        isDarkMode
            ? AppColors.darkSurface
            : Colors.white;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.navy,
        foregroundColor: Colors.white,
        title: const Text(
          'UPP ONE',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            key: const Key('theme_toggle'),
            tooltip: isDarkMode
                ? 'Light Mode'
                : 'Dark Mode',
            onPressed: onToggleTheme,
            icon: Icon(
              isDarkMode
                  ? Icons.light_mode
                  : Icons.dark_mode,
              color: AppColors.gold,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 600,
            ),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 16),

                  Text(
                    'PENGUJIAN IDENTITI VISUAL',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: textColor,
                      fontSize: 12,
                      letterSpacing: 2,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 24),

                  Image.asset(
                    isDarkMode
                        ? AppAssets.logoWhite
                        : AppAssets.logoPrimary,
                    key: const Key('main_logo'),
                    height: 240,
                    fit: BoxFit.contain,
                  ),

                  const SizedBox(height: 20),

                  Text(
                    'Satu Sistem. Satu Pusat Data.\n'
                    'Satu Pengurusan.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.5,
                      fontWeight: FontWeight.w600,
                      color: textColor,
                    ),
                  ),

                  const SizedBox(height: 16),

                  Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.gold,
                        borderRadius:
                            BorderRadius.circular(20),
                      ),
                      child: Text(
                        isDarkMode
                            ? 'DARK MODE'
                            : 'LIGHT MODE',
                        style: const TextStyle(
                          color: AppColors.navy,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 32),

                  _buildLogoCard(
                    title: 'Logo Horizontal',
                    asset: isDarkMode
                        ? AppAssets.logoHorizontalWhite
                        : AppAssets.logoHorizontal,
                    height: 100,
                    surfaceColor: surfaceColor,
                    textColor: textColor,
                  ),

                  const SizedBox(height: 16),

                  _buildLogoCard(
                    title: 'Logo Monogram',
                    asset: isDarkMode
                        ? AppAssets.logoMonogramWhite
                        : AppAssets.logoMonogram,
                    height: 120,
                    surfaceColor: surfaceColor,
                    textColor: textColor,
                  ),

                  const SizedBox(height: 32),

                  Text(
                    'UPP ONE | Modul 1.1E',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      color: textColor,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    'Halaman Pengujian Aset Logo',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 11,
                      color: textColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLogoCard({
    required String title,
    required String asset,
    required double height,
    required Color surfaceColor,
    required Color textColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: surfaceColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
          const SizedBox(height: 16),
          Image.asset(
            asset,
            height: height,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}
