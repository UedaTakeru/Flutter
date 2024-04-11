import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final HttpLink httpLink = HttpLink(
      'http://localhost:4001/', // GraphQLサーバーのエンドポイントに適切なURLを指定してください
    );

    final ValueNotifier<GraphQLClient> client = ValueNotifier<GraphQLClient>(
      GraphQLClient(
        link: httpLink,
        cache: GraphQLCache(),
      ),
    );

    return GraphQLProvider(
      client: client,
      child: const MaterialApp(
        title: 'Flutter GraphQL Example',
        home: Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  final String query = """
    query GetBooks {
      test {
        title
        author
      }
    }
  """;

  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GraphQL Flutter Demo'),
      ),
      body: Query(
        options: QueryOptions(
          document: gql(query),
        ),
        builder: (QueryResult result, {FetchMore? fetchMore, void Function()? refetch}) {
          if (result.hasException) {
            return Text(result.exception.toString());
          }

          if (result.isLoading) {
            return const Text('Loading');
          }

          List books = result.data?['test'];

          return ListView.builder(
            itemCount: books.length,
            itemBuilder: (context, index) {
              final book = books[index];

              return ListTile(
                title: Text(book['title']),
                subtitle: Text('Author: ${book['author']}'),
              );
            },
          );
        },
      ),
    );
  }
}
