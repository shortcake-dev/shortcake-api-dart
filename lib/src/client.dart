import 'package:graphql/client.dart';

class ShortcakeApi extends GraphQLClient {
  final String uri;

  ShortcakeApi(this.uri) : super(link: HttpLink(uri), cache: GraphQLCache());

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
