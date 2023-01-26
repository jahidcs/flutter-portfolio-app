import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_api_portfolio/providers/searched_user_repo_provider.dart';

class RepoWidget extends ConsumerStatefulWidget {
  const RepoWidget({super.key});

  @override
  ConsumerState<RepoWidget> createState() => _RepoWidgetState();
}

class _RepoWidgetState extends ConsumerState<RepoWidget> {
  @override
  Widget build(BuildContext context) {
    final searchedRepositoryref = ref.watch(searchedRepositoryProvider('jahid11186'));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Repositories'),
        centerTitle: true,
        backgroundColor: const Color(0xffc8e6c9),
      ),
      body: searchedRepositoryref.when(
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
