import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_api_portfolio/providers/searched_user_repo_provider.dart';

class SearchedRepoWidget extends ConsumerStatefulWidget {
  const SearchedRepoWidget({super.key});

  @override
  ConsumerState<SearchedRepoWidget> createState() => _SearchedRepoWidgetState();
}

class _SearchedRepoWidgetState extends ConsumerState<SearchedRepoWidget> {
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
