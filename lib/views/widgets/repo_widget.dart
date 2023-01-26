import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_api_portfolio/providers/repository_providers.dart';

class RepoWidget extends ConsumerStatefulWidget {
  const RepoWidget({super.key});

  @override
  ConsumerState<RepoWidget> createState() => _RepoWidgetState();
}

class _RepoWidgetState extends ConsumerState<RepoWidget> {
  @override
  Widget build(BuildContext context) {
    final repositoryref = ref.watch(repositoryProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Repositories'),
        centerTitle: true,
        backgroundColor: const Color(0xffc8e6c9),
      ),
      body: repositoryref.when(
        data: ((data) {
          if (data.isNotEmpty) {
            return ListView.separated(
              itemBuilder: ((context, index) {
                return ListTile(
                  title: Text(data[index].name),
                  trailing: const Icon(Icons.arrow_forward),
                );
              }),
              separatorBuilder: (context, index) => const Divider(),
              itemCount: data.length,
            );
          } else {
            return const Center(
              child: Text('No Repos'),
            );
          }
        }),
        error: (error, stacktrace) {
          return Center(
            child: Text(
              error.toString(),
            ),
          );
        },
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
