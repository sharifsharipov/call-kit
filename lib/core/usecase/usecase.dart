import 'package:equatable/equatable.dart';

import '../utils/typedefs.dart';

abstract interface class UseCase<T, P> {
  ResultFuture<T> call(P params);
}

abstract interface class StreamUseCase<T, P> {
  ResultStream<T> call(P params);
}

final class NoParams extends Equatable {
  const NoParams();

  @override
  List<Object?> get props => const <Object?>[];
}
