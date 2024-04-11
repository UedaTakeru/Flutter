// import 'package:flutter/material.dart';
// import 'package:graphql_flutter/graphql_flutter.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final HttpLink link = HttpLink('https://rickandmortyapi.com/graphql');
//     // ValueNotifierとは、値が変更されたときに通知を受け取ることができるクラス
//     ValueNotifier<GraphQLClient> client = ValueNotifier(
//       GraphQLClient(
//         // GraphQLClientは、GraphQLのクエリを実行するためのクラス
//         cache: GraphQLCache(), // GraphQLCacheは、クエリの結果をキャッシュするためのクラス
//         link: link, // linkは、GraphQLのエンドポイントを指定するためのクラス
//       ),
//     );

//     return GraphQLProvider(
//       // GraphQLProviderは、GraphQLのクエリを実行するためのクラス
//       client: client,
//       child: MaterialApp(
//         home: Home(),
//       ),
//     );
//   }
// }

// class Home extends StatelessWidget {
//   // GraphQLのクエリ
//   final String query = """
//     query GetCharactersAndLocation {
//       characters(page: 2, filter: { name: "rick" }) {
//         info {
//           count
//         }
//         results {
//           name
//         }
//       }
//       location(id: 1) {
//         id
//       }
//       episodesByIds(ids: [1, 2]) {
//         id
//       }
//     }
//   """;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('GraphQL Flutter Demo'),
//       ),
//       body: Query(
//         // Queryは、GraphQLのクエリを実行するためのクラス
//         options: QueryOptions(
//           // QueryOptionsは、GraphQLのクエリを実行するためのクラス
//           document: gql(query), // gqlは、GraphQLのクエリを実行するためのクラス
//         ),
//         // builderは、GraphQLのクエリの結果を表示するためのウィジェット
//         builder: (QueryResult result,
//             {VoidCallback? refetch, FetchMore? fetchMore}) {
//           if (result.hasException) {
//             return Text(result.exception.toString()); // クエリの実行に失敗した場合
//           }

//           if (result.isLoading) {
//             // クエリの実行中の場合
//             return Text('Loading');
//           }
//           // クエリの実行に成功した場合
//           List characters = result.data?['characters']['results'];
//           String locationId = result.data?['location']['id'];
//           List episodes = result.data?['episodesByIds'];

//           return ListView.builder(
//             itemCount: characters.length, // クエリの結果の件数
//             itemBuilder: (context, index) {
//               final character = characters[index]; // クエリの結果のデータ

//               return ListTile(
//                 title: Text(character['name']), // クエリの結果のデータのname
//                 subtitle:
//                     Text('Location ID: $locationId'), // クエリの結果のデータのlocationのid
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }