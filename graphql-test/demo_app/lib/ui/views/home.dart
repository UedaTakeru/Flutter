import 'package:demo_app/data/user.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    const String allUsers = r'''
      query Users($published: Boolean!) {
        users(published: $published) {
          id
          name
          email
          profile {
            id
            bio
            userId
          }
          posts {
            id
            title
            content
            authorId
            published
          }
        }
      }
      ''';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Query(
          options: QueryOptions(
              document: gql(allUsers), variables: const {'published': false}),
          builder: (QueryResult result,
              {FetchMore? fetchMore, VoidCallback? refetch}) {
            if (result.hasException) {
              return Text('Error: ${result.exception.toString()}');
            }
            if (result.isLoading) {
              return const CircularProgressIndicator();
            }
            if (result.data == null || result.data!.isEmpty) {
              return const Text('No data');
            }
            final List<User> users = result.data!['users']
                .map((user) => User.fromJson(user))
                .toList()
                .cast<User>() as List<User>;

            return ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) => ListTile(
                      leading: const Icon(Icons.email),
                      title: Text(users[index].name),
                      subtitle: Text(users[index].email),
                    ));
          }),
    );
  }
}