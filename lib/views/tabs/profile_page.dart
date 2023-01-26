import 'package:flutter/material.dart';
import 'package:github_api_portfolio/providers/user_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_api_portfolio/views/widgets/repo_widget.dart';

class ProfileWidget extends ConsumerStatefulWidget {
  const ProfileWidget({super.key});

  @override
  ConsumerState<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends ConsumerState<ProfileWidget> {
  @override
  Widget build(BuildContext context) {
    final userRef = ref.watch(userProvider);
    return Scaffold(
        backgroundColor: Colors.white70,
        body: userRef.when(
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
                              backgroundImage: NetworkImage(data.avatarUrl),
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
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Text(
                                  data.publicRepos.toString(),
                                  style: Theme.of(context).textTheme.headline6,
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
                                  style: Theme.of(context).textTheme.headline6,
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
                                  style: Theme.of(context).textTheme.headline6,
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
                              trailing: Icon(Icons.arrow_forward_ios_rounded),
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
                              trailing: Icon(Icons.arrow_forward_ios_rounded),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }
            return null;
          },
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
        ));
  }
}
