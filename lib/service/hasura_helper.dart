import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hasura_connect/hasura_connect.dart';

import 'hasura_token_interceptor.dart';

class HasuraHelper {
  static HasuraConnect? hasuraConnect;
  static HasuraConnect get hasuraHelper {
    hasuraConnect = HasuraConnect(
      dotenv.env['HASURA_ENDPOINT']!,
      interceptors: [TokenInterceptor()],
    );
    return hasuraConnect!;
  }
}


// class HasuraHelper {
//   static HasuraConnect hasuraConn() {
//     HasuraConnect hasuraConnect =
//         HasuraConnect(AppUtils.hasuraEndpoint, headers: {
//       "x-hasura-admin-secret":
//           "."
//     });
//     return hasuraConnect;
//   }
// }
// class HasuraHelperIsAnonyMous {
//   static HasuraConnect? hasuraConnect;
//   // static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
//   static HasuraConnect get hasuraHelper {
//     hasuraConnect = HasuraConnect(dotenv.env['HASURA_ENDPOINT']!
//         // , headers: {
//         //   "x-hasura-admin-secret": dotenv.env['ADMIN_SECRET']!,
//         // }
//         // interceptors: [TokenInterceptor(_firebaseAuth)],
//         );
//     return hasuraConnect!;
//   }
// }
