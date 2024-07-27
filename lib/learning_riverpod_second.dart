import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final nameProvider = Provider<String>((ref) {
  return "Hello Rahul";
});

class SecondExampleRiverpod extends StatelessWidget {
  const SecondExampleRiverpod({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Learning RiverPod"),
      ),
      body: Center(
        child: Consumer(
          builder: (context, ref, child) {
            final name = ref.watch(nameProvider);
            return Text("$name");
          },
        ),
      ),
    );
  }
}
