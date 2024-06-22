import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = useState(0);
    final pages = [const FirstPage(), const SecondPage(), const ThirdPage()];
    return Scaffold(
      appBar: AppBar(title: const Text('Riverpod Hooks')),
      body: pages[index.value],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: index.value,
          onTap: (int pageIndex) {
            index.value = pageIndex;
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
