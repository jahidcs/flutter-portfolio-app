import 'package:flutter/material.dart';
import 'package:github_api_portfolio/providers/search_user_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_api_portfolio/views/widgets/repo_widget.dart';

class SearchWidget extends ConsumerStatefulWidget {
  const SearchWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends ConsumerState<SearchWidget> {
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final searchUserRef = ref.watch(userSearchProvider(
        _searchController.text.isEmpty ? null : _searchController.text));

    return Scaffold(
      backgroundColor: Colors.white70,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(32),
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                if (value.length > 5) {
                  setState(() {
                  });
                } else if (value.isEmpty) {
                  setState(() {});
                }
              },
            ),
          ),
          Expanded(
            child: searchUserRef.when(
                data: (data) {
                  if (data != null) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Column(
                            children: [
                              Stack(
                                alignment: Alignment.bottomRight,
                                children: [
                                  CircleAvatar(
                                    radius: 50,
                                    backgroundImage:
                                        NetworkImage(data.avatarUrl),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Text(
                                  data.name,
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        data.publicRepos.toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6,
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        'Repositories',
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1!
                                            .copyWith(color: Colors.grey),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        data.followers.toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6,
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        'Followers',
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1!
                                            .copyWith(color: Colors.grey),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        data.following.toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6,
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        'Following',
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1!
                                            .copyWith(color: Colors.grey),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              GestureDetector(
                                onTap: (() {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (BuildContext context) {
                                        return const RepoWidget();
                                      },
                                    ),
                                  );
                                }),
                                child: Container(
                                  width: double.infinity,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10.5, vertical: 5.0),
                                  decoration: BoxDecoration(
                                    color: const Color(0xffc8e6c9),
                                    borderRadius: BorderRadius.circular(15),
                                    // boxShadow: const [
                                    //   BoxShadow(
                                    //     color: Colors.black12,
                                    //     spreadRadius: 2,
                                    //     blurRadius: 2,
                                    //     offset: Offset(2, 2),
                                    //   ),
                                    // ],
                                  ),
                                  child: const ListTile(
                                    title: Text('Profile Info'),
                                    trailing:
                                        Icon(Icons.arrow_forward_ios_rounded),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              GestureDetector(
                                onTap: (() {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (BuildContext context) {
                                        return RepoWidget();
                                      },
                                    ),
                                  );
                                }),
                                child: Container(
                                  width: double.infinity,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10.5, vertical: 5.0),
                                  decoration: BoxDecoration(
                                    color: const Color(0xffc8e6c9),
                                    borderRadius: BorderRadius.circular(15),
                                    // boxShadow: const [
                                    //   BoxShadow(
                                    //     color: Colors.black12,
                                    //     spreadRadius: 2,
                                    //     blurRadius: 2,
                                    //     offset: Offset(2, 2),
                                    //   ),
                                    // ],
                                  ),
                                  child: const ListTile(
                                    title: Text('Repositories'),
                                    trailing:
                                        Icon(Icons.arrow_forward_ios_rounded),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  } else {
                    return const Center(
                      child: Text('User Not found'),
                    );
                  }
                },
                error: (error, stackTrace) => Center(
                      child: Text(
                        error.toString(),
                      ),
                    ),
                loading: () => const Center(
                      child: CircularProgressIndicator(),
                    )),
          ),
        ],
      ),
    );
  }
}


//     return GestureDetector(
//       onTap: () {
//         FocusScope.of(context).unfocus();
//       },
//       child: Scaffold(
//         body: SingleChildScrollView(
//           padding: const EdgeInsets.all(24),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 TextFormField(
//                   controller: _searchController,
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return "field can not be empty";
//                     }
//                     return null;
//                   },
//                   decoration: const InputDecoration(
//                     labelText: 'Search',
//                     prefixIcon: Icon(Icons.search),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 ElevatedButton(
//                   onPressed: onSearch,
//                   child: const Text('Search'),
//                 ),
//                 const SizedBox(
//                   height: 16,
//                 ),
//                 Expanded(child: searchUserRef.when())
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
