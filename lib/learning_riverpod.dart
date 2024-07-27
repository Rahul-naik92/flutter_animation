import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final nameProvider = Provider<String>((ref) {
  return "Hello Rahul";
});

class LearningRiverPod extends ConsumerWidget {
  const LearningRiverPod({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = ref.watch(nameProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Learning RiverPod"),
      ),
      body: Center(
        child: Text(" $name"),
      ),
    );
  }
}
