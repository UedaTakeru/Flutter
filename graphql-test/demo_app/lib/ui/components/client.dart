import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

const String host = 'localhost';
final HttpLink httpLink = HttpLink('http://$host:4000');

final ValueNotifier<GraphQLClient> client =
    ValueNotifier(GraphQLClient(cache: GraphQLCache(), link: httpLink));