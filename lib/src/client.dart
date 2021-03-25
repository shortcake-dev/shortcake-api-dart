import 'package:graphql/client.dart';

class ShortcakeClient extends GraphQLClient {
  final String uri;

  ShortcakeClient(this.uri) : super(link: HttpLink(uri), cache: GraphQLCache());

  Future<QueryResult> introspect() async {
    const query = r'''
      {
        __schema {
          types {
            name
          }
        }
      }
    ''';

    var queryOptions = QueryOptions(document: gql(query));

    return this.query(queryOptions);
  }
}
