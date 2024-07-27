import 'package:flutter/material.dart';
import 'package:flutter_animation/model/user_model.dart';
import 'package:flutter_animation/service/api_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final apiProvider = Provider<ApiService>(
  (ref) => ApiService(),
);

final userdDataProvider = FutureProvider<List<Data>>(
  (ref) {
    return ref.read(apiProvider).getUser();
  },
);

class UserDetailsScreen extends ConsumerWidget {
  const UserDetailsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userData = ref.watch(userdDataProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("User Details"),
      ),
      body: userData.when(
          data: (data) {
            return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text("${data[index].firstName}"),
                  );
                });
          },
          error: ((error, StackTrace) => Text(error.toString())),
          loading: (() {
            return Center(child: CircularProgressIndicator());
          })),
    );
  }
}
