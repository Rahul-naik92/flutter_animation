import 'package:flutter/material.dart';
import 'package:flutter_animation/learning_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LearningThird extends ConsumerStatefulWidget {
  const LearningThird({super.key});

  @override
  ConsumerState<LearningThird> createState() => _LearningThirdState();
}

class _LearningThirdState extends ConsumerState<LearningThird> {
  @override
  Widget build(BuildContext context) {
    final name = ref.watch(nameProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("Day 3"),
      ),
      body: Center(
        child: Text("$name"),
      ),
    );
  }
}
