import 'package:flutter/material.dart';

/// Ana ekran — StatefulWidget örneği.
/// setState ile yerel durum (state) yönetimi gösterilir.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _visitedCount = 0;

  void _incrementVisit() {
    setState(() => _visitedCount++);
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mini Katalog'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Icon(Icons.storefront_outlined, size: 72, color: colorScheme.primary),
            const SizedBox(height: 16),
            Text(
              'Hoş Geldiniz',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              'Bu ekran StatefulWidget kullanır. Aşağıdaki sayaç setState ile güncellenir.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text(
                      'Ziyaret sayısı',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '$_visitedCount',
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                            color: colorScheme.primary,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    const SizedBox(height: 16),
                    FilledButton.icon(
                      onPressed: _incrementVisit,
                      icon: const Icon(Icons.add),
                      label: const Text('Artır'),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            FilledButton.tonal(
              onPressed: () => Navigator.pushNamed(context, '/detail'),
              child: const Text('Detay Ekranına Git (StatelessWidget)'),
            ),
          ],
        ),
      ),
    );
  }
}
