import '../string/erorr.dart';
import 'failure.dart';

String errormessage(Failure failure) {
  switch (failure.runtimeType) {
    case OfflineFailure:
      return OFFLINE_FAILURE_MESSAGE;

    case EmptyDataFailure:
      return EMPTY_DATA_FAILURE_MESSAGE;

    case ServerFailure:
      return SERVER_FAILURE_MESSAGE;

    default:
      return UNKNOWN_FAILURE_MESSAHE;
  }
}
