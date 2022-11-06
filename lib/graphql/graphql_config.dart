import 'package:graphql_flutter/graphql_flutter.dart';

import './../util/constants.dart';

class GQlConfiguration {
  static HttpLink httplink = HttpLink(Constants.endpoint);

  GraphQLClient myQlClient() {
    return GraphQLClient(link: httplink, cache: GraphQLCache());
  }
}
