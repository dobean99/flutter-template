import 'package:networkx/networkx.dart';

typedef LoginNetworkError = NetworkError<LoginError>;

enum LoginError {
  badRequest
}

