import 'package:flutter/material.dart';
import 'package:flutter_animation/service/learning_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counerProvider =
    StateNotifierProvider<CounterDemo, int>((ref) => CounterDemo());

class MyCounterApp extends ConsumerWidget {
  const MyCounterApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counerProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifier Example Provider"),
        actions: [
          IconButton(
            onPressed: () {
              ref.refresh(counerProvider);
            },
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      body: Center(
        child: Text(counter.toString()),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counerProvider.notifier).increment();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
