import 'package:flutter/material.dart';

import 'app_routes.dart';
import 'models/product.dart';
import 'screens/product_detail_screen.dart';
import 'screens/product_list_screen.dart';

void main() {
  runApp(const MiniKatalogApp());
}

/// Uygulama kökü — StatelessWidget.
/// Tema ve rota yapılandırması burada yapılır; kendisi durum tutmaz.
class MiniKatalogApp extends StatelessWidget {
  const MiniKatalogApp({super.key});

  static ThemeData _buildTheme() {
    const seedColor = Colors.indigo;

    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: seedColor,
        brightness: Brightness.light,
        primary: Colors.indigo,
        secondary: Colors.deepPurple,
      ),
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        elevation: 0,
        scrolledUnderElevation: 1,
      ),
      cardTheme: CardThemeData(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: Colors.indigo.withValues(alpha: 0.12)),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  static Route<dynamic>? _onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const ProductListScreen(),
        );
      case AppRoutes.productDetail:
        final product = settings.arguments;
        if (product is! Product) {
          return MaterialPageRoute<void>(
            settings: settings,
            builder: (_) => const _InvalidArgumentScreen(),
          );
        }
        return MaterialPageRoute<bool>(
          settings: settings,
          builder: (_) => ProductDetailScreen(product: product),
        );
      default:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const _UnknownRouteScreen(),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mini Katalog',
      debugShowCheckedModeBanner: false,
      theme: _buildTheme(),
      initialRoute: AppRoutes.home,
      onGenerateRoute: _onGenerateRoute,
    );
  }
}

class _UnknownRouteScreen extends StatelessWidget {
  const _UnknownRouteScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mini Katalog')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.error_outline, size: 48),
            const SizedBox(height: 16),
            Text(
              'Sayfa bulunamadı',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 24),
            FilledButton(
              onPressed: () => Navigator.pushReplacementNamed(
                context,
                AppRoutes.home,
              ),
              child: const Text('Ana Sayfaya Dön'),
            ),
          ],
        ),
      ),
    );
  }
}

class _InvalidArgumentScreen extends StatelessWidget {
  const _InvalidArgumentScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mini Katalog')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.warning_amber_outlined, size: 48),
            const SizedBox(height: 16),
            Text(
              'Ürün bilgisi yüklenemedi',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 24),
            FilledButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Geri Dön'),
            ),
          ],
        ),
      ),
    );
  }
}
