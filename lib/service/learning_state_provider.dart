import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider = StateProvider<int>((ref) => 0);

class LearningStateProvider extends ConsumerWidget {
  const LearningStateProvider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterProvider);
    ref.listen(
      counterProvider,
      (previous, next) {
        if (next == 5) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("The value is $next")));
        }
      },
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("StateProvider"),
        actions: [
          IconButton(
            onPressed: () {
              // ref.invalidate(counterProvider);
              ref.refresh(counterProvider);
            },
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      body: Center(
        child: Text(count.toString()),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //ref.read(counterProvider.notifier).state++;
          ref.read(counterProvider.notifier).update(
                (state) => state + 1,
              );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
