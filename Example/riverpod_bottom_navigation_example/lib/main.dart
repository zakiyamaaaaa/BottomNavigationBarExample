import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_bottom_navigation_example/page_index_provider.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomeScreen());
  }
}

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final indexProvider = ref.watch(pageIndexProvider);
    final pages = [const FirstPage(), const SecondPage(), const ThirdPage()];
    return Scaffold(
      appBar: AppBar(title: const Text('Riverpod')),
      body: pages[indexProvider],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: indexProvider,
          onTap: (int index) {
            ref.read(pageIndexProvider.notifier).update(index);
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorite'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Settings'),
          ]),
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
        color: Colors.yellow,
        child: Center(
          child:
              Text('First Page', style: Theme.of(context).textTheme.titleLarge),
        ));
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
        color: Colors.blue,
        child: Center(
          child: Text('Second Page',
              style: Theme.of(context).textTheme.titleLarge),
        ));
  }
}

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
        color: Colors.red,
        child: Center(
          child:
              Text('Third Page', style: Theme.of(context).textTheme.titleLarge),
        ));
  }
}
